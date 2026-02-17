import 'package:drift/drift.dart';
import 'package:home_29/features/tasks/domain/entities/tag.dart';
import 'package:home_29/features/tasks/data/models/app_database.dart';

extension TagModelExtension on Tag {
  TagsCompanion toCompanion() {
    return TagsCompanion(
      id: id != null ? Value(id!) : const Value.absent(),
      name: Value(name),
      color: Value(color),
    );
  }
}

extension TagEntityExtension on TagData {
  Tag toEntity() {
    return Tag(
      id: id,
      name: name,
      color: color,
    );
  }
}
