import 'dart:convert';

import '../models/note_dto.dart';

/// Simulates network API returning JSON payloads.
abstract class NotesRemoteDataSource {
  Future<List<NoteDto>> fetchNotes();
}

class NotesRemoteDataSourceImpl implements NotesRemoteDataSource {
  NotesRemoteDataSourceImpl({this.networkDelay = const Duration(milliseconds: 600)});

  final Duration networkDelay;

  static const _payload = '''
[
  {"id": "1", "title": "Architecture", "content": "Domain ← Data ← UI", "updatedAt": "2026-03-28T10:00:00.000Z"},
  {"id": "2", "title": "SOLID", "content": "Small interfaces, one reason to change.", "updatedAt": "2026-03-28T11:30:00.000Z"},
  {"id": "3", "title": "Caching", "content": "Local first, then refresh.", "updatedAt": "2026-03-29T08:00:00.000Z"}
]
''';

  @override
  Future<List<NoteDto>> fetchNotes() async {
    await Future<void>.delayed(networkDelay);
    final list = jsonDecode(_payload) as List<dynamic>;
    return list
        .whereType<Map<String, dynamic>>()
        .map(NoteDto.tryParse)
        .whereType<NoteDto>()
        .toList();
  }
}
