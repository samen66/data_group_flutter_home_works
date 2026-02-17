import 'package:equatable/equatable.dart';

/// Base class for all failures
abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

/// Server error (400, 401, 403, etc.)
class ServerFailure extends Failure {
  final int? statusCode;

  const ServerFailure(
    String message, {
    this.statusCode,
  }) : super(message);

  @override
  List<Object> get props => [message, statusCode ?? 0];
}

/// Network connectivity failure
class NetworkFailure extends Failure {
  const NetworkFailure([String message = 'Нет подключения к интернету'])
      : super(message);
}

/// Timeout failure
class TimeoutFailure extends Failure {
  const TimeoutFailure([String message = 'Превышено время ожидания'])
      : super(message);
}

/// Unknown failure
class UnknownFailure extends Failure {
  const UnknownFailure([String message = 'Произошла неизвестная ошибка'])
      : super(message);
}

/// Request cancellation failure
class CancellationFailure extends Failure {
  const CancellationFailure([String message = 'Запрос был отменен'])
      : super(message);
}
