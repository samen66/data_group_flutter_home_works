import 'package:dio/dio.dart';
import '../error/failures.dart';

/// Maps DioException to Failure
Failure mapDioExceptionToFailure(DioException exception) {
  switch (exception.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return const TimeoutFailure();

    case DioExceptionType.badResponse:
      final statusCode = exception.response?.statusCode;
      final message = _getErrorMessageFromResponse(exception.response);

      if (statusCode == 400) {
        return ServerFailure(
          message.isNotEmpty ? message : 'Неверный запрос. Проверьте введенные данные.',
          statusCode: statusCode,
        );
      } else if (statusCode == 401) {
        return ServerFailure(
          message.isNotEmpty ? message : 'Ошибка авторизации. Проверьте API ключ.',
          statusCode: statusCode,
        );
      } else if (statusCode == 403) {
        return ServerFailure(
          message.isNotEmpty ? message : 'Доступ запрещен.',
          statusCode: statusCode,
        );
      } else if (statusCode == 404) {
        return ServerFailure(
          message.isNotEmpty ? message : 'Ресурс не найден.',
          statusCode: statusCode,
        );
      } else if (statusCode != null && statusCode >= 500) {
        return ServerFailure(
          message.isNotEmpty ? message : 'Ошибка сервера. Попробуйте позже.',
          statusCode: statusCode,
        );
      } else {
        return ServerFailure(
          message.isNotEmpty ? message : 'Ошибка сервера',
          statusCode: statusCode,
        );
      }

    case DioExceptionType.cancel:
      return const CancellationFailure();

    case DioExceptionType.connectionError:
      return const NetworkFailure('Нет подключения к интернету. Проверьте соединение.');

    case DioExceptionType.badCertificate:
      return const ServerFailure('Ошибка сертификата');

    case DioExceptionType.unknown:
      if (exception.error is NetworkFailure) {
        return exception.error as NetworkFailure;
      }
      return UnknownFailure(
        exception.message ?? 'Произошла неизвестная ошибка',
      );
  }
}

/// Extracts error message from response
String _getErrorMessageFromResponse(Response? response) {
  if (response?.data == null) return '';

  try {
    final data = response!.data;
    if (data is Map<String, dynamic>) {
      return data['message'] as String? ??
          data['error'] as String? ??
          data['detail'] as String? ??
          '';
    }
    if (data is String) {
      return data;
    }
  } catch (e) {
    // Ignore parsing errors
  }

  return '';
}
