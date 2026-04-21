class Result<T> {
  const Result._({
    required this.data,
    required this.message,
  });

  factory Result.success(T data) {
    return Result._(data: data, message: null);
  }

  factory Result.failure(String message) {
    return Result._(data: null, message: message);
  }

  final T? data;
  final String? message;

  bool get isSuccess => message == null;
  bool get isFailure => !isSuccess;
}
