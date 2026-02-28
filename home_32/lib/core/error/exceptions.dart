/// Базовый класс для исключений
abstract class AppException implements Exception {
  final String message;

  const AppException(this.message);

  @override
  String toString() => message;
}

/// Исключения сервера
class ServerException extends AppException {
  const ServerException([String message = 'Server error occurred']) : super(message);
}

/// Исключения кэша
class CacheException extends AppException {
  const CacheException([String message = 'Cache error occurred']) : super(message);
}
