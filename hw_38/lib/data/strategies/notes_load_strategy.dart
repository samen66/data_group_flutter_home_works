import '../datasources/notes_local_datasource.dart';
import '../datasources/notes_remote_datasource.dart';
import '../models/note_dto.dart';

/// Strategy for how local and remote sources are combined (Open/Closed).
abstract class NotesLoadStrategy {
  Stream<List<NoteDto>> load(
    NotesLocalDataSource local,
    NotesRemoteDataSource remote,
  );
}

/// Yields cached DTOs immediately, then remote when successful (updates cache).
class CacheFirstNotesLoadStrategy implements NotesLoadStrategy {
  @override
  Stream<List<NoteDto>> load(
    NotesLocalDataSource local,
    NotesRemoteDataSource remote,
  ) async* {
    final cached = await local.getNotes();
    yield cached;
    try {
      final fresh = await remote.fetchNotes();
      await local.saveNotes(fresh);
      yield fresh;
    } on Object {
      // Keep last emitted list on failure.
    }
  }
}

/// Always hits remote; persists to local for next offline/cache-first run.
class RemoteOnlyNotesLoadStrategy implements NotesLoadStrategy {
  @override
  Stream<List<NoteDto>> load(
    NotesLocalDataSource local,
    NotesRemoteDataSource remote,
  ) async* {
    final fresh = await remote.fetchNotes();
    await local.saveNotes(fresh);
    yield fresh;
  }
}

/// Offline or privacy mode: local cache only.
class LocalOnlyNotesLoadStrategy implements NotesLoadStrategy {
  @override
  Stream<List<NoteDto>> load(
    NotesLocalDataSource local,
    NotesRemoteDataSource remote,
  ) async* {
    yield await local.getNotes();
  }
}
