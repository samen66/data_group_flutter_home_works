import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'dart:developer' as developer;

/// Dio client configuration
class DioClient {
  static const String baseUrl = 'https://api.football-data.org/v4';
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const int maxRetries = 2;

  late final Dio _dio;

  DioClient({String? apiToken}) {
    final headers = <String, dynamic>{
      'Content-Type': 'application/json',
    };
    
    // Add API token only if provided
    if (apiToken != null && apiToken.isNotEmpty && apiToken != 'YOUR_API_KEY') {
      headers['X-Auth-Token'] = apiToken;
    }

    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
        headers: headers,
      ),
    );

    _dio.interceptors.addAll([
      _LoggingInterceptor(),
      _RetryInterceptor(),
    ]);
  }

  Dio get dio => _dio;
}

/// Interceptor for logging requests and responses
class _LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      developer.log(
        'REQUEST[${options.method}] => PATH: ${options.path}',
        name: 'Dio',
      );
      if (options.queryParameters.isNotEmpty) {
        developer.log(
          'Query Parameters: ${options.queryParameters}',
          name: 'Dio',
        );
      }
      if (options.data != null) {
        developer.log(
          'Request Data: ${options.data}',
          name: 'Dio',
        );
      }
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      developer.log(
        'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}',
        name: 'Dio',
      );
      developer.log(
        'Response Data: ${response.data}',
        name: 'Dio',
      );
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      developer.log(
        'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
        name: 'Dio',
        error: err.error,
        stackTrace: err.stackTrace,
      );
      if (err.response?.data != null) {
        developer.log(
          'Error Data: ${err.response?.data}',
          name: 'Dio',
        );
      }
    }
    super.onError(err, handler);
  }
}

/// Interceptor for retrying failed requests
class _RetryInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final options = err.requestOptions;
    final retryCount = options.extra['retryCount'] as int? ?? 0;

    // Only retry on network errors or 5xx server errors
    final shouldRetry = (err.type == DioExceptionType.connectionTimeout ||
            err.type == DioExceptionType.sendTimeout ||
            err.type == DioExceptionType.receiveTimeout ||
            err.type == DioExceptionType.connectionError ||
            (err.response?.statusCode != null &&
                err.response!.statusCode! >= 500)) &&
        retryCount < DioClient.maxRetries;

    if (shouldRetry) {
      options.extra['retryCount'] = retryCount + 1;

      // Wait before retrying (exponential backoff)
      await Future.delayed(Duration(seconds: retryCount + 1));

      if (kDebugMode) {
        developer.log(
          'Retrying request (attempt ${retryCount + 1}/${DioClient.maxRetries})',
          name: 'Dio',
        );
      }

      try {
        // Create a new Dio instance with the same base options
        final dio = Dio(
          BaseOptions(
            baseUrl: options.baseUrl,
            connectTimeout: options.connectTimeout,
            receiveTimeout: options.receiveTimeout,
            headers: options.headers,
          ),
        );
        final response = await dio.fetch(options);
        handler.resolve(response);
        return;
      } catch (e) {
        if (e is DioException) {
          handler.reject(e);
        } else {
          handler.reject(
            DioException(
              requestOptions: options,
              error: e,
            ),
          );
        }
        return;
      }
    }

    super.onError(err, handler);
  }
}
