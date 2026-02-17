import 'package:equatable/equatable.dart';

class Task extends Equatable {
  final int? id;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int priority; // 1 = low, 2 = medium, 3 = high
  final bool isCompleted;
  final int? tagId;
  final String? tagName; // For display purposes

  const Task({
    this.id,
    required this.title,
    required this.description,
    required this.createdAt,
    this.updatedAt,
    required this.priority,
    this.isCompleted = false,
    this.tagId,
    this.tagName,
  });

  Task copyWith({
    int? id,
    String? title,
    String? description,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? priority,
    bool? isCompleted,
    int? tagId,
    String? tagName,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      priority: priority ?? this.priority,
      isCompleted: isCompleted ?? this.isCompleted,
      tagId: tagId ?? this.tagId,
      tagName: tagName ?? this.tagName,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        createdAt,
        updatedAt,
        priority,
        isCompleted,
        tagId,
        tagName,
      ];
}
