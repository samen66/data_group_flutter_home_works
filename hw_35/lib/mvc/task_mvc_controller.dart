import 'package:flutter/foundation.dart';

import '../core/error_handler.dart';
import '../core/task.dart';
import '../core/task_service.dart';

/// MVC: контроллер — реагирует на действия, вызывает сервис, обновляет «модель» состояния экрана.
class TaskMvcController extends ChangeNotifier {
  TaskMvcController(this._service, this._errorHandler);

  final TaskService _service;
  final ErrorHandler _errorHandler;

  List<Task> tasks = [];
  bool loading = false;

  Future<void> load() async {
    loading = true;
    notifyListeners();
    try {
      tasks = await _service.loadTasks();
    } catch (e, st) {
      _errorHandler.handle(e, st);
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  Future<void> add(String title) async {
    try {
      await _service.addTask(title);
      tasks = await _service.loadTasks();
      notifyListeners();
    } catch (e, st) {
      _errorHandler.handle(e, st);
    }
  }

  /// Для ручного теста: следующий [load] вызовет ошибку.
  void scheduleNextLoadFailure() {
    _service.failNextLoad = true;
  }
}
