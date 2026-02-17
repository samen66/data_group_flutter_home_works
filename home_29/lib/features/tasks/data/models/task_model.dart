import 'package:drift/drift.dart';
import 'package:home_29/features/tasks/domain/entities/task.dart';
import 'package:home_29/features/tasks/data/models/app_database.dart';

extension TaskModelExtension on Task {
  TasksCompanion toCompanion() {
    return TasksCompanion(
      id: id != null ? Value(id!) : const Value.absent(),
      title: Value(title),
      description: Value(description),
      createdAt: Value(createdAt),
      updatedAt: updatedAt != null ? Value(updatedAt!) : const Value.absent(),
      priority: Value(priority),
      isCompleted: Value(isCompleted),
      tagId: tagId != null ? Value(tagId!) : const Value.absent(),
      notes: const Value.absent(), // Will use default from DB
    );
  }
}

extension TaskEntityExtension on TaskData {
  Task toEntity({String? tagName}) {
    return Task(
      id: id,
      title: title,
      description: description ?? '',
      createdAt: createdAt,
      updatedAt: updatedAt,
      priority: priority,
      isCompleted: isCompleted,
      tagId: tagId,
      tagName: tagName,
    );
  }
}
