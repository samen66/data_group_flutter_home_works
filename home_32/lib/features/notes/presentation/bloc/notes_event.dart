import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/note_entity.dart';

part 'notes_event.freezed.dart';

/// События для работы с заметками
@freezed
class NotesEvent with _$NotesEvent {
  /// Загрузить заметки
  const factory NotesEvent.loadNotes(String collection) = _LoadNotes;

  /// Загрузить ещё (пагинация)
  const factory NotesEvent.loadMore(String collection) = _LoadMore;

  /// Создать заметку
  const factory NotesEvent.createNote({
    required NoteEntity note,
    required String collection,
  }) = _CreateNote;

  /// Обновить заметку
  const factory NotesEvent.updateNote({
    required NoteEntity note,
    required String collection,
  }) = _UpdateNote;

  /// Удалить заметку
  const factory NotesEvent.deleteNote({
    required String noteId,
    required String collection,
  }) = _DeleteNote;

  /// Поиск заметок
  const factory NotesEvent.searchNotes({
    required String collection,
    required String query,
  }) = _SearchNotes;

  /// Фильтрация заметок
  const factory NotesEvent.filterNotes({
    required String collection,
    NoteStatus? status,
    String? category,
  }) = _FilterNotes;

  /// Очистить фильтры
  const factory NotesEvent.clearFilters(String collection) = _ClearFilters;
}
