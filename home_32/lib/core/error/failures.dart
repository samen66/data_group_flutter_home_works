import 'package:equatable/equatable.dart';

/// Базовый класс для всех ошибок в приложении
abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];

  @override
  String toString() => message;
}

/// Ошибки сервера
class ServerFailure extends Failure {
  const ServerFailure([String message = 'Server error occurred']) : super(message);
}

/// Ошибки аутентификации
class AuthFailure extends Failure {
  const AuthFailure([String message = 'Authentication error occurred']) : super(message);
}

/// Ошибки сети
class NetworkFailure extends Failure {
  const NetworkFailure([String message = 'Network error occurred']) : super(message);
}

/// Ошибки кэша
class CacheFailure extends Failure {
  const CacheFailure([String message = 'Cache error occurred']) : super(message);
}

/// Ошибки валидации
class ValidationFailure extends Failure {
  const ValidationFailure([String message = 'Validation failed']) : super(message);
}
