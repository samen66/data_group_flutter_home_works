import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_entity.dart';

part 'auth_event.freezed.dart';

/// События аутентификации
@freezed
class AuthEvent with _$AuthEvent {
  /// Вход по email и паролю
  const factory AuthEvent.signInWithEmail({
    required String email,
    required String password,
  }) = _SignInWithEmail;

  /// Регистрация по email и паролю
  const factory AuthEvent.signUpWithEmail({
    required String email,
    required String password,
  }) = _SignUpWithEmail;

  /// Выход из аккаунта
  const factory AuthEvent.signOut() = _SignOut;

  /// Сброс пароля
  const factory AuthEvent.resetPassword(String email) = _ResetPassword;

  /// Вход через Google
  const factory AuthEvent.signInWithGoogle() = _SignInWithGoogle;

  /// Проверка статуса аутентификации
  const factory AuthEvent.checkAuthStatus() = _CheckAuthStatus;

  /// Изменение состояния аутентификации
  const factory AuthEvent.authStateChanged(UserEntity? user) = _AuthStateChanged;
}
