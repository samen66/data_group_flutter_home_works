import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/notifications_bloc.dart';
import '../bloc/notifications_event.dart';
import '../bloc/notifications_state.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../widgets/notification_toggle_widget.dart';

/// Страница настроек уведомлений
class NotificationSettingsPage extends StatelessWidget {
  final String userId;

  const NotificationSettingsPage({
    super.key,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки уведомлений'),
      ),
      body: BlocBuilder<NotificationsBloc, NotificationsState>(
        builder: (context, state) {
          return state.when(
            initial: () {
              // Загружаем настройки при первом открытии
              WidgetsBinding.instance.addPostFrameCallback((_) {
                context.read<NotificationsBloc>().add(
                      NotificationsEvent.loadSettings(userId),
                    );
              });
              return const LoadingWidget();
            },
            loading: () => const LoadingWidget(),
            loaded: (notificationsEnabled, deviceToken) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NotificationToggleWidget(
                      enabled: notificationsEnabled,
                      onChanged: (value) {
                        context.read<NotificationsBloc>().add(
                              NotificationsEvent.updateSettings(
                                userId: userId,
                                enabled: value,
                              ),
                            );
                      },
                    ),
                    const SizedBox(height: 24),
                    if (deviceToken != null) ...[
                      const Text(
                        'Device Token:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      SelectableText(
                        deviceToken,
                        style: const TextStyle(
                          fontSize: 12,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ],
                  ],
                ),
              );
            },
            error: (failure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, size: 64, color: Colors.red),
                    const SizedBox(height: 16),
                    Text(
                      failure.message,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<NotificationsBloc>().add(
                              NotificationsEvent.loadSettings(userId),
                            );
                      },
                      child: const Text('Повторить'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
