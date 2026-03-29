import 'task_service.dart';

/// Единая точка: преобразование ошибок в сообщение для пользователя и показ.
class ErrorHandler {
  ErrorHandler({required void Function(String message) showMessage})
      : _showMessage = showMessage;

  final void Function(String message) _showMessage;

  void handle(Object error, [StackTrace? stackTrace]) {
    final message = _messageFor(error);
    _showMessage(message);
  }

  String _messageFor(Object error) {
    if (error is TaskServiceException) {
      return error.message;
    }
    return 'Что-то пошло не так. Попробуйте ещё раз.';
  }
}
