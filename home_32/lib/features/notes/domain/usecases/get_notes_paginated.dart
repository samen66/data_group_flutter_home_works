import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/note_entity.dart';
import '../repositories/notes_repository.dart';

/// Use case для получения заметок/задач с пагинацией
class GetNotesPaginated {
  final NotesRepository repository;

  GetNotesPaginated(this.repository);

  Future<Either<Failure, List<NoteEntity>>> call({
    required String collection,
    required String userId,
    int limit = 10,
    DocumentSnapshot? lastDocument,
  }) async {
    return await repository.getNotesPaginated(
      collection: collection,
      userId: userId,
      limit: limit,
      lastDocument: lastDocument,
    );
  }
}
