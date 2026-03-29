import 'package:flutter/material.dart';

import '../core/error_handler.dart';
import '../core/task_service.dart';
import 'task_mvc_controller.dart';

/// MVC: View — только отображение и проброс событий в контроллер.
class TaskListMvcScreen extends StatefulWidget {
  const TaskListMvcScreen({super.key});

  @override
  State<TaskListMvcScreen> createState() => _TaskListMvcScreenState();
}

class _TaskListMvcScreenState extends State<TaskListMvcScreen> {
  late final TaskMvcController _controller;
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final service = TaskService();
    _controller = TaskMvcController(
      service,
      ErrorHandler(
        showMessage: (m) {
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(m)));
        },
      ),
    );
    _controller.addListener(_onModelChanged);
    _controller.load();
  }

  void _onModelChanged() {
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _controller.removeListener(_onModelChanged);
    _controller.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список задач (MVC)'),
        actions: [
          IconButton(
            tooltip: 'Симулировать ошибку при следующей загрузке',
            onPressed: () {
              _controller.scheduleNextLoadFailure();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Следующая загрузка завершится ошибкой'),
                ),
              );
            },
            icon: const Icon(Icons.bug_report_outlined),
          ),
          IconButton(
            tooltip: 'Обновить',
            onPressed: _controller.loading ? null : () => _controller.load(),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: const InputDecoration(
                      labelText: 'Новая задача',
                      hintText: 'Пусто / «ошибка» — для проверки ErrorHandler',
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _submit(),
                  ),
                ),
                const SizedBox(width: 8),
                FilledButton(
                  onPressed: _submit,
                  child: const Text('Добавить'),
                ),
              ],
            ),
          ),
          if (_controller.loading)
            const LinearProgressIndicator(minHeight: 2),
          Expanded(
            child: _controller.tasks.isEmpty && !_controller.loading
                ? const Center(child: Text('Нет задач — добавьте первую'))
                : ListView.builder(
                    itemCount: _controller.tasks.length,
                    itemBuilder: (context, i) {
                      final t = _controller.tasks[i];
                      return ListTile(title: Text(t.title));
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void _submit() {
    final text = _textController.text;
    _textController.clear();
    _controller.add(text);
  }
}
