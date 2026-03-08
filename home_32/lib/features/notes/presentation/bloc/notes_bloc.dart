import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/note_entity.dart';
import '../../domain/usecases/create_note.dart';
import '../../domain/usecases/update_note.dart';
import '../../domain/usecases/delete_note.dart';
import '../../domain/usecases/get_notes_stream.dart';
import '../../domain/usecases/get_notes_paginated.dart';
import '../../domain/usecases/search_notes.dart';
import '../../domain/usecases/filter_notes.dart';
import '../../domain/repositories/notes_repository.dart';
import 'notes_event.dart';
import 'notes_state.dart';

/// Bloc для управления состоянием заметок
class NotesBloc extends Bloc<NotesEvent, NotesState> {
  final CreateNote createNote;
  final UpdateNote updateNote;
  final DeleteNote deleteNote;
  final GetNotesStream getNotesStream;
  final GetNotesPaginated getNotesPaginated;
  final SearchNotes searchNotes;
  final FilterNotes filterNotes;
  final NotesRepository notesRepository;

  StreamSubscription<Either<Failure, List<NoteEntity>>>? _notesStreamSubscription;
  String? _currentCollection;
  String? _currentUserId;
  DocumentSnapshot? _lastDocument;
  NoteStatus? _filterStatus;
  String? _filterCategory;

  NotesBloc({
    required this.createNote,
    required this.updateNote,
    required this.deleteNote,
    required this.getNotesStream,
    required this.getNotesPaginated,
    required this.searchNotes,
    required this.filterNotes,
    required this.notesRepository,
  }) : super(const NotesState.initial()) {
    on<NotesEvent>(_onNotesEvent);
  }

  Future<void> _onNotesEvent(
    NotesEvent event,
    Emitter<NotesState> emit,
  ) async {
    await event.map(
      loadNotes: (e) => _onLoadNotes(e.collection, emit),
      loadMore: (e) => _onLoadMore(e.collection, emit),
      createNote: (e) => _onCreateNote(e.note, e.collection, emit),
      updateNote: (e) => _onUpdateNote(e.note, e.collection, emit),
      deleteNote: (e) => _onDeleteNote(e.noteId, e.collection, emit),
      searchNotes: (e) => _onSearchNotes(e.collection, e.query, emit),
      filterNotes: (e) => _onFilterNotes(e.collection, e.status, e.category, emit),
      clearFilters: (e) => _onClearFilters(e.collection, emit),
    );
  }

  Future<void> _onLoadNotes(
    String collection,
    Emitter<NotesState> emit,
  ) async {
    _currentCollection = collection;
    _lastDocument = null;
    _filterStatus = null;
    _filterCategory = null;

    // Подписываемся на поток
    _notesStreamSubscription?.cancel();
    if (_currentUserId != null) {
      emit(const NotesState.loading());
      await emit.forEach(
        getNotesStream(
          collection: collection,
          userId: _currentUserId!,
        ),
        onData: (result) {
          return result.fold(
            (failure) => NotesState.error(failure),
            (notes) {
              if (notes.isEmpty) {
                return const NotesState.empty();
              } else {
                return NotesState.loaded(notes: notes, hasMore: false);
              }
            },
          );
        },
      );
    }
  }

  Future<void> _onLoadMore(
    String collection,
    Emitter<NotesState> emit,
  ) async {
    if (_currentUserId == null || _currentCollection == null) return;

    final currentState = state;
    bool hasMore = false;
    List<NoteEntity> currentNotes = [];
    
    // Проверяем состояние через when (будет доступно после генерации Freezed)
    currentState.when(
      initial: () {},
      loading: () {},
      loaded: (notes, hasMoreValue, lastDoc) {
        hasMore = hasMoreValue;
        currentNotes = notes;
      },
      empty: () {},
      error: (_) {},
    );

    if (!hasMore) return;

    emit(NotesState.loaded(
      notes: currentNotes,
      hasMore: false,
      lastDocument: _lastDocument,
    ));

    final result = await getNotesPaginated(
      collection: collection,
      userId: _currentUserId!,
      limit: 10,
      lastDocument: _lastDocument,
    );

    result.fold(
      (failure) => emit(NotesState.error(failure)),
      (newNotes) {
        List<NoteEntity> allNotes = newNotes;
        // Добавляем к существующим заметкам, если они есть
        currentState.when(
          initial: () {},
          loading: () {},
          loaded: (notes, _, __) {
            allNotes = [...notes, ...newNotes];
          },
          empty: () {},
          error: (_) {},
        );
        _lastDocument = newNotes.isNotEmpty ? null : _lastDocument;
        emit(NotesState.loaded(
          notes: allNotes,
          hasMore: newNotes.length == 10,
          lastDocument: _lastDocument,
        ));
      },
    );
  }

  Future<void> _onCreateNote(
    NoteEntity note,
    String collection,
    Emitter<NotesState> emit,
  ) async {
    emit(const NotesState.loading());
    final result = await createNote(
      note: note,
      collection: collection,
    );
    result.fold(
      (failure) => emit(NotesState.error(failure)),
      (_) {
        // После успешного создания перезагружаем список
        if (_currentUserId != null && _currentCollection != null) {
          add(NotesEvent.loadNotes(_currentCollection!));
        } else {
          // Если нет активного списка, просто переходим в initial
          emit(const NotesState.initial());
        }
      },
    );
  }

  Future<void> _onUpdateNote(
    NoteEntity note,
    String collection,
    Emitter<NotesState> emit,
  ) async {
    emit(const NotesState.loading());
    final result = await updateNote(
      note: note,
      collection: collection,
    );
    result.fold(
      (failure) => emit(NotesState.error(failure)),
      (_) {
        // После успешного обновления перезагружаем список
        if (_currentUserId != null && _currentCollection != null) {
          add(NotesEvent.loadNotes(_currentCollection!));
        } else {
          // Если нет активного списка, просто переходим в initial
          emit(const NotesState.initial());
        }
      },
    );
  }

  Future<void> _onDeleteNote(
    String noteId,
    String collection,
    Emitter<NotesState> emit,
  ) async {
    emit(const NotesState.loading());
    final result = await deleteNote(
      noteId: noteId,
      collection: collection,
    );
    result.fold(
      (failure) => emit(NotesState.error(failure)),
      (_) {
        // После успешного удаления перезагружаем список
        if (_currentUserId != null && _currentCollection != null) {
          add(NotesEvent.loadNotes(_currentCollection!));
        } else {
          // Если нет активного списка, просто переходим в initial
          emit(const NotesState.initial());
        }
      },
    );
  }

  Future<void> _onSearchNotes(
    String collection,
    String query,
    Emitter<NotesState> emit,
  ) async {
    if (_currentUserId == null) return;

    _notesStreamSubscription?.cancel();

    if (query.isEmpty) {
      add(NotesEvent.loadNotes(collection));
      return;
    }

    emit(const NotesState.loading());
    final result = await searchNotes(
      collection: collection,
      query: query,
      userId: _currentUserId!,
    );

    result.fold(
      (failure) => emit(NotesState.error(failure)),
      (notes) {
        if (notes.isEmpty) {
          emit(const NotesState.empty());
        } else {
          emit(NotesState.loaded(notes: notes, hasMore: false));
        }
      },
    );
  }

  Future<void> _onFilterNotes(
    String collection,
    NoteStatus? status,
    String? category,
    Emitter<NotesState> emit,
  ) async {
    if (_currentUserId == null) return;

    _filterStatus = status;
    _filterCategory = category;
    _notesStreamSubscription?.cancel();

    emit(const NotesState.loading());
    final result = await filterNotes(
      collection: collection,
      userId: _currentUserId!,
      status: status,
      category: category,
    );

    result.fold(
      (failure) => emit(NotesState.error(failure)),
      (notes) {
        if (notes.isEmpty) {
          emit(const NotesState.empty());
        } else {
          emit(NotesState.loaded(notes: notes, hasMore: false));
        }
      },
    );
  }

  Future<void> _onClearFilters(
    String collection,
    Emitter<NotesState> emit,
  ) async {
    _filterStatus = null;
    _filterCategory = null;
    add(NotesEvent.loadNotes(collection));
  }

  /// Установить ID текущего пользователя
  void setUserId(String userId) {
    _currentUserId = userId;
  }

  @override
  Future<void> close() {
    _notesStreamSubscription?.cancel();
    return super.close();
  }
}
