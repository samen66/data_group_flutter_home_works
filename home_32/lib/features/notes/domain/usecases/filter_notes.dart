import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/note_entity.dart';
import '../repositories/notes_repository.dart';

/// Use case для фильтрации заметок/задач
class FilterNotes {
  final NotesRepository repository;

  FilterNotes(this.repository);

  Future<Either<Failure, List<NoteEntity>>> call({
    required String collection,
    required String userId,
    NoteStatus? status,
    String? category,
  }) async {
    return await repository.filterNotes(
      collection: collection,
      userId: userId,
      status: status,
      category: category,
    );
  }
}
