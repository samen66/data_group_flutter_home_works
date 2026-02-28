import 'package:dartz/dartz.dart';
import 'package:dartz/dartz.dart' as dartz;
import '../../../../core/error/failures.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../datasources/auth_local_data_source.dart';

/// Реализация репозитория аутентификации
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, UserEntity>> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final userModel = await remoteDataSource.signInWithEmail(
        email: email,
        password: password,
      );
      await localDataSource.cacheUserData(userModel.uid);
      return Right(userModel.toEntity());
    } on ServerException catch (e) {
      return Left(AuthFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final userModel = await remoteDataSource.signUpWithEmail(
        email: email,
        password: password,
      );
      await localDataSource.cacheUserData(userModel.uid);
      return Right(userModel.toEntity());
    } on ServerException catch (e) {
      return Left(AuthFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dartz.Unit>> signOut() async {
    try {
      await remoteDataSource.signOut();
      await localDataSource.clearCache();
      return const Right(dartz.unit);
    } on ServerException catch (e) {
      return Left(AuthFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dartz.Unit>> resetPassword(String email) async {
    try {
      await remoteDataSource.resetPassword(email);
      return const Right(dartz.unit);
    } on ServerException catch (e) {
      return Left(AuthFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      final userModel = await remoteDataSource.signInWithGoogle();
      await localDataSource.cacheUserData(userModel.uid);
      return Right(userModel.toEntity());
    } on ServerException catch (e) {
      return Left(AuthFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Stream<UserEntity?> get authStateChanges {
    return remoteDataSource.authStateChanges.map((userModel) {
      if (userModel == null) {
        localDataSource.clearCache();
        return null;
      }
      localDataSource.cacheUserData(userModel.uid);
      return userModel.toEntity();
    });
  }

  @override
  Future<Either<Failure, UserEntity?>> getCurrentUser() async {
    try {
      final userModel = await remoteDataSource.getCurrentUser();
      if (userModel == null) {
        return const Right(null);
      }
      return Right(userModel.toEntity());
    } on ServerException catch (e) {
      return Left(AuthFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
