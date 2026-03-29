import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/note_dto.dart';

/// Persists note DTOs as JSON (simulates local DB / cache).
abstract class NotesLocalDataSource {
  Future<List<NoteDto>> getNotes();
  Future<void> saveNotes(List<NoteDto> notes);
  Future<void> clear();
}

class NotesLocalDataSourceImpl implements NotesLocalDataSource {
  NotesLocalDataSourceImpl(this._prefs);

  static const _key = 'notes_cache_v1';

  final SharedPreferences _prefs;

  @override
  Future<List<NoteDto>> getNotes() async {
    final raw = _prefs.getString(_key);
    if (raw == null || raw.isEmpty) return [];
    try {
      final decoded = jsonDecode(raw);
      if (decoded is! List<dynamic>) return [];
      return decoded
          .whereType<Map<String, dynamic>>()
          .map(NoteDto.tryParse)
          .whereType<NoteDto>()
          .toList();
    } on FormatException {
      return [];
    }
  }

  @override
  Future<void> saveNotes(List<NoteDto> notes) async {
    final encoded = jsonEncode(notes.map((e) => e.toJson()).toList());
    await _prefs.setString(_key, encoded);
  }

  @override
  Future<void> clear() => _prefs.remove(_key);
}
