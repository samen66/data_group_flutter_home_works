import 'package:dartz/dartz.dart';
import 'package:dartz/dartz.dart' as dartz;
import '../../../../core/error/failures.dart';
import '../repositories/auth_repository.dart';

/// Use case для сброса пароля
class ResetPassword {
  final AuthRepository repository;

  ResetPassword(this.repository);

  Future<Either<Failure, dartz.Unit>> call(String email) async {
    return await repository.resetPassword(email);
  }
}
