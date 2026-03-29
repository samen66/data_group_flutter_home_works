import 'dart:async';

import 'package:flutter/foundation.dart';

import '../domain/entities/note.dart';
import '../domain/repositories/notes_repository.dart';

/// Presentation helper: subscribes to [NotesRepository.watchNotes] and notifies UI.
class NotesFeedController extends ChangeNotifier {
  NotesFeedController(this._repository);

  final NotesRepository _repository;

  StreamSubscription<List<Note>>? _subscription;
  List<Note> _notes = [];
  Object? _error;

  List<Note> get notes => _notes;
  Object? get error => _error;

  void start() {
    _subscription?.cancel();
    _error = null;
    _subscription = _repository.watchNotes().listen(
      (next) {
        _notes = next;
        _error = null;
        notifyListeners();
      },
      onError: (Object e, StackTrace st) {
        _error = e;
        if (kDebugMode) {
          // ignore: avoid_print
          print('Notes stream error: $e\n$st');
        }
        notifyListeners();
      },
    );
  }

  /// Call after changing [NotesRepository.dataPolicy] so a new stream is used.
  void reload() => start();

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
