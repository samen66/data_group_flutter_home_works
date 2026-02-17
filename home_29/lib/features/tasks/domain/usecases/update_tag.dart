import 'package:dartz/dartz.dart';
import 'package:home_29/core/error/failures.dart';
import 'package:home_29/features/tasks/domain/entities/tag.dart';
import 'package:home_29/features/tasks/domain/repositories/task_repository.dart';
import 'package:home_29/features/tasks/domain/usecases/base_usecase.dart';

class UpdateTag implements UseCase<Tag, Tag> {
  final TaskRepository repository;

  UpdateTag(this.repository);

  @override
  Future<Either<Failure, Tag>> call(Tag params) async {
    return await repository.updateTag(params);
  }
}
