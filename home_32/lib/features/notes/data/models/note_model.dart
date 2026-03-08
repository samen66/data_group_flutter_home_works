import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/note_entity.dart';

/// Модель заметки/задачи для data слоя
class NoteModel extends NoteEntity {
  const NoteModel({
    super.id,
    required super.title,
    required super.description,
    required super.type,
    super.status,
    super.category,
    super.tags,
    required super.userId,
    required super.createdAt,
    required super.updatedAt,
  });

  /// Создание модели из Firestore документа
  factory NoteModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return NoteModel(
      id: doc.id,
      title: data['title'] as String? ?? '',
      description: data['description'] as String? ?? '',
      type: _parseNoteType(data['type'] as String?),
      status: _parseNoteStatus(data['status'] as String?),
      category: data['category'] as String?,
      tags: List<String>.from(data['tags'] as List? ?? []),
      userId: data['userId'] as String? ?? '',
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      updatedAt: (data['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  /// Преобразование в доменную сущность
  NoteEntity toEntity() {
    return NoteEntity(
      id: id,
      title: title,
      description: description,
      type: type,
      status: status,
      category: category,
      tags: tags,
      userId: userId,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  /// Преобразование в Map для Firestore
  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'description': description,
      'type': type.name,
      'status': status?.name,
      'category': category,
      'tags': tags,
      'userId': userId,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  /// Парсинг типа заметки из строки
  static NoteType _parseNoteType(String? type) {
    switch (type) {
      case 'task':
        return NoteType.task;
      case 'note':
      default:
        return NoteType.note;
    }
  }

  /// Парсинг статуса из строки
  static NoteStatus? _parseNoteStatus(String? status) {
    switch (status) {
      case 'pending':
        return NoteStatus.pending;
      case 'inProgress':
        return NoteStatus.inProgress;
      case 'completed':
        return NoteStatus.completed;
      case 'cancelled':
        return NoteStatus.cancelled;
      default:
        return null;
    }
  }

  @override
  String toString() {
    return 'NoteModel(id: $id, title: $title, type: $type, status: $status, userId: $userId)';
  }
}
