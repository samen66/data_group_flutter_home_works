import 'package:flutter/material.dart';

import '../core/error_handler.dart';
import '../core/task.dart';
import '../core/task_service.dart';
import 'task_list_mvp_presenter.dart';
import 'task_mvp_contract.dart';

/// MVP: View реализует контракт и держит ссылку на Presenter.
class TaskListMvpScreen extends StatefulWidget {
  const TaskListMvpScreen({super.key});

  @override
  State<TaskListMvpScreen> createState() => _TaskListMvpScreenState();
}

class _TaskListMvpScreenState extends State<TaskListMvpScreen>
    implements TaskListMvpView {
  late final TaskListMvpPresenter _presenter;
  final _textController = TextEditingController();

  List<Task> _tasks = [];
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    final service = TaskService();
    _presenter = TaskListMvpPresenter(
      service,
      ErrorHandler(
        showMessage: (m) {
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(m)));
        },
      ),
      this,
    );
    _presenter.load();
  }

  @override
  void showLoading(bool visible) {
    setState(() => _loading = visible);
  }

  @override
  void showTasks(List<Task> tasks) {
    setState(() => _tasks = List<Task>.from(tasks));
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Список задач (MVP)'),
        actions: [
          IconButton(
            tooltip: 'Симулировать ошибку при следующей загрузке',
            onPressed: () {
              _presenter.scheduleNextLoadFailure();
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
            onPressed: _loading ? null : () => _presenter.load(),
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
          if (_loading)
            const LinearProgressIndicator(minHeight: 2),
          Expanded(
            child: _tasks.isEmpty && !_loading
                ? const Center(child: Text('Нет задач — добавьте первую'))
                : ListView.builder(
                    itemCount: _tasks.length,
                    itemBuilder: (context, i) {
                      final t = _tasks[i];
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
    _presenter.add(text);
  }
}
