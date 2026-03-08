import 'package:flutter/material.dart';

/// Виджет для отображения пустого состояния
class EmptyStateWidget extends StatelessWidget {
  final String message;
  final IconData icon;

  const EmptyStateWidget({
    super.key,
    this.message = 'Нет данных',
    this.icon = Icons.inbox_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 64,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey,
                ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
