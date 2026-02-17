import 'package:drift/drift.dart';
import 'tags_table.dart';

@DataClassName('TaskData')
class Tasks extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(min: 1, max: 200)();
  TextColumn get description => text().nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
  IntColumn get priority => integer().withDefault(const Constant(1))(); // 1 = low, 2 = medium, 3 = high
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  IntColumn get tagId => integer().nullable().references(Tags, #id, onDelete: KeyAction.setNull)();
  // New field for migration example
  TextColumn get notes => text().nullable().withDefault(const Constant(''))();
}
