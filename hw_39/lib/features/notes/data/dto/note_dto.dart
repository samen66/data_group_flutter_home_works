class NoteDto {
  const NoteDto({
    required this.id,
    required this.title,
    required this.body,
    required this.createdAtIso,
    required this.isPinned,
  });

  final String id;
  final String title;
  final String body;
  final String createdAtIso;
  final bool isPinned;
}
