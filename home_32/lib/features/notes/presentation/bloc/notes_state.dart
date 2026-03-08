import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/note_entity.dart';

part 'notes_state.freezed.dart';

/// Состояния для работы с заметками
@freezed
class NotesState with _$NotesState {
  /// Начальное состояние
  const factory NotesState.initial() = _Initial;

  /// Загрузка
  const factory NotesState.loading() = _Loading;

  /// Загружено успешно
  const factory NotesState.loaded({
    required List<NoteEntity> notes,
    @Default(false) bool hasMore,
    DocumentSnapshot? lastDocument,
  }) = _Loaded;

  /// Пустое состояние
  const factory NotesState.empty() = _Empty;

  /// Ошибка
  const factory NotesState.error(Failure failure) = _Error;
}
