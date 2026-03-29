import '../../domain/entities/note.dart';
import '../../domain/repositories/notes_data_policy.dart';
import '../../domain/repositories/notes_repository.dart';
import '../adapters/note_adapter.dart';
import '../datasources/notes_local_datasource.dart';
import '../datasources/notes_remote_datasource.dart';
import '../strategies/notes_load_strategy.dart';

class NotesRepositoryImpl implements NotesRepository {
  NotesRepositoryImpl({
    required NotesLocalDataSource localDataSource,
    required NotesRemoteDataSource remoteDataSource,
    required NoteAdapter adapter,
    NotesDataPolicy initialPolicy = NotesDataPolicy.cacheFirst,
  })  : _local = localDataSource,
        _remote = remoteDataSource,
        _adapter = adapter,
        _policy = initialPolicy {
    _strategy = _strategyFor(_policy);
  }

  final NotesLocalDataSource _local;
  final NotesRemoteDataSource _remote;
  final NoteAdapter _adapter;

  NotesDataPolicy _policy;
  late NotesLoadStrategy _strategy;

  @override
  NotesDataPolicy get dataPolicy => _policy;

  @override
  set dataPolicy(NotesDataPolicy value) {
    _policy = value;
    _strategy = _strategyFor(value);
  }

  static NotesLoadStrategy _strategyFor(NotesDataPolicy policy) {
    return switch (policy) {
      NotesDataPolicy.cacheFirst => CacheFirstNotesLoadStrategy(),
      NotesDataPolicy.remoteOnly => RemoteOnlyNotesLoadStrategy(),
      NotesDataPolicy.localOnly => LocalOnlyNotesLoadStrategy(),
    };
  }

  @override
  Stream<List<Note>> watchNotes() {
    return _strategy.load(_local, _remote).map(_adapter.mapDtosToDomain);
  }
}
