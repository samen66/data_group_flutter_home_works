import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class AppKeys {
  static const todoList = Key('todo_list');
  static const loading = Key('loading_indicator');
  static const emptyState = Key('empty_state');
  static const errorText = Key('error_text');
  static const addInput = Key('add_input');
  static const addButton = Key('add_button');
  static const snackBarText = Key('snackbar_text');

  static Key todoItem(String id) => Key('todo_item_$id');
}

class TodoItem {
  const TodoItem({required this.id, required this.title});

  final String id;
  final String title;
}

abstract class TodoRepository {
  Future<List<TodoItem>> fetchTodos();
}

class DemoTodoRepository implements TodoRepository {
  const DemoTodoRepository();

  @override
  Future<List<TodoItem>> fetchTodos() async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return const [];
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, TodoRepository? repository})
    : repository = repository ?? const DemoTodoRepository();

  final TodoRepository repository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo List',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo)),
      home: TodoListScreen(repository: repository),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key, required this.repository});

  final TodoRepository repository;

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<TodoItem> _items = [];
  bool _isLoading = true;
  String? _errorMessage;
  int _idCounter = 0;

  @override
  void initState() {
    super.initState();
    unawaited(_loadTodos());
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<void> _loadTodos() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final todos = await widget.repository.fetchTodos();
      if (!mounted) {
        return;
      }
      setState(() {
        _items
          ..clear()
          ..addAll(todos);
      });
    } catch (_) {
      if (!mounted) {
        return;
      }
      const message = 'Ошибка загрузки списка';
      setState(() {
        _errorMessage = message;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(message, key: AppKeys.snackBarText)),
      );
    } finally {
      if (!mounted) {
        return;
      }
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _addItem() {
    final text = _textController.text.trim();
    if (text.isEmpty) {
      return;
    }

    setState(() {
      _idCounter++;
      _items.add(TodoItem(id: _idCounter.toString(), title: text));
      _textController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Список задач')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    key: AppKeys.addInput,
                    controller: _textController,
                    decoration: const InputDecoration(hintText: 'Введите задачу'),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  key: AppKeys.addButton,
                  onPressed: _addItem,
                  child: const Text('Добавить'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(key: AppKeys.loading),
                    )
                  : _errorMessage != null
                  ? Center(child: Text(_errorMessage!, key: AppKeys.errorText))
                  : _items.isEmpty
                  ? const Center(
                      child: Text('Список пуст', key: AppKeys.emptyState),
                    )
                  : ListView.builder(
                      key: AppKeys.todoList,
                      itemCount: _items.length,
                      itemBuilder: (context, index) {
                        final item = _items[index];
                        return ListTile(
                          key: AppKeys.todoItem(item.id),
                          title: Text(item.title),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (_) => TodoDetailScreen(item: item),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class TodoDetailScreen extends StatelessWidget {
  const TodoDetailScreen({super.key, required this.item});

  final TodoItem item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Детали')),
      body: Center(child: Text(item.title)),
    );
  }
}
