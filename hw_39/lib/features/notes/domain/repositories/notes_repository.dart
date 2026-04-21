import 'package:hw_39/features/notes/domain/entities/note.dart';

abstract class NotesRepository {
  Future<Note> addNote(Note note);
}
