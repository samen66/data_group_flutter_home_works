import 'package:dartz/dartz.dart' hide Task;
import 'package:home_29/core/error/failures.dart';
import 'package:home_29/features/tasks/domain/entities/task.dart';
import 'package:home_29/features/tasks/domain/entities/tag.dart';
import 'package:home_29/features/tasks/domain/repositories/task_repository.dart';
import 'package:home_29/features/tasks/data/models/app_database.dart';
import 'package:home_29/features/tasks/data/models/task_model.dart';
import 'package:home_29/features/tasks/data/models/tag_model.dart';
import 'dart:convert';

class TaskRepositoryImpl implements TaskRepository {
  final AppDatabase database;

  TaskRepositoryImpl({required this.database});

  @override
  Future<Either<Failure, List<Task>>> getTasks() async {
    try {
      final tasksWithTags = await database.getTasksWithTags();
      final tasks = tasksWithTags.map((twt) {
        return twt.task.toEntity(tagName: twt.tag?.name);
      }).toList();
      return Right(tasks);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Stream<Either<Failure, List<Task>>> watchTasks() {
    return database.watchTasksWithTags().map((tasksWithTags) {
      try {
        final tasks = tasksWithTags.map((twt) {
          return twt.task.toEntity(tagName: twt.tag?.name);
        }).toList();
        return Right(tasks);
      } catch (e) {
        return Left(DatabaseFailure(e.toString()));
      }
    });
  }

  @override
  Future<Either<Failure, List<Task>>> getTasksSortedByDate({bool ascending = true}) async {
    try {
      final tasksData = await database.getTasksSortedByDate(ascending: ascending);
      final tagsMap = <int, TagData>{};
      final tagIds = tasksData.where((t) => t.tagId != null).map((t) => t.tagId!).toSet();
      
      if (tagIds.isNotEmpty) {
        final tags = await database.getAllTags();
        for (final tag in tags) {
          if (tagIds.contains(tag.id)) {
            tagsMap[tag.id!] = tag;
          }
        }
      }
      
      final tasks = tasksData.map((taskData) {
        final tag = taskData.tagId != null ? tagsMap[taskData.tagId] : null;
        return taskData.toEntity(tagName: tag?.name);
      }).toList();
      
      return Right(tasks);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Stream<Either<Failure, List<Task>>> watchTasksSortedByDate({bool ascending = true}) {
    return database.watchTasksSortedByDate(ascending: ascending).asyncMap((tasksData) async {
      try {
        final tagsMap = <int, TagData>{};
        final tagIds = tasksData.where((t) => t.tagId != null).map((t) => t.tagId!).toSet();
        
        if (tagIds.isNotEmpty) {
          final tags = await database.getAllTags();
          for (final tag in tags) {
            if (tagIds.contains(tag.id)) {
              tagsMap[tag.id!] = tag;
            }
          }
        }
        
        final tasks = tasksData.map((taskData) {
          final tag = taskData.tagId != null ? tagsMap[taskData.tagId] : null;
          return taskData.toEntity(tagName: tag?.name);
        }).toList();
        
        return Right(tasks);
      } catch (e) {
        return Left(DatabaseFailure(e.toString()));
      }
    });
  }

  @override
  Future<Either<Failure, List<Task>>> getTasksSortedByPriority({bool ascending = true}) async {
    try {
      final tasksData = await database.getTasksSortedByPriority(ascending: ascending);
      final tagsMap = <int, TagData>{};
      final tagIds = tasksData.where((t) => t.tagId != null).map((t) => t.tagId!).toSet();
      
      if (tagIds.isNotEmpty) {
        final tags = await database.getAllTags();
        for (final tag in tags) {
          if (tagIds.contains(tag.id)) {
            tagsMap[tag.id!] = tag;
          }
        }
      }
      
      final tasks = tasksData.map((taskData) {
        final tag = taskData.tagId != null ? tagsMap[taskData.tagId] : null;
        return taskData.toEntity(tagName: tag?.name);
      }).toList();
      
      return Right(tasks);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Stream<Either<Failure, List<Task>>> watchTasksSortedByPriority({bool ascending = true}) {
    return database.watchTasksSortedByPriority(ascending: ascending).asyncMap((tasksData) async {
      try {
        final tagsMap = <int, TagData>{};
        final tagIds = tasksData.where((t) => t.tagId != null).map((t) => t.tagId!).toSet();
        
        if (tagIds.isNotEmpty) {
          final tags = await database.getAllTags();
          for (final tag in tags) {
            if (tagIds.contains(tag.id)) {
              tagsMap[tag.id!] = tag;
            }
          }
        }
        
        final tasks = tasksData.map((taskData) {
          final tag = taskData.tagId != null ? tagsMap[taskData.tagId] : null;
          return taskData.toEntity(tagName: tag?.name);
        }).toList();
        
        return Right(tasks);
      } catch (e) {
        return Left(DatabaseFailure(e.toString()));
      }
    });
  }

  @override
  Future<Either<Failure, Task>> getTaskById(int id) async {
    try {
      final taskData = await database.getTaskById(id);
      if (taskData == null) {
        return Left(DatabaseFailure('Task not found'));
      }
      
      TagData? tagData;
      if (taskData.tagId != null) {
        tagData = await database.getTagById(taskData.tagId!);
      }
      
      return Right(taskData.toEntity(tagName: tagData?.name));
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Task>> createTask(Task task) async {
    try {
      final companion = task.toCompanion();
      final id = await database.insertTask(companion);
      return await getTaskById(id);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Task>> updateTask(Task task) async {
    try {
      if (task.id == null) {
        return Left(ValidationFailure('Task ID is required for update'));
      }
      
      final companion = task.copyWith(updatedAt: DateTime.now()).toCompanion();
      await database.updateTask(companion);
      return await getTaskById(task.id!);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteTask(int id) async {
    try {
      await database.deleteTask(id);
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Tag>>> getTags() async {
    try {
      final tagsData = await database.getAllTags();
      final tags = tagsData.map((tagData) => tagData.toEntity()).toList();
      return Right(tags);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Stream<Either<Failure, List<Tag>>> watchTags() {
    return database.watchAllTags().map((tagsData) {
      try {
        final tags = tagsData.map((tagData) => tagData.toEntity()).toList();
        return Right(tags);
      } catch (e) {
        return Left(DatabaseFailure(e.toString()));
      }
    });
  }

  @override
  Future<Either<Failure, Tag>> getTagById(int id) async {
    try {
      final tagData = await database.getTagById(id);
      if (tagData == null) {
        return Left(DatabaseFailure('Tag not found'));
      }
      return Right(tagData.toEntity());
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Tag>> createTag(Tag tag) async {
    try {
      final companion = tag.toCompanion();
      final id = await database.insertTag(companion);
      return await getTagById(id);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Tag>> updateTag(Tag tag) async {
    try {
      if (tag.id == null) {
        return Left(ValidationFailure('Tag ID is required for update'));
      }
      
      final companion = tag.toCompanion();
      await database.updateTag(companion);
      return await getTagById(tag.id!);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteTag(int id) async {
    try {
      await database.deleteTag(id);
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> exportToJson() async {
    try {
      final tasksResult = await getTasks();
      final tagsResult = await getTags();
      
      return tasksResult.fold(
        (failure) => Left(failure),
        (tasks) async {
          return tagsResult.fold(
            (failure) => Left(failure),
            (tags) {
              final data = {
                'tasks': tasks.map((t) => {
                  'id': t.id,
                  'title': t.title,
                  'description': t.description,
                  'createdAt': t.createdAt.toIso8601String(),
                  'updatedAt': t.updatedAt?.toIso8601String(),
                  'priority': t.priority,
                  'isCompleted': t.isCompleted,
                  'tagId': t.tagId,
                }).toList(),
                'tags': tags.map((t) => {
                  'id': t.id,
                  'name': t.name,
                  'color': t.color,
                }).toList(),
              };
              return Right(jsonEncode(data));
            },
          );
        },
      );
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> importFromJson(String jsonString) async {
    try {
      final data = jsonDecode(jsonString) as Map<String, dynamic>;
      
      // Import tags first
      if (data.containsKey('tags')) {
        final tagsList = data['tags'] as List;
        for (final tagData in tagsList) {
          final tag = Tag(
            id: tagData['id'] as int?,
            name: tagData['name'] as String,
            color: tagData['color'] as String,
          );
          // Try to create, if exists, update
          if (tag.id != null) {
            final existingTag = await database.getTagById(tag.id!);
            if (existingTag != null) {
              await database.updateTag(tag.toCompanion());
            } else {
              await database.insertTag(tag.toCompanion());
            }
          } else {
            await database.insertTag(tag.toCompanion());
          }
        }
      }
      
      // Import tasks
      if (data.containsKey('tasks')) {
        final tasksList = data['tasks'] as List;
        for (final taskData in tasksList) {
          final task = Task(
            id: taskData['id'] as int?,
            title: taskData['title'] as String,
            description: taskData['description'] as String? ?? '',
            createdAt: DateTime.parse(taskData['createdAt'] as String),
            updatedAt: taskData['updatedAt'] != null 
                ? DateTime.parse(taskData['updatedAt'] as String) 
                : null,
            priority: taskData['priority'] as int,
            isCompleted: taskData['isCompleted'] as bool? ?? false,
            tagId: taskData['tagId'] as int?,
          );
          // Try to create, if exists, update
          if (task.id != null) {
            final existingTask = await database.getTaskById(task.id!);
            if (existingTask != null) {
              await database.updateTask(task.toCompanion());
            } else {
              await database.insertTask(task.toCompanion());
            }
          } else {
            await database.insertTask(task.toCompanion());
          }
        }
      }
      
      return const Right(unit);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}
