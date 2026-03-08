import 'package:dartz/dartz.dart';
import 'package:dartz/dartz.dart' as dartz;
import '../../../../core/error/failures.dart';
import '../repositories/notes_repository.dart';

/// Use case для удаления заметки/задачи
class DeleteNote {
  final NotesRepository repository;

  DeleteNote(this.repository);

  Future<Either<Failure, dartz.Unit>> call({
    required String noteId,
    required String collection,
  }) async {
    return await repository.deleteNote(
      noteId: noteId,
      collection: collection,
    );
  }
}
