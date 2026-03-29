import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          CircleAvatar(
            radius: 48,
            backgroundColor: theme.colorScheme.primaryContainer,
            child: Icon(Icons.person, size: 48, color: theme.colorScheme.onPrimaryContainer),
          ),
          const SizedBox(height: 16),
          Text('Demo user', style: theme.textTheme.headlineSmall),
          const SizedBox(height: 8),
          Text(
            'This screen is static UI. Notes on Home use the repository + datasource stack.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}
