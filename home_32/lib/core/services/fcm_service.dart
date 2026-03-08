import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import '../utils/notification_logger.dart';

/// Сервис для работы с Firebase Cloud Messaging
class FCMService {
  final FirebaseMessaging _firebaseMessaging;
  final FlutterLocalNotificationsPlugin _localNotifications;
  Function(Map<String, dynamic>)? _onNotificationTap;

  FCMService({
    required FirebaseMessaging firebaseMessaging,
    required FlutterLocalNotificationsPlugin localNotifications,
  })  : _firebaseMessaging = firebaseMessaging,
        _localNotifications = localNotifications;

  /// Инициализация FCM сервиса
  Future<void> initialize({
    Function(Map<String, dynamic>)? onNotificationTap,
  }) async {
    _onNotificationTap = onNotificationTap;

    // Запрос разрешений
    await _requestPermissions();

    // Инициализация локальных уведомлений
    await _initializeLocalNotifications();

    // Настройка обработчиков уведомлений
    _setupMessageHandlers();

    // Получение токена
    final token = await _firebaseMessaging.getToken();
    if (token != null) {
      NotificationLogger.logTokenReceived(
        token: token,
        timestamp: DateTime.now(),
      );
    }

    // Слушаем обновления токена
    _firebaseMessaging.onTokenRefresh.listen((newToken) {
      NotificationLogger.logTokenUpdated(
        oldToken: token ?? '',
        newToken: newToken,
        timestamp: DateTime.now(),
      );
    });
  }

  /// Запрос разрешений на уведомления
  Future<void> _requestPermissions() async {
    if (Platform.isAndroid) {
      // Для Android 13+ нужно запросить POST_NOTIFICATIONS
      final status = await Permission.notification.request();
      if (status.isDenied) {
        // Разрешение отклонено
      }
    } else if (Platform.isIOS) {
      // Для iOS запрашиваем разрешение через Firebase
      final settings = await _firebaseMessaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );
      if (settings.authorizationStatus == AuthorizationStatus.denied) {
        // Разрешение отклонено
      }
    }
  }

  /// Инициализация локальных уведомлений
  Future<void> _initializeLocalNotifications() async {
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );
    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    // Создаем канал для Android
    if (Platform.isAndroid) {
      const androidChannel = AndroidNotificationChannel(
        'default_channel',
        'Default Channel',
        description: 'Default notification channel',
        importance: Importance.high,
      );
      await _localNotifications
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(androidChannel);
    }
  }

  /// Настройка обработчиков сообщений
  void _setupMessageHandlers() {
    // Обработка уведомлений в foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      NotificationLogger.logNotificationReceived(
        payload: message.data,
        timestamp: DateTime.now(),
      );
      _showLocalNotification(message);
    });

    // Обработка нажатия на уведомление (когда приложение в background)
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      NotificationLogger.logNotificationOpened(
        itemId: message.data['itemId'],
        type: message.data['type'],
        timestamp: DateTime.now(),
        payload: message.data,
      );
      _handleNotificationTap(message.data);
    });

    // Проверка, было ли приложение открыто через уведомление (terminated state)
    _firebaseMessaging.getInitialMessage().then((RemoteMessage? message) {
      if (message != null) {
        NotificationLogger.logNotificationOpened(
          itemId: message.data['itemId'],
          type: message.data['type'],
          timestamp: DateTime.now(),
          payload: message.data,
        );
        _handleNotificationTap(message.data);
      }
    });
  }

  /// Показ локального уведомления в foreground
  Future<void> _showLocalNotification(RemoteMessage message) async {
    final notification = message.notification;
    if (notification == null) return;

    final androidDetails = AndroidNotificationDetails(
      'default_channel',
      'Default Channel',
      channelDescription: 'Default notification channel',
      importance: Importance.high,
      priority: Priority.high,
    );

    final iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    final details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _localNotifications.show(
      notification.hashCode,
      notification.title,
      notification.body,
      details,
      payload: message.data.toString(),
    );
  }

  /// Обработка нажатия на уведомление
  void _onNotificationTapped(NotificationResponse response) {
    if (response.payload != null) {
      // Парсим payload (в реальном приложении нужно правильно парсить JSON)
      // Здесь упрощенная версия
      _handleNotificationTap({});
    }
  }

  /// Обработка deep link из уведомления
  void _handleNotificationTap(Map<String, dynamic> data) {
    if (_onNotificationTap != null) {
      _onNotificationTap!(data);
    }
  }

  /// Получение текущего device token
  Future<String?> getToken() async {
    return await _firebaseMessaging.getToken();
  }

  /// Подписка на тему
  Future<void> subscribeToTopic(String topic) async {
    await _firebaseMessaging.subscribeToTopic(topic);
  }

  /// Отписка от темы
  Future<void> unsubscribeFromTopic(String topic) async {
    await _firebaseMessaging.unsubscribeFromTopic(topic);
  }
}

/// Background message handler (должен быть top-level функцией)
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  NotificationLogger.logNotificationReceived(
    payload: message.data,
    timestamp: DateTime.now(),
  );
}
