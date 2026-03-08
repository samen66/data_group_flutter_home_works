import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/notifications_repository.dart';

/// Use case для получения настроек уведомлений
class GetNotificationSettings {
  final NotificationsRepository repository;

  GetNotificationSettings(this.repository);

  Future<Either<Failure, bool>> call(String userId) {
    return repository.getNotificationSettings(userId);
  }
}
