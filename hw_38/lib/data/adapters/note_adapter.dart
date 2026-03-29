import '../../domain/entities/note.dart';
import '../models/note_dto.dart';

/// Adapter: maps external DTOs into domain [Note] values.
class NoteAdapter {
  /// Single DTO → domain; returns `null` if timestamps or required fields are unusable.
  Note? toDomain(NoteDto dto) {
    DateTime? updated;
    if (dto.updatedAtIso != null && dto.updatedAtIso!.isNotEmpty) {
      updated = DateTime.tryParse(dto.updatedAtIso!);
    }
    return Note(
      id: dto.id,
      title: dto.title,
      content: dto.content,
      updatedAt: updated,
    );
  }

  /// Parses a loose JSON map (e.g. API row) into a DTO, then into domain.
  Note? fromJsonMap(Map<String, dynamic> json) {
    final dto = NoteDto.tryParse(json);
    if (dto == null) return null;
    return toDomain(dto);
  }

  /// Batch map; drops entries that fail [toDomain] / parsing.
  List<Note> mapDtosToDomain(Iterable<NoteDto> dtos) {
    return dtos.map(toDomain).whereType<Note>().toList();
  }

  /// Parses a JSON list of maps; skips invalid elements.
  List<Note> fromJsonList(List<dynamic> raw) {
    final out = <Note>[];
    for (final item in raw) {
      if (item is! Map<String, dynamic>) continue;
      final note = fromJsonMap(item);
      if (note != null) out.add(note);
    }
    return out;
  }
}
