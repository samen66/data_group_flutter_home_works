import '../core/task.dart';

/// MVP: контракт View — пассивный; Presenter вызывает эти методы.
abstract class TaskListMvpView {
  void showLoading(bool visible);
  void showTasks(List<Task> tasks);
}
