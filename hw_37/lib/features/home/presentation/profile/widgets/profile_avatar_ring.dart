import 'package:flutter/material.dart';

/// Circular avatar with gradient ring and initials (presentation only).
class ProfileAvatarRing extends StatelessWidget {
  const ProfileAvatarRing({
    super.key,
    required this.initials,
    required this.primary,
    required this.surface,
  });

  final String initials;
  final Color primary;
  final Color surface;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 112,
      height: 112,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: SweepGradient(
          colors: [
            primary,
            Color.lerp(primary, Colors.white, 0.35)!,
            primary,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: primary.withValues(alpha: 0.35),
            blurRadius: 20,
            spreadRadius: 2,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(4),
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: surface,
        ),
        child: Center(
          child: Text(
            initials,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: primary,
                  letterSpacing: 1,
                ),
          ),
        ),
      ),
    );
  }
}
