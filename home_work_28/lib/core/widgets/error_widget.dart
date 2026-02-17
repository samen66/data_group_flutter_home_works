import 'package:flutter/material.dart';
import '../error/failures.dart';

class ErrorDisplayWidget extends StatelessWidget {
  final Failure failure;
  final VoidCallback? onRetry;

  const ErrorDisplayWidget({
    super.key,
    required this.failure,
    this.onRetry,
  });

  String _getErrorMessage(Failure failure) {
    if (failure is ServerFailure) {
      final serverFailure = failure as ServerFailure;
      if (serverFailure.statusCode == 400) {
        return 'Неверный запрос. Проверьте введенные данные.';
      } else if (serverFailure.statusCode == 401) {
        return 'Ошибка авторизации. Проверьте API ключ.';
      } else if (serverFailure.statusCode == 500) {
        return 'Ошибка сервера. Попробуйте позже.';
      }
      return serverFailure.message;
    } else if (failure is NetworkFailure) {
      return 'Нет подключения к интернету. Проверьте соединение.';
    } else if (failure is TimeoutFailure) {
      return 'Превышено время ожидания. Попробуйте еще раз.';
    } else if (failure is CancellationFailure) {
      return 'Запрос был отменен.';
    }
    return failure.message;
  }

  IconData _getErrorIcon(Failure failure) {
    if (failure is NetworkFailure) {
      return Icons.wifi_off;
    } else if (failure is ServerFailure) {
      return Icons.error_outline;
    } else if (failure is TimeoutFailure) {
      return Icons.timer_off;
    }
    return Icons.error;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _getErrorIcon(failure),
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              _getErrorMessage(failure),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            if (onRetry != null) ...[
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: onRetry,
                icon: const Icon(Icons.refresh),
                label: const Text('Повторить'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
