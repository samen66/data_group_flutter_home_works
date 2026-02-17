import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/api_client.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../models/user_model.dart';

/// User repository implementation (Data layer)
class UserRepositoryImpl implements UserRepository {
  final ApiClient apiClient;

  UserRepositoryImpl({required this.apiClient});

  @override
  Future<Either<Failure, User>> getUser(int id) async {
    try {
      final response = await apiClient.get('/users/$id');
      final user = UserModel.fromJson(response);
      return Right(user);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<User>>> getUsers() async {
    try {
      // For simplicity, we'll get a single user and return as list
      final response = await apiClient.get('/users/1');
      final user = UserModel.fromJson(response);
      return Right([user]);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
