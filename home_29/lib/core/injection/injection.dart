import 'package:get_it/get_it.dart';
import 'package:home_29/features/tasks/data/models/app_database.dart';
import 'package:home_29/features/tasks/data/repositories/task_repository_impl.dart';
import 'package:home_29/features/tasks/domain/repositories/task_repository.dart';
import 'package:home_29/features/tasks/domain/usecases/create_tag.dart';
import 'package:home_29/features/tasks/domain/usecases/create_task.dart';
import 'package:home_29/features/tasks/domain/usecases/delete_tag.dart';
import 'package:home_29/features/tasks/domain/usecases/delete_task.dart';
import 'package:home_29/features/tasks/domain/usecases/export_import.dart';
import 'package:home_29/features/tasks/domain/usecases/get_tags.dart';
import 'package:home_29/features/tasks/domain/usecases/get_tasks.dart';
import 'package:home_29/features/tasks/domain/usecases/get_tasks_sorted.dart';
import 'package:home_29/features/tasks/domain/usecases/update_tag.dart';
import 'package:home_29/features/tasks/domain/usecases/update_task.dart';
import 'package:home_29/features/tasks/presentation/bloc/task_bloc.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // Database
  getIt.registerLazySingleton<AppDatabase>(() => AppDatabase());

  // Repository
  getIt.registerLazySingleton<TaskRepository>(
    () => TaskRepositoryImpl(database: getIt()),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetTasks(getIt()));
  getIt.registerLazySingleton(() => WatchTasks(getIt()));
  getIt.registerLazySingleton(() => GetTasksSortedByDate(getIt()));
  getIt.registerLazySingleton(() => WatchTasksSortedByDate(getIt()));
  getIt.registerLazySingleton(() => GetTasksSortedByPriority(getIt()));
  getIt.registerLazySingleton(() => WatchTasksSortedByPriority(getIt()));
  getIt.registerLazySingleton(() => CreateTask(getIt()));
  getIt.registerLazySingleton(() => UpdateTask(getIt()));
  getIt.registerLazySingleton(() => DeleteTask(getIt()));
  getIt.registerLazySingleton(() => GetTags(getIt()));
  getIt.registerLazySingleton(() => WatchTags(getIt()));
  getIt.registerLazySingleton(() => CreateTag(getIt()));
  getIt.registerLazySingleton(() => UpdateTag(getIt()));
  getIt.registerLazySingleton(() => DeleteTag(getIt()));
  getIt.registerLazySingleton(() => ExportToJson(getIt()));
  getIt.registerLazySingleton(() => ImportFromJson(getIt()));

  // Bloc
  getIt.registerFactory(
    () => TaskBloc(
      getTasks: getIt(),
      watchTasks: getIt(),
      getTasksSortedByDate: getIt(),
      watchTasksSortedByDate: getIt(),
      getTasksSortedByPriority: getIt(),
      watchTasksSortedByPriority: getIt(),
      createTask: getIt(),
      updateTask: getIt(),
      deleteTask: getIt(),
      getTags: getIt(),
      watchTags: getIt(),
      createTag: getIt(),
      updateTag: getIt(),
      deleteTag: getIt(),
      exportToJson: getIt(),
      importFromJson: getIt(),
    ),
  );
}
