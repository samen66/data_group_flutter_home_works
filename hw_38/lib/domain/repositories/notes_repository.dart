import '../entities/note.dart';
import 'notes_data_policy.dart';

/// Repository contract lives in domain; data layer provides implementation.
abstract class NotesRepository {
  NotesDataPolicy get dataPolicy;

  set dataPolicy(NotesDataPolicy value);

  /// Emits according to [dataPolicy]: e.g. cache-first yields local then remote.
  Stream<List<Note>> watchNotes();
}
