import 'package:dartz/dartz.dart';
import 'package:home_29/core/error/failures.dart';
import 'package:home_29/features/tasks/domain/repositories/task_repository.dart';
import 'package:home_29/features/tasks/domain/usecases/base_usecase.dart';

class DeleteTask implements UseCase<Unit, int> {
  final TaskRepository repository;

  DeleteTask(this.repository);

  @override
  Future<Either<Failure, Unit>> call(int params) async {
    return await repository.deleteTask(params);
  }
}
