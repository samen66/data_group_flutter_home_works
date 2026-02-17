import 'package:equatable/equatable.dart';
import 'package:home_29/features/tasks/domain/entities/task.dart';
import 'package:home_29/features/tasks/domain/entities/tag.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object?> get props => [];
}

class LoadTasks extends TaskEvent {
  const LoadTasks();
}

class WatchTasks extends TaskEvent {
  const WatchTasks();
}

class LoadTasksSortedByDate extends TaskEvent {
  final bool ascending;

  const LoadTasksSortedByDate({this.ascending = true});

  @override
  List<Object?> get props => [ascending];
}

class WatchTasksSortedByDate extends TaskEvent {
  final bool ascending;

  const WatchTasksSortedByDate({this.ascending = true});

  @override
  List<Object?> get props => [ascending];
}

class LoadTasksSortedByPriority extends TaskEvent {
  final bool ascending;

  const LoadTasksSortedByPriority({this.ascending = true});

  @override
  List<Object?> get props => [ascending];
}

class WatchTasksSortedByPriority extends TaskEvent {
  final bool ascending;

  const WatchTasksSortedByPriority({this.ascending = true});

  @override
  List<Object?> get props => [ascending];
}

class CreateTask extends TaskEvent {
  final Task task;

  const CreateTask(this.task);

  @override
  List<Object?> get props => [task];
}

class UpdateTask extends TaskEvent {
  final Task task;

  const UpdateTask(this.task);

  @override
  List<Object?> get props => [task];
}

class DeleteTask extends TaskEvent {
  final int taskId;

  const DeleteTask(this.taskId);

  @override
  List<Object?> get props => [taskId];
}

class LoadTags extends TaskEvent {
  const LoadTags();
}

class WatchTags extends TaskEvent {
  const WatchTags();
}

class CreateTag extends TaskEvent {
  final Tag tag;

  const CreateTag(this.tag);

  @override
  List<Object?> get props => [tag];
}

class UpdateTag extends TaskEvent {
  final Tag tag;

  const UpdateTag(this.tag);

  @override
  List<Object?> get props => [tag];
}

class DeleteTag extends TaskEvent {
  final int tagId;

  const DeleteTag(this.tagId);

  @override
  List<Object?> get props => [tagId];
}

class ExportData extends TaskEvent {
  const ExportData();
}

class ImportData extends TaskEvent {
  final String jsonString;

  const ImportData(this.jsonString);

  @override
  List<Object?> get props => [jsonString];
}
