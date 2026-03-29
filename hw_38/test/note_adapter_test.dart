import 'package:flutter_test/flutter_test.dart';
import 'package:hw_38/data/adapters/note_adapter.dart';
import 'package:hw_38/data/models/note_dto.dart';

void main() {
  final adapter = NoteAdapter();

  group('NoteAdapter — normal data', () {
    test('maps valid DTO to domain', () {
      const dto = NoteDto(
        id: 'a',
        title: 'T',
        content: 'C',
        updatedAtIso: '2026-03-29T12:00:00.000Z',
      );
      final note = adapter.toDomain(dto)!;
      expect(note.id, 'a');
      expect(note.title, 'T');
      expect(note.content, 'C');
      expect(note.updatedAt?.toUtc().year, 2026);
    });

    test('fromJsonMap parses list of valid maps', () {
      final raw = [
        {'id': '1', 'title': 'One', 'content': 'x', 'updatedAt': '2026-01-01T00:00:00.000Z'},
      ];
      final notes = adapter.fromJsonList(raw);
      expect(notes, hasLength(1));
      expect(notes.single.title, 'One');
    });
  });

  group('NoteAdapter — empty / missing', () {
    test('fromJsonList skips non-maps', () {
      expect(adapter.fromJsonList(<dynamic>[]), isEmpty);
      expect(adapter.fromJsonList([1, 'x', true]), isEmpty);
    });

    test('mapDtosToDomain keeps empty list empty', () {
      expect(adapter.mapDtosToDomain([]), isEmpty);
    });

    test('tryParse rejects empty id', () {
      expect(
        NoteDto.tryParse({'id': '', 'title': 't'}),
        isNull,
      );
    });
  });

  group('NoteAdapter — incorrect / partial JSON', () {
    test('fromJsonMap returns null for bad id', () {
      expect(adapter.fromJsonMap({'id': 1, 'title': 'x'}), isNull);
      expect(adapter.fromJsonMap({'title': 'only'}), isNull);
    });

    test('fromJsonList drops invalid rows, keeps valid', () {
      final raw = <dynamic>[
        {'id': 'ok', 'title': 'Good', 'content': ''},
        {'id': 'bad'},
        'not-a-map',
        {'id': 'ok2', 'title': 'Also', 'content': 'c'},
      ];
      final notes = adapter.fromJsonList(raw);
      expect(notes.map((e) => e.id).toList(), ['ok', 'ok2']);
    });

    test('invalid date string still yields Note with null updatedAt', () {
      const dto = NoteDto(
        id: 'x',
        title: 't',
        content: '',
        updatedAtIso: 'not-a-date',
      );
      final note = adapter.toDomain(dto);
      expect(note, isNotNull);
      expect(note!.updatedAt, isNull);
    });
  });
}
