import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../pages/login_page.dart';
import '../pages/home_page.dart';
import '../../../../core/widgets/loading_widget.dart';

/// Виджет-обертка для автоматической навигации на основе состояния аутентификации
class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state.when(
          initial: () {
            // При первой загрузке проверяем статус аутентификации
            context.read<AuthBloc>().add(const AuthEvent.checkAuthStatus());
            return const LoadingWidget();
          },
          authenticated: (user) => const HomePage(),
          unauthenticated: () => const LoginPage(),
          loading: () => const LoadingWidget(),
          error: (failure) => const LoginPage(),
        );
      },
    );
  }
}
