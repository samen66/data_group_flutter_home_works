import 'package:flutter/material.dart';
import 'package:hw_37/core/api/parsed_api_result.dart';

import '../utils/profile_display_formatter.dart';
import 'widgets/profile_attribute_chip.dart';
import 'widgets/profile_avatar_ring.dart';
import 'widgets/profile_glass_panel.dart';
import 'widgets/profile_hero_header.dart';
import 'widgets/profile_menu_row.dart';

/// Full profile scroll view for a [ParsedUser] (composition of smaller widgets).
class ProfileWindow extends StatelessWidget {
  const ProfileWindow({super.key, required this.user});

  final ParsedUser user;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final textTheme = theme.textTheme;

    final topGradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        cs.primaryContainer,
        Color.lerp(cs.primary, cs.tertiary, 0.35)!,
        cs.tertiaryContainer,
      ],
    );

    final initials = ProfileDisplayFormatter.initialsFromDisplayName(user.displayName);
    final handle = ProfileDisplayFormatter.handleFromDisplayName(user.displayName);

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              ProfileHeroHeader(
                gradient: topGradient,
                titleLabel: 'Your space',
                headline: 'Keep building',
                bottomOverlay: ProfileAvatarRing(
                  initials: initials,
                  primary: cs.primary,
                  surface: cs.surface,
                ),
              ),
              const SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    Text(
                      user.displayName,
                      textAlign: TextAlign.center,
                      style: textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        letterSpacing: -0.5,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '@$handle',
                      style: textTheme.titleMedium?.copyWith(
                        color: cs.onSurfaceVariant,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      alignment: WrapAlignment.center,
                      children: [
                        ProfileAttributeChip(
                          icon: Icons.badge_outlined,
                          label: 'ID ${user.id}',
                          backgroundColor: cs.secondaryContainer,
                          foregroundColor: cs.onSecondaryContainer,
                        ),
                        ProfileAttributeChip(
                          icon: Icons.verified_rounded,
                          label: 'Demo account',
                          backgroundColor: cs.primaryContainer,
                          foregroundColor: cs.onPrimaryContainer,
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    ProfileGlassPanel(
                      child: Column(
                        children: [
                          ProfileMenuRow(
                            icon: Icons.insights_rounded,
                            title: 'Activity',
                            subtitle: 'Synced from patterns demo',
                            trailing: Icon(Icons.chevron_right_rounded, color: cs.outline),
                          ),
                          Divider(height: 1, color: cs.outlineVariant.withValues(alpha: 0.5)),
                          ProfileMenuRow(
                            icon: Icons.notifications_active_outlined,
                            title: 'Alerts',
                            subtitle: 'Quiet hours off',
                            trailing: Switch.adaptive(
                              value: true,
                              onChanged: (_) {},
                            ),
                          ),
                          Divider(height: 1, color: cs.outlineVariant.withValues(alpha: 0.5)),
                          ProfileMenuRow(
                            icon: Icons.palette_outlined,
                            title: 'Appearance',
                            subtitle: 'Follows system',
                            trailing: Icon(Icons.chevron_right_rounded, color: cs.outline),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Singletons · factories · get_it — see README',
                      textAlign: TextAlign.center,
                      style: textTheme.bodySmall?.copyWith(
                        color: cs.onSurfaceVariant.withValues(alpha: 0.8),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
