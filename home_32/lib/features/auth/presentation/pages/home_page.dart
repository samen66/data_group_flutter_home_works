import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/user_profile_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/di/injection_container.dart' as di;
import '../../../notes/presentation/pages/notes_list_page.dart';
import '../../../notes/presentation/bloc/notes_bloc.dart';
import '../../../notifications/presentation/pages/notification_settings_page.dart';
import '../../../notifications/presentation/bloc/notifications_bloc.dart';

/// Домашняя страница (защищенная)
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _handleSignOut(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Выход'),
        content: const Text('Вы уверены, что хотите выйти?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Отмена'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.read<AuthBloc>().add(const AuthEvent.signOut());
            },
            child: const Text('Выйти'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Главная'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _handleSignOut(context),
            tooltip: 'Выйти',
          ),
        ],
      ),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return state.maybeWhen(
            authenticated: (user) => SingleChildScrollView(
              child: Column(
                children: [
                  UserProfileWidget(user: user),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Card(
                      child: ListTile(
                        leading: const Icon(Icons.info_outline),
                        title: const Text('Добро пожаловать!'),
                        subtitle: const Text('Вы успешно авторизованы'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Expanded(
                          child: Card(
                            child: ListTile(
                              leading: const Icon(Icons.note),
                              title: const Text('Заметки'),
                              trailing: const Icon(Icons.arrow_forward_ios),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                      create: (context) {
                                        final bloc = di.getIt<NotesBloc>();
                                        final userId = firebase_auth.FirebaseAuth.instance.currentUser?.uid;
                                        if (userId != null) {
                                          bloc.setUserId(userId);
                                        }
                                        return bloc;
                                      },
                                      child: const NotesListPage(
                                        collection: 'notes',
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Card(
                            child: ListTile(
                              leading: const Icon(Icons.task),
                              title: const Text('Задачи'),
                              trailing: const Icon(Icons.arrow_forward_ios),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BlocProvider(
                                      create: (context) {
                                        final bloc = di.getIt<NotesBloc>();
                                        final userId = firebase_auth.FirebaseAuth.instance.currentUser?.uid;
                                        if (userId != null) {
                                          bloc.setUserId(userId);
                                        }
                                        return bloc;
                                      },
                                      child: const NotesListPage(
                                        collection: 'tasks',
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Card(
                      child: ListTile(
                        leading: const Icon(Icons.notifications),
                        title: const Text('Настройки уведомлений'),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          final userId = firebase_auth.FirebaseAuth.instance.currentUser?.uid;
                          if (userId != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                  create: (context) => di.getIt<NotificationsBloc>(),
                                  child: NotificationSettingsPage(userId: userId),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            loading: () => const LoadingWidget(message: 'Загрузка...'),
            orElse: () => const Center(
              child: Text('Ошибка загрузки данных'),
            ),
          );
        },
      ),
    );
  }
}
