import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/error/exceptions.dart';
import '../models/note_model.dart';

/// Абстрактный источник данных для удаленной работы с заметками
abstract class NotesRemoteDataSource {
  Future<void> createNote({
    required NoteModel note,
    required String collection,
  });

  Future<void> updateNote({
    required NoteModel note,
    required String collection,
  });

  Future<void> deleteNote({
    required String noteId,
    required String collection,
  });

  Stream<List<NoteModel>> getNotesStream({
    required String collection,
    required String userId,
  });

  Future<List<NoteModel>> getNotesPaginated({
    required String collection,
    required String userId,
    int limit = 10,
    DocumentSnapshot? lastDocument,
  });

  Future<List<NoteModel>> searchNotes({
    required String collection,
    required String query,
    required String userId,
  });

  Future<List<NoteModel>> filterNotes({
    required String collection,
    required String userId,
    String? status,
    String? category,
  });
}

/// Реализация источника данных для удаленной работы с заметками
class NotesRemoteDataSourceImpl implements NotesRemoteDataSource {
  final FirebaseFirestore firestore;

  NotesRemoteDataSourceImpl({required this.firestore});

  @override
  Future<void> createNote({
    required NoteModel note,
    required String collection,
  }) async {
    try {
      final collectionRef = firestore.collection(collection);
      await collectionRef.add(note.toFirestore());
    } on FirebaseException catch (e) {
      throw _mapFirestoreException(e);
    } catch (e) {
      throw ServerException('Failed to create note: ${e.toString()}');
    }
  }

  @override
  Future<void> updateNote({
    required NoteModel note,
    required String collection,
  }) async {
    try {
      if (note.id == null) {
        throw const ServerException('Note ID is required for update');
      }
      final docRef = firestore.collection(collection).doc(note.id);
      await docRef.update(note.toFirestore());
    } on FirebaseException catch (e) {
      throw _mapFirestoreException(e);
    } catch (e) {
      throw ServerException('Failed to update note: ${e.toString()}');
    }
  }

  @override
  Future<void> deleteNote({
    required String noteId,
    required String collection,
  }) async {
    try {
      await firestore.collection(collection).doc(noteId).delete();
    } on FirebaseException catch (e) {
      throw _mapFirestoreException(e);
    } catch (e) {
      throw ServerException('Failed to delete note: ${e.toString()}');
    }
  }

  @override
  Stream<List<NoteModel>> getNotesStream({
    required String collection,
    required String userId,
  }) {
    try {
      // Для stream используем только where, без orderBy, чтобы избежать необходимости в индексе
      // Сортировку делаем на клиенте
      return firestore
          .collection(collection)
          .where('userId', isEqualTo: userId)
          .snapshots()
          .map((snapshot) {
        final notes = snapshot.docs
            .map((doc) => NoteModel.fromFirestore(doc))
            .toList();
        // Сортируем на клиенте по updatedAt (по убыванию)
        notes.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
        return notes;
      });
    } on FirebaseException catch (e) {
      throw _mapFirestoreException(e);
    } catch (e) {
      throw ServerException('Failed to get notes stream: ${e.toString()}');
    }
  }

  @override
  Future<List<NoteModel>> getNotesPaginated({
    required String collection,
    required String userId,
    int limit = 10,
    DocumentSnapshot? lastDocument,
  }) async {
    try {
      Query query = firestore
          .collection(collection)
          .where('userId', isEqualTo: userId)
          .orderBy('updatedAt', descending: true)
          .limit(limit);

      if (lastDocument != null) {
        query = query.startAfterDocument(lastDocument);
      }

      final snapshot = await query.get();
      return snapshot.docs
          .map((doc) => NoteModel.fromFirestore(doc))
          .toList();
    } on FirebaseException catch (e) {
      throw _mapFirestoreException(e);
    } catch (e) {
      throw ServerException('Failed to get notes paginated: ${e.toString()}');
    }
  }

  @override
  Future<List<NoteModel>> searchNotes({
    required String collection,
    required String query,
    required String userId,
  }) async {
    try {
      if (query.isEmpty || query.trim().isEmpty) {
        return [];
      }

      final queryLower = query.toLowerCase().trim();
      final queryUpper = queryLower + '\uf8ff';

      final snapshot = await firestore
          .collection(collection)
          .where('userId', isEqualTo: userId)
          .where('title', isGreaterThanOrEqualTo: queryLower)
          .where('title', isLessThan: queryUpper)
          .orderBy('title')
          .get();

      return snapshot.docs
          .map((doc) => NoteModel.fromFirestore(doc))
          .toList();
    } on FirebaseException catch (e) {
      throw _mapFirestoreException(e);
    } catch (e) {
      throw ServerException('Failed to search notes: ${e.toString()}');
    }
  }

  @override
  Future<List<NoteModel>> filterNotes({
    required String collection,
    required String userId,
    String? status,
    String? category,
  }) async {
    try {
      Query query = firestore
          .collection(collection)
          .where('userId', isEqualTo: userId);

      if (status != null) {
        query = query.where('status', isEqualTo: status);
      }

      if (category != null) {
        query = query.where('category', isEqualTo: category);
      }

      // Используем orderBy только если нет фильтров, требующих составной индекс
      // Для фильтров сортировка будет на клиенте
      if (status == null && category == null) {
        query = query.orderBy('updatedAt', descending: true);
      }

      final snapshot = await query.get();
      return snapshot.docs
          .map((doc) => NoteModel.fromFirestore(doc))
          .toList();
    } on FirebaseException catch (e) {
      throw _mapFirestoreException(e);
    } catch (e) {
      throw ServerException('Failed to filter notes: ${e.toString()}');
    }
  }

  /// Маппинг Firestore исключений в кастомные исключения
  AppException _mapFirestoreException(FirebaseException e) {
    switch (e.code) {
      case 'permission-denied':
        return const ServerException('Permission denied. Check Firestore rules.');
      case 'not-found':
        return const ServerException('Document not found');
      case 'unavailable':
        return const ServerException('Service unavailable. Check your internet connection.');
      case 'deadline-exceeded':
        return const ServerException('Request timeout. Please try again.');
      default:
        return ServerException('Firestore error: ${e.message ?? e.code}');
    }
  }
}
