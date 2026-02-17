import 'package:dartz/dartz.dart' hide Task;
import 'package:home_29/core/error/failures.dart';
import 'package:home_29/features/tasks/domain/entities/task.dart';
import 'package:home_29/features/tasks/domain/repositories/task_repository.dart';
import 'package:home_29/features/tasks/domain/usecases/base_usecase.dart';

class GetTasks implements UseCase<List<Task>, NoParams> {
  final TaskRepository repository;

  GetTasks(this.repository);

  @override
  Future<Either<Failure, List<Task>>> call(NoParams params) async {
    return await repository.getTasks();
  }
}

class WatchTasks implements StreamUseCase<List<Task>, NoParams> {
  final TaskRepository repository;

  WatchTasks(this.repository);

  @override
  Stream<Either<Failure, List<Task>>> call(NoParams params) {
    return repository.watchTasks();
  }
}
