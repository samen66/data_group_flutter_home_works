import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:dartz/dartz.dart' as dartz;
import '../../../../core/error/failures.dart';
import '../../../../core/error/exceptions.dart';
import '../../domain/entities/note_entity.dart';
import '../../domain/repositories/notes_repository.dart';
import '../datasources/notes_remote_data_source.dart';
import '../models/note_model.dart';

/// Реализация репозитория заметок
class NotesRepositoryImpl implements NotesRepository {
  final NotesRemoteDataSource remoteDataSource;

  NotesRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, dartz.Unit>> createNote({
    required NoteEntity note,
    required String collection,
  }) async {
    try {
      final noteModel = NoteModel(
        id: note.id,
        title: note.title,
        description: note.description,
        type: note.type,
        status: note.status,
        category: note.category,
        tags: note.tags,
        userId: note.userId,
        createdAt: note.createdAt,
        updatedAt: note.updatedAt,
      );
      await remoteDataSource.createNote(
        note: noteModel,
        collection: collection,
      );
      return const Right(dartz.unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dartz.Unit>> updateNote({
    required NoteEntity note,
    required String collection,
  }) async {
    try {
      final noteModel = NoteModel(
        id: note.id,
        title: note.title,
        description: note.description,
        type: note.type,
        status: note.status,
        category: note.category,
        tags: note.tags,
        userId: note.userId,
        createdAt: note.createdAt,
        updatedAt: note.updatedAt,
      );
      await remoteDataSource.updateNote(
        note: noteModel,
        collection: collection,
      );
      return const Right(dartz.unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, dartz.Unit>> deleteNote({
    required String noteId,
    required String collection,
  }) async {
    try {
      await remoteDataSource.deleteNote(
        noteId: noteId,
        collection: collection,
      );
      return const Right(dartz.unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Stream<Either<Failure, List<NoteEntity>>> getNotesStream({
    required String collection,
    required String userId,
  }) async* {
    try {
      yield* remoteDataSource
          .getNotesStream(collection: collection, userId: userId)
          .map((notes) => Right<Failure, List<NoteEntity>>(
                notes.map((note) => note.toEntity()).toList(),
              ))
          .handleError((error) {
        // Обработка ошибок в stream
        if (error is ServerException) {
          return Left<Failure, List<NoteEntity>>(ServerFailure(error.message));
        }
        return Left<Failure, List<NoteEntity>>(ServerFailure(error.toString()));
      });
    } catch (e) {
      // Обработка ошибок при создании stream
      if (e is ServerException) {
        yield Left<Failure, List<NoteEntity>>(ServerFailure(e.message));
      } else {
        yield Left<Failure, List<NoteEntity>>(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<NoteEntity>>> getNotesPaginated({
    required String collection,
    required String userId,
    int limit = 10,
    DocumentSnapshot? lastDocument,
  }) async {
    try {
      final notes = await remoteDataSource.getNotesPaginated(
        collection: collection,
        userId: userId,
        limit: limit,
        lastDocument: lastDocument,
      );
      return Right(notes.map((note) => note.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<NoteEntity>>> searchNotes({
    required String collection,
    required String query,
    required String userId,
  }) async {
    try {
      final notes = await remoteDataSource.searchNotes(
        collection: collection,
        query: query,
        userId: userId,
      );
      return Right(notes.map((note) => note.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<NoteEntity>>> filterNotes({
    required String collection,
    required String userId,
    NoteStatus? status,
    String? category,
  }) async {
    try {
      final notes = await remoteDataSource.filterNotes(
        collection: collection,
        userId: userId,
        status: status?.name,
        category: category,
      );
      return Right(notes.map((note) => note.toEntity()).toList());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, NoteEntity>> getNoteById({
    required String noteId,
    required String collection,
  }) async {
    try {
      final noteModel = await remoteDataSource.getNoteById(
        noteId: noteId,
        collection: collection,
      );
      return Right(noteModel.toEntity());
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
