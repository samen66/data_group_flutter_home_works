import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/email_password_form.dart';
import '../widgets/error_message_widget.dart';
import 'register_page.dart';
import 'forgot_password_page.dart';

/// Страница входа
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            AuthEvent.signInWithEmail(
              email: _emailController.text.trim(),
              password: _passwordController.text,
            ),
          );
    }
  }

  void _handleGoogleSignIn() {
    context.read<AuthBloc>().add(const AuthEvent.signInWithGoogle());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Вход'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            error: (failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(failure.message),
                  backgroundColor: Colors.red,
                ),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          final isLoading = state.maybeWhen(
            loading: () => true,
            orElse: () => false,
          );

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 32),
                Text(
                  'Добро пожаловать!',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Войдите в свой аккаунт',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                if (state.maybeWhen(
                  error: (failure) => failure,
                  orElse: () => null,
                ) != null)
                  ErrorMessageWidget(
                    failure: state.maybeWhen(
                      error: (failure) => failure,
                      orElse: () => throw StateError('Should not happen'),
                    )!,
                  ),
                EmailPasswordForm(
                  formKey: _formKey,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  onSubmitted: _handleLogin,
                  submitButtonText: 'Войти',
                  isLoading: isLoading,
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: isLoading
                      ? null
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgotPasswordPage(),
                            ),
                          );
                        },
                  child: const Text('Забыли пароль?'),
                ),
                const SizedBox(height: 16),
                OutlinedButton.icon(
                  onPressed: isLoading ? null : _handleGoogleSignIn,
                  icon: const Icon(Icons.g_mobiledata),
                  label: const Text('Войти через Google'),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Нет аккаунта? '),
                    TextButton(
                      onPressed: isLoading
                          ? null
                          : () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RegisterPage(),
                                ),
                              );
                            },
                      child: const Text('Зарегистрироваться'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
