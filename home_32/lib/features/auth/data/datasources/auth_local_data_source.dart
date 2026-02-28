import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/error/exceptions.dart';

/// Абстрактный источник данных для локального хранения
abstract class AuthLocalDataSource {
  Future<void> cacheUserData(String userId);
  Future<String?> getCachedUserId();
  Future<void> clearCache();
}

/// Реализация источника данных для локального хранения
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const String _cachedUserIdKey = 'CACHED_USER_ID';

  AuthLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<void> cacheUserData(String userId) async {
    try {
      await sharedPreferences.setString(_cachedUserIdKey, userId);
    } catch (e) {
      throw CacheException('Failed to cache user data: ${e.toString()}');
    }
  }

  @override
  Future<String?> getCachedUserId() async {
    try {
      return sharedPreferences.getString(_cachedUserIdKey);
    } catch (e) {
      throw CacheException('Failed to get cached user id: ${e.toString()}');
    }
  }

  @override
  Future<void> clearCache() async {
    try {
      await sharedPreferences.remove(_cachedUserIdKey);
    } catch (e) {
      throw CacheException('Failed to clear cache: ${e.toString()}');
    }
  }
}
