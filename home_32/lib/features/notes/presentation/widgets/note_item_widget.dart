import 'package:flutter/material.dart';
import '../../domain/entities/note_entity.dart';

/// Виджет карточки заметки/задачи
class NoteItemWidget extends StatelessWidget {
  final NoteEntity note;
  final VoidCallback onTap;
  final VoidCallback? onDelete;

  const NoteItemWidget({
    super.key,
    required this.note,
    required this.onTap,
    this.onDelete,
  });

  Color _getStatusColor() {
    switch (note.status) {
      case NoteStatus.pending:
        return Colors.orange;
      case NoteStatus.inProgress:
        return Colors.blue;
      case NoteStatus.completed:
        return Colors.green;
      case NoteStatus.cancelled:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _getStatusText() {
    switch (note.status) {
      case NoteStatus.pending:
        return 'Ожидает';
      case NoteStatus.inProgress:
        return 'В работе';
      case NoteStatus.completed:
        return 'Завершено';
      case NoteStatus.cancelled:
        return 'Отменено';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(
          note.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              note.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              children: [
                if (note.type == NoteType.task && note.status != null)
                  Chip(
                    label: Text(
                      _getStatusText(),
                      style: const TextStyle(fontSize: 12),
                    ),
                    backgroundColor: _getStatusColor().withOpacity(0.2),
                    labelStyle: TextStyle(color: _getStatusColor()),
                    padding: EdgeInsets.zero,
                  ),
                if (note.category != null)
                  Chip(
                    label: Text(
                      note.category!,
                      style: const TextStyle(fontSize: 12),
                    ),
                    padding: EdgeInsets.zero,
                  ),
                if (note.tags.isNotEmpty)
                  ...note.tags.take(2).map(
                        (tag) => Chip(
                          label: Text(
                            tag,
                            style: const TextStyle(fontSize: 12),
                          ),
                          padding: EdgeInsets.zero,
                        ),
                      ),
              ],
            ),
          ],
        ),
        trailing: onDelete != null
            ? IconButton(
                icon: const Icon(Icons.delete_outline),
                onPressed: onDelete,
                color: Colors.red,
              )
            : null,
        onTap: onTap,
      ),
    );
  }
}
