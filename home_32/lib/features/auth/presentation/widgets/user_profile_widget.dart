import 'package:flutter/material.dart';
import '../../domain/entities/user_entity.dart';

/// Виджет для отображения профиля пользователя
class UserProfileWidget extends StatelessWidget {
  final UserEntity user;

  const UserProfileWidget({
    super.key,
    required this.user,
  });

  String _getInitials() {
    if (user.displayName != null && user.displayName!.isNotEmpty) {
      final names = user.displayName!.split(' ');
      if (names.length >= 2) {
        return '${names[0][0]}${names[1][0]}'.toUpperCase();
      }
      return names[0][0].toUpperCase();
    }
    if (user.email != null && user.email!.isNotEmpty) {
      return user.email![0].toUpperCase();
    }
    return 'U';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: user.photoURL != null ? NetworkImage(user.photoURL!) : null,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: user.photoURL == null
                  ? Text(
                      _getInitials(),
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  : null,
            ),
            const SizedBox(height: 16),
            Text(
              user.displayName ?? 'Пользователь',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            if (user.email != null) ...[
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    user.email!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  if (user.emailVerified) ...[
                    const SizedBox(width: 8),
                    Icon(
                      Icons.verified,
                      size: 16,
                      color: Colors.green,
                    ),
                  ],
                ],
              ),
            ],
            const SizedBox(height: 8),
            Text(
              'UID: ${user.uid}',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
