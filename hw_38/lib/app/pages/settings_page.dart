import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/repositories/notes_data_policy.dart';
import '../../domain/repositories/notes_repository.dart';
import '../data_policy_store.dart';
import '../notes_feed_controller.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final repo = context.read<NotesRepository>();
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Notes data strategy', style: theme.textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(
            'Switches datasource strategy: local first + refresh, remote only, or local cache only.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 16),
          SegmentedButton<NotesDataPolicy>(
            showSelectedIcon: false,
            segments: [
              ButtonSegment(
                value: NotesDataPolicy.cacheFirst,
                label: const Text('Cache→net'),
                tooltip: _label(NotesDataPolicy.cacheFirst),
              ),
              ButtonSegment(
                value: NotesDataPolicy.remoteOnly,
                label: const Text('Remote'),
                tooltip: _label(NotesDataPolicy.remoteOnly),
              ),
              ButtonSegment(
                value: NotesDataPolicy.localOnly,
                label: const Text('Local'),
                tooltip: _label(NotesDataPolicy.localOnly),
              ),
            ],
            selected: {repo.dataPolicy},
            onSelectionChanged: (next) async {
              final v = next.single;
              final store = context.read<DataPolicyStore>();
              final feed = context.read<NotesFeedController>();
              repo.dataPolicy = v;
              await store.write(v);
              feed.reload();
              setState(() {});
            },
          ),
          const SizedBox(height: 24),
          Text(
            _hint(repo.dataPolicy),
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  static String _label(NotesDataPolicy p) => switch (p) {
        NotesDataPolicy.cacheFirst => 'Cache first (local → server)',
        NotesDataPolicy.remoteOnly => 'Remote only',
        NotesDataPolicy.localOnly => 'Local only',
      };

  static String _hint(NotesDataPolicy p) => switch (p) {
        NotesDataPolicy.cacheFirst =>
          'Shows cached notes immediately, then updates after fetch.',
        NotesDataPolicy.remoteOnly => 'Always fetches from network; writes cache.',
        NotesDataPolicy.localOnly => 'Never calls network; cache / empty.',
      };
}
