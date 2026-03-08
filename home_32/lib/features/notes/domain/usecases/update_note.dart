import 'package:dartz/dartz.dart';
import 'package:dartz/dartz.dart' as dartz;
import '../../../../core/error/failures.dart';
import '../entities/note_entity.dart';
import '../repositories/notes_repository.dart';

/// Use case для обновления заметки/задачи
class UpdateNote {
  final NotesRepository repository;

  UpdateNote(this.repository);

  Future<Either<Failure, dartz.Unit>> call({
    required NoteEntity note,
    required String collection,
  }) async {
    return await repository.updateNote(
      note: note,
      collection: collection,
    );
  }
}
