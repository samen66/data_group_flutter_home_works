import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

/// Интерфейс репозитория для работы с уведомлениями
abstract class NotificationsRepository {
  /// Сохранение токена устройства в Firestore
  Future<Either<Failure, void>> saveDeviceToken({
    required String token,
    required String userId,
    required String platform,
  });

  /// Обновление токена устройства в Firestore
  Future<Either<Failure, void>> updateDeviceToken({
    required String token,
    required String userId,
    required String platform,
  });

  /// Получение настроек уведомлений для пользователя
  Future<Either<Failure, bool>> getNotificationSettings(String userId);

  /// Обновление настроек уведомлений
  Future<Either<Failure, void>> updateNotificationSettings({
    required String userId,
    required bool enabled,
  });
}
