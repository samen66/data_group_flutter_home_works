import 'package:flutter/material.dart';

/// Переиспользуемая форма для email и password
class EmailPasswordForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController? confirmPasswordController;
  final bool showConfirmPassword;
  final VoidCallback onSubmitted;
  final String submitButtonText;
  final bool isLoading;

  const EmailPasswordForm({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    this.confirmPasswordController,
    this.showConfirmPassword = false,
    required this.onSubmitted,
    required this.submitButtonText,
    this.isLoading = false,
  });

  @override
  State<EmailPasswordForm> createState() => _EmailPasswordFormState();
}

class _EmailPasswordFormState extends State<EmailPasswordForm> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: widget.emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Email',
              hintText: 'Введите email',
              prefixIcon: Icon(Icons.email),
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Пожалуйста, введите email';
              }
              if (!value.contains('@') || !value.contains('.')) {
                return 'Введите корректный email';
              }
              return null;
            },
            enabled: !widget.isLoading,
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: widget.passwordController,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              labelText: 'Пароль',
              hintText: 'Введите пароль',
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
              border: const OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Пожалуйста, введите пароль';
              }
              if (value.length < 6) {
                return 'Пароль должен содержать минимум 6 символов';
              }
              return null;
            },
            enabled: !widget.isLoading,
          ),
          if (widget.showConfirmPassword && widget.confirmPasswordController != null) ...[
            const SizedBox(height: 16),
            TextFormField(
              controller: widget.confirmPasswordController,
              obscureText: _obscureConfirmPassword,
              decoration: InputDecoration(
                labelText: 'Подтвердите пароль',
                hintText: 'Введите пароль еще раз',
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureConfirmPassword ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscureConfirmPassword = !_obscureConfirmPassword;
                    });
                  },
                ),
                border: const OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Пожалуйста, подтвердите пароль';
                }
                if (value != widget.passwordController.text) {
                  return 'Пароли не совпадают';
                }
                return null;
              },
              enabled: !widget.isLoading,
            ),
          ],
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: widget.isLoading ? null : widget.onSubmitted,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: widget.isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(widget.submitButtonText),
          ),
        ],
      ),
    );
  }
}
