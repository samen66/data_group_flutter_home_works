/// External shape (API / persisted JSON). Not used in UI or domain directly.
class NoteDto {
  const NoteDto({
    required this.id,
    required this.title,
    required this.content,
    this.updatedAtIso,
  });

  final String id;
  final String title;
  final String content;
  final String? updatedAtIso;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        if (updatedAtIso != null) 'updatedAt': updatedAtIso,
      };

  static NoteDto? tryParse(Map<String, dynamic> json) {
    final id = json['id'];
    final title = json['title'];
    if (id is! String || id.isEmpty) return null;
    if (title is! String) return null;
    final content = json['content'] is String ? json['content'] as String : '';
    final updated =
        json['updatedAt'] is String ? json['updatedAt'] as String : null;
    return NoteDto(
      id: id,
      title: title,
      content: content,
      updatedAtIso: updated,
    );
  }
}
