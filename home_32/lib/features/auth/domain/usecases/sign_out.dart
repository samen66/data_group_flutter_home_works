import 'package:dartz/dartz.dart';
import 'package:dartz/dartz.dart' as dartz;
import '../../../../core/error/failures.dart';
import '../repositories/auth_repository.dart';

/// Use case для выхода из аккаунта
class SignOut {
  final AuthRepository repository;

  SignOut(this.repository);

  Future<Either<Failure, dartz.Unit>> call() async {
    return await repository.signOut();
  }
}
