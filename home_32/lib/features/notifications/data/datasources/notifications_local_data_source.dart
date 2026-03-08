import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/error/exceptions.dart';

/// Абстрактный источник данных для локального хранения настроек уведомлений
abstract class NotificationsLocalDataSource {
  Future<bool> getNotificationSettings(String userId);
  Future<void> updateNotificationSettings(String userId, bool enabled);
}

/// Реализация источника данных для локального хранения настроек уведомлений
class NotificationsLocalDataSourceImpl implements NotificationsLocalDataSource {
  final SharedPreferences sharedPreferences;

  NotificationsLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<bool> getNotificationSettings(String userId) async {
    try {
      final key = 'notifications_enabled_$userId';
      return sharedPreferences.getBool(key) ?? true; // По умолчанию включено
    } catch (e) {
      throw CacheException('Failed to get notification settings: ${e.toString()}');
    }
  }

  @override
  Future<void> updateNotificationSettings(String userId, bool enabled) async {
    try {
      final key = 'notifications_enabled_$userId';
      await sharedPreferences.setBool(key, enabled);
    } catch (e) {
      throw CacheException('Failed to update notification settings: ${e.toString()}');
    }
  }
}
