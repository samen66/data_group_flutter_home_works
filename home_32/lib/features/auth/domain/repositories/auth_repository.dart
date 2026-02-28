import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/user_entity.dart';

/// Абстрактный репозиторий для аутентификации
abstract class AuthRepository {
  /// Вход по email и паролю
  Future<Either<Failure, UserEntity>> signInWithEmail({
    required String email,
    required String password,
  });

  /// Регистрация по email и паролю
  Future<Either<Failure, UserEntity>> signUpWithEmail({
    required String email,
    required String password,
  });

  /// Выход из аккаунта
  Future<Either<Failure, Unit>> signOut();

  /// Сброс пароля
  Future<Either<Failure, Unit>> resetPassword(String email);

  /// Вход через Google
  Future<Either<Failure, UserEntity>> signInWithGoogle();

  /// Поток изменений состояния аутентификации
  Stream<UserEntity?> get authStateChanges;

  /// Получить текущего пользователя
  Future<Either<Failure, UserEntity?>> getCurrentUser();
}
