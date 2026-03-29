import 'task.dart';

/// Исключения доменного слоя — обрабатываются через [ErrorHandler].
class TaskServiceException implements Exception {
  TaskServiceException(this.message);
  final String message;

  @override
  String toString() => message;
}

/// Бизнес-логика списка задач: загрузка и добавление (без UI).
class TaskService {
  TaskService();

  final List<Task> _tasks = [];
  int _seq = 0;
  bool failNextLoad = false;

  /// Загрузка списка (имитация сети).
  Future<List<Task>> loadTasks() async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    if (failNextLoad) {
      failNextLoad = false;
      throw TaskServiceException('Не удалось загрузить задачи');
    }
    return List<Task>.unmodifiable(_tasks);
  }

  /// Добавление задачи. Пустой заголовок или слово-триггер — ошибки для ручных тестов.
  Future<Task> addTask(String rawTitle) async {
    await Future<void>.delayed(const Duration(milliseconds: 200));
    final title = rawTitle.trim();
    if (title.isEmpty) {
      throw TaskServiceException('Введите текст задачи');
    }
    if (title.toLowerCase() == 'ошибка') {
      throw TaskServiceException('Сервер отклонил задачу (тестовая ошибка)');
    }
    _seq += 1;
    final task = Task(id: 't$_seq', title: title);
    _tasks.add(task);
    return task;
  }
}
