import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/repositories/notifications_repository.dart';
import '../datasources/notifications_remote_data_source.dart';
import '../datasources/notifications_local_data_source.dart';

/// Реализация репозитория для работы с уведомлениями
class NotificationsRepositoryImpl implements NotificationsRepository {
  final NotificationsRemoteDataSource remoteDataSource;
  final NotificationsLocalDataSource localDataSource;

  NotificationsRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, void>> saveDeviceToken({
    required String token,
    required String userId,
    required String platform,
  }) async {
    try {
      await remoteDataSource.saveDeviceToken(
        token: token,
        userId: userId,
        platform: platform,
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateDeviceToken({
    required String token,
    required String userId,
    required String platform,
  }) async {
    try {
      await remoteDataSource.updateDeviceToken(
        token: token,
        userId: userId,
        platform: platform,
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> getNotificationSettings(String userId) async {
    try {
      final enabled = await localDataSource.getNotificationSettings(userId);
      return Right(enabled);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateNotificationSettings({
    required String userId,
    required bool enabled,
  }) async {
    try {
      await localDataSource.updateNotificationSettings(userId, enabled);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
