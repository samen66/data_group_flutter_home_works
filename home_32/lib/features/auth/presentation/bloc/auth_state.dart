import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/user_entity.dart';

part 'auth_state.freezed.dart';

/// Состояния аутентификации
@freezed
class AuthState with _$AuthState {
  /// Начальное состояние
  const factory AuthState.initial() = _Initial;

  /// Пользователь авторизован
  const factory AuthState.authenticated(UserEntity user) = _Authenticated;

  /// Пользователь не авторизован
  const factory AuthState.unauthenticated() = _Unauthenticated;

  /// Процесс загрузки
  const factory AuthState.loading() = _Loading;

  /// Ошибка
  const factory AuthState.error(Failure failure) = _Error;
}
