/// Domain entity — independent of JSON, storage, or transport.
class Note {
  const Note({
    required this.id,
    required this.title,
    required this.content,
    this.updatedAt,
  });

  final String id;
  final String title;
  final String content;
  final DateTime? updatedAt;
}
