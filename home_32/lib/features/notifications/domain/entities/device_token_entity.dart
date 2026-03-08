import 'package:equatable/equatable.dart';

/// Сущность токена устройства
class DeviceTokenEntity extends Equatable {
  final String userId;
  final String token;
  final String platform; // 'android' или 'ios'
  final DateTime createdAt;
  final DateTime updatedAt;

  const DeviceTokenEntity({
    required this.userId,
    required this.token,
    required this.platform,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object> get props => [userId, token, platform, createdAt, updatedAt];
}
