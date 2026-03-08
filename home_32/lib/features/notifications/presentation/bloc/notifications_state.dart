import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/error/failures.dart';

part 'notifications_state.freezed.dart';

/// Состояния для управления уведомлениями
@freezed
class NotificationsState with _$NotificationsState {
  const factory NotificationsState.initial() = _Initial;
  const factory NotificationsState.loading() = _Loading;
  const factory NotificationsState.loaded({
    required bool notificationsEnabled,
    String? deviceToken,
  }) = _Loaded;
  const factory NotificationsState.error(Failure failure) = _Error;
}
