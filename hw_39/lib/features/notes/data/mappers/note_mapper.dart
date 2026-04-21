import 'package:hw_39/features/notes/data/dto/note_dto.dart';
import 'package:hw_39/features/notes/domain/entities/note.dart';

class NoteMapper {
  const NoteMapper();

  Note fromDto(NoteDto dto) {
    return Note(
      id: dto.id.trim(),
      title: dto.title.trim(),
      content: dto.body.trim(),
      createdAt: DateTime.parse(dto.createdAtIso).toUtc(),
      isPinned: dto.isPinned,
    );
  }
}
