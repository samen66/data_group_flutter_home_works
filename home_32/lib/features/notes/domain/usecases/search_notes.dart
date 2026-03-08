import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/note_entity.dart';
import '../repositories/notes_repository.dart';

/// Use case для поиска заметок/задач
class SearchNotes {
  final NotesRepository repository;

  SearchNotes(this.repository);

  Future<Either<Failure, List<NoteEntity>>> call({
    required String collection,
    required String query,
    required String userId,
  }) async {
    return await repository.searchNotes(
      collection: collection,
      query: query,
      userId: userId,
    );
  }
}
