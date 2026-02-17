import 'package:dartz/dartz.dart' hide Task;
import 'package:home_29/core/error/failures.dart';
import 'package:home_29/features/tasks/domain/entities/task.dart';
import 'package:home_29/features/tasks/domain/entities/tag.dart';

abstract class TaskRepository {
  Future<Either<Failure, List<Task>>> getTasks();
  Stream<Either<Failure, List<Task>>> watchTasks();
  Future<Either<Failure, List<Task>>> getTasksSortedByDate({bool ascending = true});
  Stream<Either<Failure, List<Task>>> watchTasksSortedByDate({bool ascending = true});
  Future<Either<Failure, List<Task>>> getTasksSortedByPriority({bool ascending = true});
  Stream<Either<Failure, List<Task>>> watchTasksSortedByPriority({bool ascending = true});
  Future<Either<Failure, Task>> getTaskById(int id);
  Future<Either<Failure, Task>> createTask(Task task);
  Future<Either<Failure, Task>> updateTask(Task task);
  Future<Either<Failure, Unit>> deleteTask(int id);
  
  // Tags
  Future<Either<Failure, List<Tag>>> getTags();
  Stream<Either<Failure, List<Tag>>> watchTags();
  Future<Either<Failure, Tag>> getTagById(int id);
  Future<Either<Failure, Tag>> createTag(Tag tag);
  Future<Either<Failure, Tag>> updateTag(Tag tag);
  Future<Either<Failure, Unit>> deleteTag(int id);
  
  // Export/Import
  Future<Either<Failure, String>> exportToJson();
  Future<Either<Failure, Unit>> importFromJson(String jsonString);
}
