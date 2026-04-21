import 'package:flutter_test/flutter_test.dart';
import 'package:hw_39/features/notes/data/mappers/note_mapper.dart';
import 'package:hw_39/features/notes/domain/entities/note.dart';

import '../../../../fixtures/note_fixtures.dart';

void main() {
  group('NoteMapper.fromDto', () {
    const NoteMapper mapper = NoteMapper();

    test('maps regular dto to domain model', () {
      final noteDto = NoteFixtures.dto();

      final Note result = mapper.fromDto(noteDto);

      expect(result, NoteFixtures.domain());
    });

    test('trims id, title and body', () {
      final noteDto = NoteFixtures.dto(
        id: '  id-7  ',
        title: '  Weekly plan  ',
        body: '  Buy milk  ',
      );

      final Note result = mapper.fromDto(noteDto);

      expect(result.id, 'id-7');
      expect(result.title, 'Weekly plan');
      expect(result.content, 'Buy milk');
    });

    test('keeps multiline body content after trim', () {
      final noteDto = NoteFixtures.dto(
        body: '  line 1\nline 2\nline 3  ',
      );

      final Note result = mapper.fromDto(noteDto);

      expect(result.content, 'line 1\nline 2\nline 3');
    });

    test('maps pinned flag as true', () {
      final noteDto = NoteFixtures.dto(isPinned: true);

      final Note result = mapper.fromDto(noteDto);

      expect(result.isPinned, isTrue);
    });

    test('parses date from ISO string to UTC', () {
      final noteDto = NoteFixtures.dto(
        createdAtIsoValue: '2026-04-21T08:00:00.000Z',
      );

      final Note result = mapper.fromDto(noteDto);

      expect(result.createdAt, DateTime.utc(2026, 4, 21, 8));
      expect(result.createdAt.isUtc, isTrue);
    });
  });
}
