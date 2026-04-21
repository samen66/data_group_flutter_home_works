import 'package:flutter_test/flutter_test.dart';
import 'package:hw_39/core/result/result.dart';
import 'package:hw_39/features/notes/domain/entities/note.dart';
import 'package:hw_39/features/notes/domain/repositories/notes_repository.dart';
import 'package:hw_39/features/notes/domain/usecases/add_note_use_case.dart';

import '../../../../fixtures/note_fixtures.dart';

void main() {
  group('AddNoteUseCase', () {
    test('returns Result.success when repository saves note', () async {
      final note = NoteFixtures.domain();
      final repository = _MockNotesRepository(savedNote: note);
      final useCase = AddNoteUseCase(repository: repository);

      final Result<Note> result = await useCase(note);

      expect(result.isSuccess, isTrue);
      expect(result.data, note);
      expect(repository.receivedNotes, [note]);
    });

    test('returns Result.failure with expected message on exception', () async {
      final note = NoteFixtures.domain();
      final repository = _MockNotesRepository(
        shouldThrow: true,
        thrownException: Exception('DB is unavailable'),
      );
      final useCase = AddNoteUseCase(repository: repository);

      final Result<Note> result = await useCase(note);

      expect(result.isFailure, isTrue);
      expect(
        result.message,
        'Failed to add note: Exception: DB is unavailable',
      );
      expect(result.data, isNull);
    });
  });
}

class _MockNotesRepository implements NotesRepository {
  _MockNotesRepository({
    this.savedNote,
    this.shouldThrow = false,
    this.thrownException,
  });

  final Note? savedNote;
  final bool shouldThrow;
  final Exception? thrownException;
  final List<Note> receivedNotes = <Note>[];

  @override
  Future<Note> addNote(Note note) async {
    receivedNotes.add(note);

    if (shouldThrow) {
      throw thrownException ?? Exception('Unknown error');
    }

    return savedNote ?? note;
  }
}
