import 'package:hw_39/core/result/result.dart';
import 'package:hw_39/features/notes/domain/entities/note.dart';
import 'package:hw_39/features/notes/domain/repositories/notes_repository.dart';

class AddNoteUseCase {
  AddNoteUseCase({required NotesRepository repository})
      : _repository = repository;

  final NotesRepository _repository;

  Future<Result<Note>> call(Note note) async {
    try {
      final Note savedNote = await _repository.addNote(note);
      return Result<Note>.success(savedNote);
    } on Exception catch (error) {
      return Result<Note>.failure('Failed to add note: $error');
    }
  }
}
