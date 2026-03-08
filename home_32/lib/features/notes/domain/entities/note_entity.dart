import 'package:equatable/equatable.dart';

/// Тип заметки/задачи
enum NoteType {
  note,
  task,
}

/// Статус задачи
enum NoteStatus {
  pending,
  inProgress,
  completed,
  cancelled,
}

/// Доменная сущность заметки/задачи
class NoteEntity extends Equatable {
  final String? id;
  final String title;
  final String description;
  final NoteType type;
  final NoteStatus? status;
  final String? category;
  final List<String> tags;
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;

  const NoteEntity({
    this.id,
    required this.title,
    required this.description,
    required this.type,
    this.status,
    this.category,
    this.tags = const [],
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        type,
        status,
        category,
        tags,
        userId,
        createdAt,
        updatedAt,
      ];

  @override
  String toString() {
    return 'NoteEntity(id: $id, title: $title, type: $type, status: $status, userId: $userId)';
  }
}
