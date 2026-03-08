import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/device_token_entity.dart';

/// Модель токена устройства для работы с Firestore
class DeviceTokenModel {
  final String userId;
  final String token;
  final String platform;
  final DateTime createdAt;
  final DateTime updatedAt;

  DeviceTokenModel({
    required this.userId,
    required this.token,
    required this.platform,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Преобразование в сущность
  DeviceTokenEntity toEntity() {
    return DeviceTokenEntity(
      userId: userId,
      token: token,
      platform: platform,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  /// Создание из Firestore документа
  factory DeviceTokenModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return DeviceTokenModel(
      userId: data['userId'] as String,
      token: data['token'] as String,
      platform: data['platform'] as String,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      updatedAt: (data['updatedAt'] as Timestamp).toDate(),
    );
  }

  /// Преобразование в Map для Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'token': token,
      'platform': platform,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }
}
