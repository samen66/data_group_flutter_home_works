import 'dart:developer' as developer;

/// Утилита для логирования событий уведомлений
class NotificationLogger {
  static const String _tag = 'NotificationLogger';

  /// Логирование получения уведомления
  static void logNotificationReceived({
    required Map<String, dynamic> payload,
    required DateTime timestamp,
  }) {
    developer.log(
      'Notification received',
      name: _tag,
      error: {
        'timestamp': timestamp.toIso8601String(),
        'payload': payload,
      },
    );
  }

  /// Логирование открытия уведомления
  static void logNotificationOpened({
    String? itemId,
    String? type,
    required DateTime timestamp,
    Map<String, dynamic>? payload,
  }) {
    developer.log(
      'Notification opened',
      name: _tag,
      error: {
        'timestamp': timestamp.toIso8601String(),
        'itemId': itemId,
        'type': type,
        'payload': payload,
      },
    );
  }

  /// Логирование ошибки при обработке уведомления
  static void logNotificationError({
    required String error,
    required DateTime timestamp,
    Map<String, dynamic>? payload,
  }) {
    developer.log(
      'Notification error: $error',
      name: _tag,
      error: {
        'timestamp': timestamp.toIso8601String(),
        'error': error,
        'payload': payload,
      },
    );
  }

  /// Логирование получения device token
  static void logTokenReceived({
    required String token,
    required DateTime timestamp,
  }) {
    developer.log(
      'Device token received',
      name: _tag,
      error: {
        'timestamp': timestamp.toIso8601String(),
        'token': token.substring(0, 20) + '...', // Логируем только начало токена
      },
    );
  }

  /// Логирование обновления device token
  static void logTokenUpdated({
    required String oldToken,
    required String newToken,
    required DateTime timestamp,
  }) {
    developer.log(
      'Device token updated',
      name: _tag,
      error: {
        'timestamp': timestamp.toIso8601String(),
        'oldToken': oldToken.substring(0, 20) + '...',
        'newToken': newToken.substring(0, 20) + '...',
      },
    );
  }
}
