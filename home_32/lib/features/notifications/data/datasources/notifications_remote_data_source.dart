import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/error/exceptions.dart';
import '../models/device_token_model.dart';

/// Абстрактный источник данных для удаленной работы с уведомлениями
abstract class NotificationsRemoteDataSource {
  Future<void> saveDeviceToken({
    required String token,
    required String userId,
    required String platform,
  });

  Future<void> updateDeviceToken({
    required String token,
    required String userId,
    required String platform,
  });
}

/// Реализация источника данных для удаленной работы с уведомлениями
class NotificationsRemoteDataSourceImpl implements NotificationsRemoteDataSource {
  final FirebaseFirestore firestore;

  NotificationsRemoteDataSourceImpl({required this.firestore});

  @override
  Future<void> saveDeviceToken({
    required String token,
    required String userId,
    required String platform,
  }) async {
    try {
      final now = DateTime.now();
      final tokenModel = DeviceTokenModel(
        userId: userId,
        token: token,
        platform: platform,
        createdAt: now,
        updatedAt: now,
      );

      // Используем userId как document ID для простоты поиска
      await firestore
          .collection('device_tokens')
          .doc(userId)
          .set(tokenModel.toFirestore());
    } on FirebaseException catch (e) {
      throw ServerException('Failed to save device token: ${e.message}');
    } catch (e) {
      throw ServerException('Failed to save device token: ${e.toString()}');
    }
  }

  @override
  Future<void> updateDeviceToken({
    required String token,
    required String userId,
    required String platform,
  }) async {
    try {
      final now = DateTime.now();
      await firestore
          .collection('device_tokens')
          .doc(userId)
          .update({
        'token': token,
        'platform': platform,
        'updatedAt': Timestamp.fromDate(now),
      });
    } on FirebaseException catch (e) {
      throw ServerException('Failed to update device token: ${e.message}');
    } catch (e) {
      throw ServerException('Failed to update device token: ${e.toString()}');
    }
  }
}
