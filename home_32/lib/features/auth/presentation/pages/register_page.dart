import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/email_password_form.dart';
import '../widgets/error_message_widget.dart';

/// Страница регистрации
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleRegister() {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
            AuthEvent.signUpWithEmail(
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
        title: const Text('Регистрация'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          state.maybeWhen(
            authenticated: (user) {
              Navigator.of(context).pop();
            },
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
                  'Создать аккаунт',
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  'Заполните форму для регистрации',
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
                  confirmPasswordController: _confirmPasswordController,
                  showConfirmPassword: true,
                  onSubmitted: _handleRegister,
                  submitButtonText: 'Зарегистрироваться',
                  isLoading: isLoading,
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
                    const Text('Уже есть аккаунт? '),
                    TextButton(
                      onPressed: isLoading
                          ? null
                          : () {
                              Navigator.of(context).pop();
                            },
                      child: const Text('Войти'),
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
