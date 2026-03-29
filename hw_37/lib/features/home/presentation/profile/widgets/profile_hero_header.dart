import 'package:flutter/material.dart';

/// Gradient hero block with optional bottom-centered overlay (e.g. avatar).
class ProfileHeroHeader extends StatelessWidget {
  const ProfileHeroHeader({
    super.key,
    required this.gradient,
    required this.bottomOverlay,
    required this.titleLabel,
    required this.headline,
    this.titleColor,
    this.headlineColor,
  });

  final LinearGradient gradient;
  final Widget bottomOverlay;
  final String titleLabel;
  final String headline;
  final Color? titleColor;
  final Color? headlineColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final cs = Theme.of(context).colorScheme;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(24, 8, 24, 72),
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(36),
            ),
            boxShadow: [
              BoxShadow(
                color: cs.primary.withValues(alpha: 0.22),
                blurRadius: 28,
                offset: const Offset(0, 14),
              ),
            ],
          ),
          child: Column(
            children: [
              const SizedBox(height: 8),
              Text(
                titleLabel,
                style: textTheme.labelLarge?.copyWith(
                  color: titleColor ?? cs.onPrimaryContainer.withValues(alpha: 0.85),
                  letterSpacing: 1.2,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                headline,
                style: textTheme.headlineSmall?.copyWith(
                  color: headlineColor ?? cs.onPrimaryContainer,
                  fontWeight: FontWeight.w800,
                  height: 1.1,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -52,
          child: bottomOverlay,
        ),
      ],
    );
  }
}
