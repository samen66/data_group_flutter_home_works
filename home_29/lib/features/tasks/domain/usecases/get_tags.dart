import 'package:dartz/dartz.dart';
import 'package:home_29/core/error/failures.dart';
import 'package:home_29/features/tasks/domain/entities/tag.dart';
import 'package:home_29/features/tasks/domain/repositories/task_repository.dart';
import 'package:home_29/features/tasks/domain/usecases/base_usecase.dart';

class GetTags implements UseCase<List<Tag>, NoParams> {
  final TaskRepository repository;

  GetTags(this.repository);

  @override
  Future<Either<Failure, List<Tag>>> call(NoParams params) async {
    return await repository.getTags();
  }
}

class WatchTags implements StreamUseCase<List<Tag>, NoParams> {
  final TaskRepository repository;

  WatchTags(this.repository);

  @override
  Stream<Either<Failure, List<Tag>>> call(NoParams params) {
    return repository.watchTags();
  }
}
