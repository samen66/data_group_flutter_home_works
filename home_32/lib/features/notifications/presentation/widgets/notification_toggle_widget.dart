import 'package:flutter/material.dart';

/// Виджет переключателя уведомлений
class NotificationToggleWidget extends StatelessWidget {
  final bool enabled;
  final ValueChanged<bool> onChanged;

  const NotificationToggleWidget({
    super.key,
    required this.enabled,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SwitchListTile(
        title: const Text('Уведомления'),
        subtitle: Text(
          enabled
              ? 'Уведомления включены'
              : 'Уведомления выключены',
        ),
        value: enabled,
        onChanged: onChanged,
        secondary: Icon(
          enabled ? Icons.notifications_active : Icons.notifications_off,
          color: enabled ? Colors.blue : Colors.grey,
        ),
      ),
    );
  }
}
