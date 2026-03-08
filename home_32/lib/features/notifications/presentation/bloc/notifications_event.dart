import 'package:freezed_annotation/freezed_annotation.dart';

part 'notifications_event.freezed.dart';

/// События для управления уведомлениями
@freezed
class NotificationsEvent with _$NotificationsEvent {
  const factory NotificationsEvent.initializeFCM() = _InitializeFCM;
  const factory NotificationsEvent.saveToken({
    required String token,
    required String userId,
    required String platform,
  }) = _SaveToken;
  const factory NotificationsEvent.updateToken({
    required String token,
    required String userId,
    required String platform,
  }) = _UpdateToken;
  const factory NotificationsEvent.loadSettings(String userId) = _LoadSettings;
  const factory NotificationsEvent.updateSettings({
    required String userId,
    required bool enabled,
  }) = _UpdateSettings;
  const factory NotificationsEvent.handleNotification({
    required Map<String, dynamic> payload,
  }) = _HandleNotification;
}
