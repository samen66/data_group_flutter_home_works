import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_29/features/tasks/domain/usecases/base_usecase.dart';
import 'package:home_29/features/tasks/domain/usecases/create_task.dart' as create_task_uc;
import 'package:home_29/features/tasks/domain/usecases/create_tag.dart' as create_tag_uc;
import 'package:home_29/features/tasks/domain/usecases/delete_task.dart' as delete_task_uc;
import 'package:home_29/features/tasks/domain/usecases/delete_tag.dart' as delete_tag_uc;
import 'package:home_29/features/tasks/domain/usecases/export_import.dart';
import 'package:home_29/features/tasks/domain/usecases/get_tags.dart' as get_tags_uc;
import 'package:home_29/features/tasks/domain/usecases/get_tasks.dart' as get_tasks_uc;
import 'package:home_29/features/tasks/domain/usecases/get_tasks_sorted.dart' as get_tasks_sorted_uc;
import 'package:home_29/features/tasks/domain/usecases/update_task.dart' as update_task_uc;
import 'package:home_29/features/tasks/domain/usecases/update_tag.dart' as update_tag_uc;
import 'package:home_29/features/tasks/presentation/bloc/task_event.dart';
import 'package:home_29/features/tasks/presentation/bloc/task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final get_tasks_uc.GetTasks getTasks;
  final get_tasks_uc.WatchTasks watchTasks;
  final get_tasks_sorted_uc.GetTasksSortedByDate getTasksSortedByDate;
  final get_tasks_sorted_uc.WatchTasksSortedByDate watchTasksSortedByDate;
  final get_tasks_sorted_uc.GetTasksSortedByPriority getTasksSortedByPriority;
  final get_tasks_sorted_uc.WatchTasksSortedByPriority watchTasksSortedByPriority;
  final create_task_uc.CreateTask createTask;
  final update_task_uc.UpdateTask updateTask;
  final delete_task_uc.DeleteTask deleteTask;
  final get_tags_uc.GetTags getTags;
  final get_tags_uc.WatchTags watchTags;
  final create_tag_uc.CreateTag createTag;
  final update_tag_uc.UpdateTag updateTag;
  final delete_tag_uc.DeleteTag deleteTag;
  final ExportToJson exportToJson;
  final ImportFromJson importFromJson;

  TaskBloc({
    required this.getTasks,
    required this.watchTasks,
    required this.getTasksSortedByDate,
    required this.watchTasksSortedByDate,
    required this.getTasksSortedByPriority,
    required this.watchTasksSortedByPriority,
    required this.createTask,
    required this.updateTask,
    required this.deleteTask,
    required this.getTags,
    required this.watchTags,
    required this.createTag,
    required this.updateTag,
    required this.deleteTag,
    required this.exportToJson,
    required this.importFromJson,
  }) : super(const TaskInitial()) {
    on<LoadTasks>(_onLoadTasks);
    on<WatchTasks>(_onWatchTasks);
    on<LoadTasksSortedByDate>(_onLoadTasksSortedByDate);
    on<WatchTasksSortedByDate>(_onWatchTasksSortedByDate);
    on<LoadTasksSortedByPriority>(_onLoadTasksSortedByPriority);
    on<WatchTasksSortedByPriority>(_onWatchTasksSortedByPriority);
    on<CreateTask>(_onCreateTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<LoadTags>(_onLoadTags);
    on<WatchTags>(_onWatchTags);
    on<CreateTag>(_onCreateTag);
    on<UpdateTag>(_onUpdateTag);
    on<DeleteTag>(_onDeleteTag);
    on<ExportData>(_onExportData);
    on<ImportData>(_onImportData);
  }

  Future<void> _onLoadTasks(LoadTasks event, Emitter<TaskState> emit) async {
    emit(const TaskLoading());
    final result = await getTasks(const NoParams());
    result.fold(
      (failure) => emit(TasksError(failure)),
      (tasks) => emit(TasksLoaded(tasks: tasks, isWatching: false)),
    );
  }

  Future<void> _onWatchTasks(WatchTasks event, Emitter<TaskState> emit) async {
    emit(const TaskLoading());
    await emit.forEach(
      watchTasks(const NoParams()),
      onData: (result) {
        return result.fold(
          (failure) => TasksError(failure),
          (tasks) => TasksLoaded(tasks: tasks, isWatching: true),
        );
      },
    );
  }

  Future<void> _onLoadTasksSortedByDate(
    LoadTasksSortedByDate event,
    Emitter<TaskState> emit,
  ) async {
    emit(const TaskLoading());
    final result = await getTasksSortedByDate(event.ascending);
    result.fold(
      (failure) => emit(TasksError(failure)),
      (tasks) => emit(TasksLoaded(tasks: tasks, isWatching: false)),
    );
  }

  Future<void> _onWatchTasksSortedByDate(
    WatchTasksSortedByDate event,
    Emitter<TaskState> emit,
  ) async {
    emit(const TaskLoading());
    await emit.forEach(
      watchTasksSortedByDate(event.ascending),
      onData: (result) {
        return result.fold(
          (failure) => TasksError(failure),
          (tasks) => TasksLoaded(tasks: tasks, isWatching: true),
        );
      },
    );
  }

  Future<void> _onLoadTasksSortedByPriority(
    LoadTasksSortedByPriority event,
    Emitter<TaskState> emit,
  ) async {
    emit(const TaskLoading());
    final result = await getTasksSortedByPriority(event.ascending);
    result.fold(
      (failure) => emit(TasksError(failure)),
      (tasks) => emit(TasksLoaded(tasks: tasks, isWatching: false)),
    );
  }

  Future<void> _onWatchTasksSortedByPriority(
    WatchTasksSortedByPriority event,
    Emitter<TaskState> emit,
  ) async {
    emit(const TaskLoading());
    await emit.forEach(
      watchTasksSortedByPriority(event.ascending),
      onData: (result) {
        return result.fold(
          (failure) => TasksError(failure),
          (tasks) => TasksLoaded(tasks: tasks, isWatching: true),
        );
      },
    );
  }

  Future<void> _onCreateTask(CreateTask event, Emitter<TaskState> emit) async {
    final result = await createTask(event.task);
    result.fold(
      (failure) => emit(TasksError(failure)),
      (_) => emit(const TaskCreated()),
    );
  }

  Future<void> _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) async {
    final result = await updateTask(event.task);
    result.fold(
      (failure) => emit(TasksError(failure)),
      (_) => emit(const TaskUpdated()),
    );
  }

  Future<void> _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) async {
    final result = await deleteTask(event.taskId);
    result.fold(
      (failure) => emit(TasksError(failure)),
      (_) => emit(const TaskDeleted()),
    );
  }

  Future<void> _onLoadTags(LoadTags event, Emitter<TaskState> emit) async {
    final result = await getTags(const NoParams());
    result.fold(
      (failure) => emit(TasksError(failure)),
      (tags) => emit(TagsLoaded(tags: tags)),
    );
  }

  Future<void> _onWatchTags(WatchTags event, Emitter<TaskState> emit) async {
    await emit.forEach(
      watchTags(const NoParams()),
      onData: (result) {
        return result.fold(
          (failure) => TasksError(failure),
          (tags) => TagsLoaded(tags: tags),
        );
      },
    );
  }

  Future<void> _onCreateTag(CreateTag event, Emitter<TaskState> emit) async {
    final result = await createTag(event.tag);
    result.fold(
      (failure) => emit(TasksError(failure)),
      (_) => emit(const TagCreated()),
    );
  }

  Future<void> _onUpdateTag(UpdateTag event, Emitter<TaskState> emit) async {
    final result = await updateTag(event.tag);
    result.fold(
      (failure) => emit(TasksError(failure)),
      (_) => emit(const TagUpdated()),
    );
  }

  Future<void> _onDeleteTag(DeleteTag event, Emitter<TaskState> emit) async {
    final result = await deleteTag(event.tagId);
    result.fold(
      (failure) => emit(TasksError(failure)),
      (_) => emit(const TagDeleted()),
    );
  }

  Future<void> _onExportData(ExportData event, Emitter<TaskState> emit) async {
    emit(const TaskLoading());
    final result = await exportToJson(const NoParams());
    result.fold(
      (failure) => emit(TasksError(failure)),
      (jsonData) => emit(ExportSuccess(jsonData)),
    );
  }

  Future<void> _onImportData(ImportData event, Emitter<TaskState> emit) async {
    emit(const TaskLoading());
    final result = await importFromJson(event.jsonString);
    result.fold(
      (failure) => emit(TasksError(failure)),
      (_) {
        emit(const ImportSuccess());
        add(const LoadTasks());
      },
    );
  }
}
