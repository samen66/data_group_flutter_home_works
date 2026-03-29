import 'package:dio/dio.dart';

/// HTTP-клиент на Dio: базовый URL, таймауты, единая точка настройки.
class DioClient {
  DioClient()
      : _dio = Dio(
          BaseOptions(
            baseUrl: 'https://jsonplaceholder.typicode.com',
            connectTimeout: const Duration(seconds: 15),
            receiveTimeout: const Duration(seconds: 15),
            headers: const {'Accept': 'application/json'},
          ),
        );

  final Dio _dio;

  Dio get client => _dio;
}
