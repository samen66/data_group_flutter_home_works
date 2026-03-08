import 'package:flutter/material.dart';

/// Виджет кнопки "Загрузить ещё"
class LoadMoreButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isLoading;

  const LoadMoreButton({
    super.key,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : ElevatedButton(
                onPressed: onPressed,
                child: const Text('Загрузить ещё'),
              ),
      ),
    );
  }
}
