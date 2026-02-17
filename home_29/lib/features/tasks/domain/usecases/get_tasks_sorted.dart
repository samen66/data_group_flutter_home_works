import 'package:dartz/dartz.dart' hide Task;
import 'package:home_29/core/error/failures.dart';
import 'package:home_29/features/tasks/domain/entities/task.dart';
import 'package:home_29/features/tasks/domain/repositories/task_repository.dart';
import 'package:home_29/features/tasks/domain/usecases/base_usecase.dart';

class GetTasksSortedByDate implements UseCase<List<Task>, bool> {
  final TaskRepository repository;

  GetTasksSortedByDate(this.repository);

  @override
  Future<Either<Failure, List<Task>>> call(bool ascending) async {
    return await repository.getTasksSortedByDate(ascending: ascending);
  }
}

class WatchTasksSortedByDate implements StreamUseCase<List<Task>, bool> {
  final TaskRepository repository;

  WatchTasksSortedByDate(this.repository);

  @override
  Stream<Either<Failure, List<Task>>> call(bool ascending) {
    return repository.watchTasksSortedByDate(ascending: ascending);
  }
}

class GetTasksSortedByPriority implements UseCase<List<Task>, bool> {
  final TaskRepository repository;

  GetTasksSortedByPriority(this.repository);

  @override
  Future<Either<Failure, List<Task>>> call(bool ascending) async {
    return await repository.getTasksSortedByPriority(ascending: ascending);
  }
}

class WatchTasksSortedByPriority implements StreamUseCase<List<Task>, bool> {
  final TaskRepository repository;

  WatchTasksSortedByPriority(this.repository);

  @override
  Stream<Either<Failure, List<Task>>> call(bool ascending) {
    return repository.watchTasksSortedByPriority(ascending: ascending);
  }
}
