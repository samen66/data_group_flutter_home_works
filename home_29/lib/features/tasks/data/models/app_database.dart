import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'tasks_table.dart';
import 'tags_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Tasks, Tags])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 2; // Start with version 2 to demonstrate migration

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          // Migration from version 1 to 2: add notes field with default value
          await m.addColumn(tasks, tasks.notes);
          // Set default value for existing records
          await customStatement('UPDATE tasks SET notes = ? WHERE notes IS NULL', ['']);
        }
      },
    );
  }

  // Tasks queries
  Future<List<TaskData>> getAllTasks() => select(tasks).get();
  
  Stream<List<TaskData>> watchAllTasks() => select(tasks).watch();
  
  Future<List<TaskData>> getTasksSortedByDate({bool ascending = true}) {
    final query = select(tasks);
    query.orderBy([
      (t) => OrderingTerm(expression: t.createdAt, mode: ascending ? OrderingMode.asc : OrderingMode.desc)
    ]);
    return query.get();
  }
  
  Stream<List<TaskData>> watchTasksSortedByDate({bool ascending = true}) {
    final query = select(tasks);
    query.orderBy([
      (t) => OrderingTerm(expression: t.createdAt, mode: ascending ? OrderingMode.asc : OrderingMode.desc)
    ]);
    return query.watch();
  }
  
  Future<List<TaskData>> getTasksSortedByPriority({bool ascending = true}) {
    final query = select(tasks);
    query.orderBy([
      (t) => OrderingTerm(expression: t.priority, mode: ascending ? OrderingMode.asc : OrderingMode.desc)
    ]);
    return query.get();
  }
  
  Stream<List<TaskData>> watchTasksSortedByPriority({bool ascending = true}) {
    final query = select(tasks);
    query.orderBy([
      (t) => OrderingTerm(expression: t.priority, mode: ascending ? OrderingMode.asc : OrderingMode.desc)
    ]);
    return query.watch();
  }
  
  Future<TaskData?> getTaskById(int id) => (select(tasks)..where((t) => t.id.equals(id))).getSingleOrNull();
  
  Future<int> insertTask(TasksCompanion task) => into(tasks).insert(task);
  
  Future<bool> updateTask(TasksCompanion task) => update(tasks).replace(task);
  
  Future<int> deleteTask(int id) => (delete(tasks)..where((t) => t.id.equals(id))).go();
  
  // Tags queries
  Future<List<TagData>> getAllTags() => select(tags).get();
  
  Stream<List<TagData>> watchAllTags() => select(tags).watch();
  
  Future<TagData?> getTagById(int id) => (select(tags)..where((t) => t.id.equals(id))).getSingleOrNull();
  
  Future<int> insertTag(TagsCompanion tag) => into(tags).insert(tag);
  
  Future<bool> updateTag(TagsCompanion tag) => update(tags).replace(tag);
  
  Future<int> deleteTag(int id) => (delete(tags)..where((t) => t.id.equals(id))).go();
  
  // Join queries to get tasks with tags
  Stream<List<TaskWithTag>> watchTasksWithTags() {
    return (select(tasks)
          ..orderBy([(t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)]))
        .join([
          leftOuterJoin(tags, tags.id.equalsExp(tasks.tagId)),
        ])
        .watch()
        .map((rows) {
      return rows.map((row) {
        return TaskWithTag(
          task: row.readTable(tasks),
          tag: row.readTableOrNull(tags),
        );
      }).toList();
    });
  }
  
  Future<List<TaskWithTag>> getTasksWithTags() {
    return (select(tasks)
          ..orderBy([(t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)]))
        .join([
          leftOuterJoin(tags, tags.id.equalsExp(tasks.tagId)),
        ])
        .get()
        .then((rows) {
      return rows.map((row) {
        return TaskWithTag(
          task: row.readTable(tasks),
          tag: row.readTableOrNull(tags),
        );
      }).toList();
    });
  }
}

class TaskWithTag {
  final TaskData task;
  final TagData? tag;
  
  TaskWithTag({required this.task, this.tag});
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'tasks.db'));
    return NativeDatabase(file);
  });
}
