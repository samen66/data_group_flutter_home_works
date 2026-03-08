import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../../../core/error/failures.dart';
import '../../domain/usecases/get_device_token.dart';
import '../../domain/usecases/save_device_token.dart';
import '../../domain/usecases/update_device_token.dart';
import '../../domain/usecases/get_notification_settings.dart';
import '../../domain/usecases/update_notification_settings.dart';
import 'notifications_event.dart';
import 'notifications_state.dart';

/// Bloc для управления уведомлениями
class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final GetDeviceToken getDeviceToken;
  final SaveDeviceToken saveDeviceToken;
  final UpdateDeviceToken updateDeviceToken;
  final GetNotificationSettings getNotificationSettings;
  final UpdateNotificationSettings updateNotificationSettings;
  final FirebaseMessaging firebaseMessaging;

  NotificationsBloc({
    required this.getDeviceToken,
    required this.saveDeviceToken,
    required this.updateDeviceToken,
    required this.getNotificationSettings,
    required this.updateNotificationSettings,
    required this.firebaseMessaging,
  }) : super(const NotificationsState.initial()) {
    on<NotificationsEvent>(_onNotificationsEvent);
  }

  Future<void> _onNotificationsEvent(
    NotificationsEvent event,
    Emitter<NotificationsState> emit,
  ) async {
    await event.map(
      initializeFCM: (e) => _onInitializeFCM(emit),
      saveToken: (e) => _onSaveToken(e.token, e.userId, e.platform, emit),
      updateToken: (e) => _onUpdateToken(e.token, e.userId, e.platform, emit),
      loadSettings: (e) => _onLoadSettings(e.userId, emit),
      updateSettings: (e) => _onUpdateSettings(e.userId, e.enabled, emit),
      handleNotification: (e) => _onHandleNotification(e.payload, emit),
    );
  }

  Future<void> _onInitializeFCM(Emitter<NotificationsState> emit) async {
    emit(const NotificationsState.loading());
    try {
      final token = await firebaseMessaging.getToken();
      if (token != null) {
        final result = await getDeviceToken.call();
        result.fold(
          (failure) => emit(NotificationsState.error(failure)),
          (currentToken) {
            if (currentToken != token) {
              // Токен изменился, нужно обновить
              // Но userId еще не известен, поэтому просто сохраняем состояние
              emit(NotificationsState.loaded(
                notificationsEnabled: true,
                deviceToken: token,
              ));
            } else {
              emit(NotificationsState.loaded(
                notificationsEnabled: true,
                deviceToken: token,
              ));
            }
          },
        );
      } else {
        emit(const NotificationsState.loaded(notificationsEnabled: true));
      }
    } catch (e) {
      emit(NotificationsState.error(ServerFailure(e.toString())));
    }
  }

  Future<void> _onSaveToken(
    String token,
    String userId,
    String platform,
    Emitter<NotificationsState> emit,
  ) async {
    emit(const NotificationsState.loading());
    final result = await saveDeviceToken(
      token: token,
      userId: userId,
      platform: platform,
    );
    result.fold(
      (failure) => emit(NotificationsState.error(failure)),
      (_) {
        // После сохранения загружаем настройки
        add(NotificationsEvent.loadSettings(userId));
      },
    );
  }

  Future<void> _onUpdateToken(
    String token,
    String userId,
    String platform,
    Emitter<NotificationsState> emit,
  ) async {
    final result = await updateDeviceToken(
      token: token,
      userId: userId,
      platform: platform,
    );
    result.fold(
      (failure) => emit(NotificationsState.error(failure)),
      (_) {
        // Обновляем состояние с новым токеном
        state.when(
          initial: () {
            emit(NotificationsState.loaded(
              notificationsEnabled: true,
              deviceToken: token,
            ));
          },
          loading: () {
            emit(NotificationsState.loaded(
              notificationsEnabled: true,
              deviceToken: token,
            ));
          },
          loaded: (enabled, _) {
            emit(NotificationsState.loaded(
              notificationsEnabled: enabled,
              deviceToken: token,
            ));
          },
          error: (_) {
            emit(NotificationsState.loaded(
              notificationsEnabled: true,
              deviceToken: token,
            ));
          },
        );
      },
    );
  }

  Future<void> _onLoadSettings(
    String userId,
    Emitter<NotificationsState> emit,
  ) async {
    emit(const NotificationsState.loading());
    final result = await getNotificationSettings(userId);
    await result.fold(
      (failure) async {
        emit(NotificationsState.error(failure));
      },
      (enabled) async {
        // Получаем текущий токен
        final token = await firebaseMessaging.getToken();
        emit(NotificationsState.loaded(
          notificationsEnabled: enabled,
          deviceToken: token,
        ));
      },
    );
  }

  Future<void> _onUpdateSettings(
    String userId,
    bool enabled,
    Emitter<NotificationsState> emit,
  ) async {
    final result = await updateNotificationSettings(
      userId: userId,
      enabled: enabled,
    );
    result.fold(
      (failure) => emit(NotificationsState.error(failure)),
      (_) {
        // Обновляем состояние
        state.when(
          initial: () {
            emit(NotificationsState.loaded(
              notificationsEnabled: enabled,
            ));
          },
          loading: () {
            emit(NotificationsState.loaded(
              notificationsEnabled: enabled,
            ));
          },
          loaded: (_, token) {
            emit(NotificationsState.loaded(
              notificationsEnabled: enabled,
              deviceToken: token,
            ));
          },
          error: (_) {
            emit(NotificationsState.loaded(
              notificationsEnabled: enabled,
            ));
          },
        );
      },
    );
  }

  Future<void> _onHandleNotification(
    Map<String, dynamic> payload,
    Emitter<NotificationsState> emit,
  ) async {
    // Обработка уведомления (deep linking будет реализован в FCM service)
    // Здесь просто обновляем состояние, если нужно
  }
}
