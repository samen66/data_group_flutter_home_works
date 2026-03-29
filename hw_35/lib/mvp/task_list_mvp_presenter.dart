import '../core/error_handler.dart';
import '../core/task.dart';
import '../core/task_service.dart';
import 'task_mvp_contract.dart';

/// MVP: Presenter — вся оркестрация; не знает про Flutter-виджеты.
class TaskListMvpPresenter {
  TaskListMvpPresenter(
    this._service,
    this._errorHandler,
    this._view,
  );

  final TaskService _service;
  final ErrorHandler _errorHandler;
  final TaskListMvpView _view;

  List<Task> _tasks = [];

  Future<void> load() async {
    _view.showLoading(true);
    try {
      _tasks = await _service.loadTasks();
      _view.showTasks(_tasks);
    } catch (e, st) {
      _errorHandler.handle(e, st);
      _view.showTasks(_tasks);
    } finally {
      _view.showLoading(false);
    }
  }

  Future<void> add(String title) async {
    try {
      await _service.addTask(title);
      _tasks = await _service.loadTasks();
      _view.showTasks(_tasks);
    } catch (e, st) {
      _errorHandler.handle(e, st);
    }
  }

  void scheduleNextLoadFailure() {
    _service.failNextLoad = true;
  }
}
