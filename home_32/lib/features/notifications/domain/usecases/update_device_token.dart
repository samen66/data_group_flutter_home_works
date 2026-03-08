import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/notifications_repository.dart';

/// Use case для обновления device token
class UpdateDeviceToken {
  final NotificationsRepository repository;

  UpdateDeviceToken(this.repository);

  Future<Either<Failure, void>> call({
    required String token,
    required String userId,
    required String platform,
  }) {
    return repository.updateDeviceToken(
      token: token,
      userId: userId,
      platform: platform,
    );
  }
}
