import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/note_entity.dart';

/// Абстрактный репозиторий для работы с заметками/задачами
abstract class NotesRepository {
  /// Создать заметку/задачу
  Future<Either<Failure, Unit>> createNote({
    required NoteEntity note,
    required String collection,
  });

  /// Обновить заметку/задачу
  Future<Either<Failure, Unit>> updateNote({
    required NoteEntity note,
    required String collection,
  });

  /// Удалить заметку/задачу
  Future<Either<Failure, Unit>> deleteNote({
    required String noteId,
    required String collection,
  });

  /// Получить поток заметок/задач в реальном времени
  Stream<Either<Failure, List<NoteEntity>>> getNotesStream({
    required String collection,
    required String userId,
  });

  /// Получить заметки/задачи с пагинацией
  Future<Either<Failure, List<NoteEntity>>> getNotesPaginated({
    required String collection,
    required String userId,
    int limit = 10,
    DocumentSnapshot? lastDocument,
  });

  /// Поиск заметок/задач
  Future<Either<Failure, List<NoteEntity>>> searchNotes({
    required String collection,
    required String query,
    required String userId,
  });

  /// Фильтрация заметок/задач
  Future<Either<Failure, List<NoteEntity>>> filterNotes({
    required String collection,
    required String userId,
    NoteStatus? status,
    String? category,
  });
}
