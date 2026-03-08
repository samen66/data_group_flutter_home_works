import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/notifications_repository.dart';

/// Use case для сохранения device token
class SaveDeviceToken {
  final NotificationsRepository repository;

  SaveDeviceToken(this.repository);

  Future<Either<Failure, void>> call({
    required String token,
    required String userId,
    required String platform,
  }) {
    return repository.saveDeviceToken(
      token: token,
      userId: userId,
      platform: platform,
    );
  }
}
