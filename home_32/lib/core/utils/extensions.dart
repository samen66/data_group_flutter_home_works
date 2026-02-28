import 'package:dartz/dartz.dart';
import '../error/failures.dart';

/// Расширения для упрощения работы с Either<Failure, T> в UI
extension EitherExtensions<L extends Failure, R> on Either<L, R> {
  /// Получить значение Right
  R getRight() => (this as Right<L, R>).value;

  /// Получить значение Left
  L getLeft() => (this as Left<L, R>).value;

  /// Проверка, является ли значение Right
  bool get isRight => this is Right<L, R>;

  /// Проверка, является ли значение Left
  bool get isLeft => this is Left<L, R>;

  /// Обработка Either с возвратом виджета
  T when<T>({
    required T Function(L failure) failure,
    required T Function(R data) success,
  }) {
    return fold(
      (l) => failure(l),
      (r) => success(r),
    );
  }

  /// Упрощенная цепочка операций, которые могут завершиться ошибкой
  Either<L, T> flatMap<T>(Either<L, T> Function(R r) f) {
    return fold(
      (l) => Left(l),
      (r) => f(r),
    );
  }
}
