import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/note_entity.dart';
import '../repositories/notes_repository.dart';

/// Use case для получения потока заметок/задач в реальном времени
class GetNotesStream {
  final NotesRepository repository;

  GetNotesStream(this.repository);

  Stream<Either<Failure, List<NoteEntity>>> call({
    required String collection,
    required String userId,
  }) {
    return repository.getNotesStream(
      collection: collection,
      userId: userId,
    );
  }
}
