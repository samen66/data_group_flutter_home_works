import 'package:dartz/dartz.dart';
import 'package:home_29/core/error/failures.dart';
import 'package:home_29/features/tasks/domain/repositories/task_repository.dart';
import 'package:home_29/features/tasks/domain/usecases/base_usecase.dart';

class ExportToJson implements UseCase<String, NoParams> {
  final TaskRepository repository;

  ExportToJson(this.repository);

  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return await repository.exportToJson();
  }
}

class ImportFromJson implements UseCase<Unit, String> {
  final TaskRepository repository;

  ImportFromJson(this.repository);

  @override
  Future<Either<Failure, Unit>> call(String jsonString) async {
    return await repository.importFromJson(jsonString);
  }
}
