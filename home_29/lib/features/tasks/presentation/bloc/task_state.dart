import 'package:equatable/equatable.dart';
import 'package:home_29/core/error/failures.dart';
import 'package:home_29/features/tasks/domain/entities/task.dart';
import 'package:home_29/features/tasks/domain/entities/tag.dart';

abstract class TaskState extends Equatable {
  const TaskState();

  @override
  List<Object?> get props => [];
}

class TaskInitial extends TaskState {
  const TaskInitial();
}

class TaskLoading extends TaskState {
  const TaskLoading();
}

class TasksLoaded extends TaskState {
  final List<Task> tasks;
  final bool isWatching; // To distinguish between watch() and get()

  const TasksLoaded({required this.tasks, this.isWatching = false});

  @override
  List<Object?> get props => [tasks, isWatching];
}

class TasksError extends TaskState {
  final Failure failure;

  const TasksError(this.failure);

  @override
  List<Object?> get props => [failure];
}

class TagsLoaded extends TaskState {
  final List<Tag> tags;

  const TagsLoaded({required this.tags});

  @override
  List<Object?> get props => [tags];
}

class ExportSuccess extends TaskState {
  final String jsonData;

  const ExportSuccess(this.jsonData);

  @override
  List<Object?> get props => [jsonData];
}

class ImportSuccess extends TaskState {
  const ImportSuccess();
}

class TaskCreated extends TaskState {
  const TaskCreated();
}

class TaskUpdated extends TaskState {
  const TaskUpdated();
}

class TaskDeleted extends TaskState {
  const TaskDeleted();
}

class TagCreated extends TaskState {
  const TagCreated();
}

class TagUpdated extends TaskState {
  const TagUpdated();
}

class TagDeleted extends TaskState {
  const TagDeleted();
}
