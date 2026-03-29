import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../notes_feed_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Consumer<NotesFeedController>(
        builder: (context, feed, _) {
          if (feed.error != null) {
            return Center(
              child: Text('Could not load notes: ${feed.error}'),
            );
          }
          final notes = feed.notes;
          if (notes.isEmpty) {
            return const Center(
              child: Text('No notes yet. Open the app once with network (remote or cache-first) to populate cache.'),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            itemCount: notes.length,
            separatorBuilder: (_, index) => const Divider(height: 1),
            itemBuilder: (context, i) {
              final n = notes[i];
              return ListTile(
                title: Text(n.title),
                subtitle: Text(
                  n.content,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: n.updatedAt != null
                    ? Text(
                        _shortDate(n.updatedAt!),
                        style: Theme.of(context).textTheme.labelSmall,
                      )
                    : null,
              );
            },
          );
        },
      ),
    );
  }

  static String _shortDate(DateTime d) {
    return '${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
  }
}
