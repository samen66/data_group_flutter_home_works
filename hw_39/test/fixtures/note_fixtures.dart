import 'package:hw_39/features/notes/data/dto/note_dto.dart';
import 'package:hw_39/features/notes/domain/entities/note.dart';

final class NoteFixtures {
  static final DateTime createdAt = DateTime.utc(2026, 4, 20, 12, 30);

  static const String createdAtIso = '2026-04-20T12:30:00.000Z';

  static NoteDto dto({
    String id = '1',
    String title = 'Title',
    String body = 'Body',
    String createdAtIsoValue = createdAtIso,
    bool isPinned = false,
  }) {
    return NoteDto(
      id: id,
      title: title,
      body: body,
      createdAtIso: createdAtIsoValue,
      isPinned: isPinned,
    );
  }

  static Note domain({
    String id = '1',
    String title = 'Title',
    String content = 'Body',
    DateTime? createdAtValue,
    bool isPinned = false,
  }) {
    return Note(
      id: id,
      title: title,
      content: content,
      createdAt: createdAtValue ?? createdAt,
      isPinned: isPinned,
    );
  }
}
