import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/user_profile_widget.dart';
import '../../../../core/widgets/loading_widget.dart';

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
