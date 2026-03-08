import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/notifications_repository.dart';

/// Use case для обновления настроек уведомлений
class UpdateNotificationSettings {
  final NotificationsRepository repository;

  UpdateNotificationSettings(this.repository);

  Future<Either<Failure, void>> call({
    required String userId,
    required bool enabled,
  }) {
    return repository.updateNotificationSettings(
      userId: userId,
      enabled: enabled,
    );
  }
}
