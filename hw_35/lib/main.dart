import 'package:flutter/material.dart';

import 'mvc/task_list_mvc_screen.dart';
import 'mvp/task_list_mvp_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HW35 — MVC / MVP',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const PatternHomeScreen(),
    );
  }
}

/// Стартовый экран: выбор паттерна для сравнения.
class PatternHomeScreen extends StatelessWidget {
  const PatternHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Паттерны: список задач')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Один и тот же сценарий: загрузка списка и добавление задачи. '
            'Бизнес-логика в TaskService (load / add), ошибки через ErrorHandler.',
            style: TextStyle(height: 1.4),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => const TaskListMvcScreen(),
                ),
              );
            },
            icon: const Icon(Icons.account_tree_outlined),
            label: const Text('Открыть экран (MVC)'),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (_) => const TaskListMvpScreen(),
                ),
              );
            },
            icon: const Icon(Icons.layers_outlined),
            label: const Text('Открыть экран (MVP)'),
          ),
          const SizedBox(height: 32),
          Text(
            'Сравнение',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          const Text(
            'MVC: состояние и уведомления в ChangeNotifier-контроллере; View подписывается. '
            'Проще связать с Flutter, меньше файлов.',
            style: TextStyle(height: 1.4),
          ),
          const SizedBox(height: 8),
          const Text(
            'MVP: Presenter отдельно от виджета, View — интерфейс с showLoading/showTasks. '
            'Удобнее тестировать Presenter без виджетов, но State должен реализовать контракт и '
            'дублирует поля списка.',
            style: TextStyle(height: 1.4),
          ),
        ],
      ),
    );
  }
}
