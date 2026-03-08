// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notes_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$NotesEvent {
  String get collection => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String collection) loadNotes,
    required TResult Function(String collection) loadMore,
    required TResult Function(NoteEntity note, String collection) createNote,
    required TResult Function(NoteEntity note, String collection) updateNote,
    required TResult Function(String noteId, String collection) deleteNote,
    required TResult Function(String collection, String query) searchNotes,
    required TResult Function(
      String collection,
      NoteStatus? status,
      String? category,
    )
    filterNotes,
    required TResult Function(String collection) clearFilters,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String collection)? loadNotes,
    TResult? Function(String collection)? loadMore,
    TResult? Function(NoteEntity note, String collection)? createNote,
    TResult? Function(NoteEntity note, String collection)? updateNote,
    TResult? Function(String noteId, String collection)? deleteNote,
    TResult? Function(String collection, String query)? searchNotes,
    TResult? Function(String collection, NoteStatus? status, String? category)?
    filterNotes,
    TResult? Function(String collection)? clearFilters,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String collection)? loadNotes,
    TResult Function(String collection)? loadMore,
    TResult Function(NoteEntity note, String collection)? createNote,
    TResult Function(NoteEntity note, String collection)? updateNote,
    TResult Function(String noteId, String collection)? deleteNote,
    TResult Function(String collection, String query)? searchNotes,
    TResult Function(String collection, NoteStatus? status, String? category)?
    filterNotes,
    TResult Function(String collection)? clearFilters,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadNotes value) loadNotes,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_CreateNote value) createNote,
    required TResult Function(_UpdateNote value) updateNote,
    required TResult Function(_DeleteNote value) deleteNote,
    required TResult Function(_SearchNotes value) searchNotes,
    required TResult Function(_FilterNotes value) filterNotes,
    required TResult Function(_ClearFilters value) clearFilters,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadNotes value)? loadNotes,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_CreateNote value)? createNote,
    TResult? Function(_UpdateNote value)? updateNote,
    TResult? Function(_DeleteNote value)? deleteNote,
    TResult? Function(_SearchNotes value)? searchNotes,
    TResult? Function(_FilterNotes value)? filterNotes,
    TResult? Function(_ClearFilters value)? clearFilters,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadNotes value)? loadNotes,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_CreateNote value)? createNote,
    TResult Function(_UpdateNote value)? updateNote,
    TResult Function(_DeleteNote value)? deleteNote,
    TResult Function(_SearchNotes value)? searchNotes,
    TResult Function(_FilterNotes value)? filterNotes,
    TResult Function(_ClearFilters value)? clearFilters,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotesEventCopyWith<NotesEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotesEventCopyWith<$Res> {
  factory $NotesEventCopyWith(
    NotesEvent value,
    $Res Function(NotesEvent) then,
  ) = _$NotesEventCopyWithImpl<$Res, NotesEvent>;
  @useResult
  $Res call({String collection});
}

/// @nodoc
class _$NotesEventCopyWithImpl<$Res, $Val extends NotesEvent>
    implements $NotesEventCopyWith<$Res> {
  _$NotesEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? collection = null}) {
    return _then(
      _value.copyWith(
            collection: null == collection
                ? _value.collection
                : collection // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LoadNotesImplCopyWith<$Res>
    implements $NotesEventCopyWith<$Res> {
  factory _$$LoadNotesImplCopyWith(
    _$LoadNotesImpl value,
    $Res Function(_$LoadNotesImpl) then,
  ) = __$$LoadNotesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String collection});
}

/// @nodoc
class __$$LoadNotesImplCopyWithImpl<$Res>
    extends _$NotesEventCopyWithImpl<$Res, _$LoadNotesImpl>
    implements _$$LoadNotesImplCopyWith<$Res> {
  __$$LoadNotesImplCopyWithImpl(
    _$LoadNotesImpl _value,
    $Res Function(_$LoadNotesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? collection = null}) {
    return _then(
      _$LoadNotesImpl(
        null == collection
            ? _value.collection
            : collection // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$LoadNotesImpl implements _LoadNotes {
  const _$LoadNotesImpl(this.collection);

  @override
  final String collection;

  @override
  String toString() {
    return 'NotesEvent.loadNotes(collection: $collection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadNotesImpl &&
            (identical(other.collection, collection) ||
                other.collection == collection));
  }

  @override
  int get hashCode => Object.hash(runtimeType, collection);

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadNotesImplCopyWith<_$LoadNotesImpl> get copyWith =>
      __$$LoadNotesImplCopyWithImpl<_$LoadNotesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String collection) loadNotes,
    required TResult Function(String collection) loadMore,
    required TResult Function(NoteEntity note, String collection) createNote,
    required TResult Function(NoteEntity note, String collection) updateNote,
    required TResult Function(String noteId, String collection) deleteNote,
    required TResult Function(String collection, String query) searchNotes,
    required TResult Function(
      String collection,
      NoteStatus? status,
      String? category,
    )
    filterNotes,
    required TResult Function(String collection) clearFilters,
  }) {
    return loadNotes(collection);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String collection)? loadNotes,
    TResult? Function(String collection)? loadMore,
    TResult? Function(NoteEntity note, String collection)? createNote,
    TResult? Function(NoteEntity note, String collection)? updateNote,
    TResult? Function(String noteId, String collection)? deleteNote,
    TResult? Function(String collection, String query)? searchNotes,
    TResult? Function(String collection, NoteStatus? status, String? category)?
    filterNotes,
    TResult? Function(String collection)? clearFilters,
  }) {
    return loadNotes?.call(collection);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String collection)? loadNotes,
    TResult Function(String collection)? loadMore,
    TResult Function(NoteEntity note, String collection)? createNote,
    TResult Function(NoteEntity note, String collection)? updateNote,
    TResult Function(String noteId, String collection)? deleteNote,
    TResult Function(String collection, String query)? searchNotes,
    TResult Function(String collection, NoteStatus? status, String? category)?
    filterNotes,
    TResult Function(String collection)? clearFilters,
    required TResult orElse(),
  }) {
    if (loadNotes != null) {
      return loadNotes(collection);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadNotes value) loadNotes,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_CreateNote value) createNote,
    required TResult Function(_UpdateNote value) updateNote,
    required TResult Function(_DeleteNote value) deleteNote,
    required TResult Function(_SearchNotes value) searchNotes,
    required TResult Function(_FilterNotes value) filterNotes,
    required TResult Function(_ClearFilters value) clearFilters,
  }) {
    return loadNotes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadNotes value)? loadNotes,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_CreateNote value)? createNote,
    TResult? Function(_UpdateNote value)? updateNote,
    TResult? Function(_DeleteNote value)? deleteNote,
    TResult? Function(_SearchNotes value)? searchNotes,
    TResult? Function(_FilterNotes value)? filterNotes,
    TResult? Function(_ClearFilters value)? clearFilters,
  }) {
    return loadNotes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadNotes value)? loadNotes,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_CreateNote value)? createNote,
    TResult Function(_UpdateNote value)? updateNote,
    TResult Function(_DeleteNote value)? deleteNote,
    TResult Function(_SearchNotes value)? searchNotes,
    TResult Function(_FilterNotes value)? filterNotes,
    TResult Function(_ClearFilters value)? clearFilters,
    required TResult orElse(),
  }) {
    if (loadNotes != null) {
      return loadNotes(this);
    }
    return orElse();
  }
}

abstract class _LoadNotes implements NotesEvent {
  const factory _LoadNotes(final String collection) = _$LoadNotesImpl;

  @override
  String get collection;

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadNotesImplCopyWith<_$LoadNotesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreImplCopyWith<$Res>
    implements $NotesEventCopyWith<$Res> {
  factory _$$LoadMoreImplCopyWith(
    _$LoadMoreImpl value,
    $Res Function(_$LoadMoreImpl) then,
  ) = __$$LoadMoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String collection});
}

/// @nodoc
class __$$LoadMoreImplCopyWithImpl<$Res>
    extends _$NotesEventCopyWithImpl<$Res, _$LoadMoreImpl>
    implements _$$LoadMoreImplCopyWith<$Res> {
  __$$LoadMoreImplCopyWithImpl(
    _$LoadMoreImpl _value,
    $Res Function(_$LoadMoreImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? collection = null}) {
    return _then(
      _$LoadMoreImpl(
        null == collection
            ? _value.collection
            : collection // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$LoadMoreImpl implements _LoadMore {
  const _$LoadMoreImpl(this.collection);

  @override
  final String collection;

  @override
  String toString() {
    return 'NotesEvent.loadMore(collection: $collection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadMoreImpl &&
            (identical(other.collection, collection) ||
                other.collection == collection));
  }

  @override
  int get hashCode => Object.hash(runtimeType, collection);

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadMoreImplCopyWith<_$LoadMoreImpl> get copyWith =>
      __$$LoadMoreImplCopyWithImpl<_$LoadMoreImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String collection) loadNotes,
    required TResult Function(String collection) loadMore,
    required TResult Function(NoteEntity note, String collection) createNote,
    required TResult Function(NoteEntity note, String collection) updateNote,
    required TResult Function(String noteId, String collection) deleteNote,
    required TResult Function(String collection, String query) searchNotes,
    required TResult Function(
      String collection,
      NoteStatus? status,
      String? category,
    )
    filterNotes,
    required TResult Function(String collection) clearFilters,
  }) {
    return loadMore(collection);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String collection)? loadNotes,
    TResult? Function(String collection)? loadMore,
    TResult? Function(NoteEntity note, String collection)? createNote,
    TResult? Function(NoteEntity note, String collection)? updateNote,
    TResult? Function(String noteId, String collection)? deleteNote,
    TResult? Function(String collection, String query)? searchNotes,
    TResult? Function(String collection, NoteStatus? status, String? category)?
    filterNotes,
    TResult? Function(String collection)? clearFilters,
  }) {
    return loadMore?.call(collection);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String collection)? loadNotes,
    TResult Function(String collection)? loadMore,
    TResult Function(NoteEntity note, String collection)? createNote,
    TResult Function(NoteEntity note, String collection)? updateNote,
    TResult Function(String noteId, String collection)? deleteNote,
    TResult Function(String collection, String query)? searchNotes,
    TResult Function(String collection, NoteStatus? status, String? category)?
    filterNotes,
    TResult Function(String collection)? clearFilters,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(collection);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadNotes value) loadNotes,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_CreateNote value) createNote,
    required TResult Function(_UpdateNote value) updateNote,
    required TResult Function(_DeleteNote value) deleteNote,
    required TResult Function(_SearchNotes value) searchNotes,
    required TResult Function(_FilterNotes value) filterNotes,
    required TResult Function(_ClearFilters value) clearFilters,
  }) {
    return loadMore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadNotes value)? loadNotes,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_CreateNote value)? createNote,
    TResult? Function(_UpdateNote value)? updateNote,
    TResult? Function(_DeleteNote value)? deleteNote,
    TResult? Function(_SearchNotes value)? searchNotes,
    TResult? Function(_FilterNotes value)? filterNotes,
    TResult? Function(_ClearFilters value)? clearFilters,
  }) {
    return loadMore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadNotes value)? loadNotes,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_CreateNote value)? createNote,
    TResult Function(_UpdateNote value)? updateNote,
    TResult Function(_DeleteNote value)? deleteNote,
    TResult Function(_SearchNotes value)? searchNotes,
    TResult Function(_FilterNotes value)? filterNotes,
    TResult Function(_ClearFilters value)? clearFilters,
    required TResult orElse(),
  }) {
    if (loadMore != null) {
      return loadMore(this);
    }
    return orElse();
  }
}

abstract class _LoadMore implements NotesEvent {
  const factory _LoadMore(final String collection) = _$LoadMoreImpl;

  @override
  String get collection;

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadMoreImplCopyWith<_$LoadMoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateNoteImplCopyWith<$Res>
    implements $NotesEventCopyWith<$Res> {
  factory _$$CreateNoteImplCopyWith(
    _$CreateNoteImpl value,
    $Res Function(_$CreateNoteImpl) then,
  ) = __$$CreateNoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NoteEntity note, String collection});
}

/// @nodoc
class __$$CreateNoteImplCopyWithImpl<$Res>
    extends _$NotesEventCopyWithImpl<$Res, _$CreateNoteImpl>
    implements _$$CreateNoteImplCopyWith<$Res> {
  __$$CreateNoteImplCopyWithImpl(
    _$CreateNoteImpl _value,
    $Res Function(_$CreateNoteImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? note = null, Object? collection = null}) {
    return _then(
      _$CreateNoteImpl(
        note: null == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as NoteEntity,
        collection: null == collection
            ? _value.collection
            : collection // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$CreateNoteImpl implements _CreateNote {
  const _$CreateNoteImpl({required this.note, required this.collection});

  @override
  final NoteEntity note;
  @override
  final String collection;

  @override
  String toString() {
    return 'NotesEvent.createNote(note: $note, collection: $collection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateNoteImpl &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.collection, collection) ||
                other.collection == collection));
  }

  @override
  int get hashCode => Object.hash(runtimeType, note, collection);

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateNoteImplCopyWith<_$CreateNoteImpl> get copyWith =>
      __$$CreateNoteImplCopyWithImpl<_$CreateNoteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String collection) loadNotes,
    required TResult Function(String collection) loadMore,
    required TResult Function(NoteEntity note, String collection) createNote,
    required TResult Function(NoteEntity note, String collection) updateNote,
    required TResult Function(String noteId, String collection) deleteNote,
    required TResult Function(String collection, String query) searchNotes,
    required TResult Function(
      String collection,
      NoteStatus? status,
      String? category,
    )
    filterNotes,
    required TResult Function(String collection) clearFilters,
  }) {
    return createNote(note, collection);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String collection)? loadNotes,
    TResult? Function(String collection)? loadMore,
    TResult? Function(NoteEntity note, String collection)? createNote,
    TResult? Function(NoteEntity note, String collection)? updateNote,
    TResult? Function(String noteId, String collection)? deleteNote,
    TResult? Function(String collection, String query)? searchNotes,
    TResult? Function(String collection, NoteStatus? status, String? category)?
    filterNotes,
    TResult? Function(String collection)? clearFilters,
  }) {
    return createNote?.call(note, collection);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String collection)? loadNotes,
    TResult Function(String collection)? loadMore,
    TResult Function(NoteEntity note, String collection)? createNote,
    TResult Function(NoteEntity note, String collection)? updateNote,
    TResult Function(String noteId, String collection)? deleteNote,
    TResult Function(String collection, String query)? searchNotes,
    TResult Function(String collection, NoteStatus? status, String? category)?
    filterNotes,
    TResult Function(String collection)? clearFilters,
    required TResult orElse(),
  }) {
    if (createNote != null) {
      return createNote(note, collection);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadNotes value) loadNotes,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_CreateNote value) createNote,
    required TResult Function(_UpdateNote value) updateNote,
    required TResult Function(_DeleteNote value) deleteNote,
    required TResult Function(_SearchNotes value) searchNotes,
    required TResult Function(_FilterNotes value) filterNotes,
    required TResult Function(_ClearFilters value) clearFilters,
  }) {
    return createNote(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadNotes value)? loadNotes,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_CreateNote value)? createNote,
    TResult? Function(_UpdateNote value)? updateNote,
    TResult? Function(_DeleteNote value)? deleteNote,
    TResult? Function(_SearchNotes value)? searchNotes,
    TResult? Function(_FilterNotes value)? filterNotes,
    TResult? Function(_ClearFilters value)? clearFilters,
  }) {
    return createNote?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadNotes value)? loadNotes,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_CreateNote value)? createNote,
    TResult Function(_UpdateNote value)? updateNote,
    TResult Function(_DeleteNote value)? deleteNote,
    TResult Function(_SearchNotes value)? searchNotes,
    TResult Function(_FilterNotes value)? filterNotes,
    TResult Function(_ClearFilters value)? clearFilters,
    required TResult orElse(),
  }) {
    if (createNote != null) {
      return createNote(this);
    }
    return orElse();
  }
}

abstract class _CreateNote implements NotesEvent {
  const factory _CreateNote({
    required final NoteEntity note,
    required final String collection,
  }) = _$CreateNoteImpl;

  NoteEntity get note;
  @override
  String get collection;

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateNoteImplCopyWith<_$CreateNoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateNoteImplCopyWith<$Res>
    implements $NotesEventCopyWith<$Res> {
  factory _$$UpdateNoteImplCopyWith(
    _$UpdateNoteImpl value,
    $Res Function(_$UpdateNoteImpl) then,
  ) = __$$UpdateNoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NoteEntity note, String collection});
}

/// @nodoc
class __$$UpdateNoteImplCopyWithImpl<$Res>
    extends _$NotesEventCopyWithImpl<$Res, _$UpdateNoteImpl>
    implements _$$UpdateNoteImplCopyWith<$Res> {
  __$$UpdateNoteImplCopyWithImpl(
    _$UpdateNoteImpl _value,
    $Res Function(_$UpdateNoteImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? note = null, Object? collection = null}) {
    return _then(
      _$UpdateNoteImpl(
        note: null == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as NoteEntity,
        collection: null == collection
            ? _value.collection
            : collection // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$UpdateNoteImpl implements _UpdateNote {
  const _$UpdateNoteImpl({required this.note, required this.collection});

  @override
  final NoteEntity note;
  @override
  final String collection;

  @override
  String toString() {
    return 'NotesEvent.updateNote(note: $note, collection: $collection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateNoteImpl &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.collection, collection) ||
                other.collection == collection));
  }

  @override
  int get hashCode => Object.hash(runtimeType, note, collection);

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateNoteImplCopyWith<_$UpdateNoteImpl> get copyWith =>
      __$$UpdateNoteImplCopyWithImpl<_$UpdateNoteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String collection) loadNotes,
    required TResult Function(String collection) loadMore,
    required TResult Function(NoteEntity note, String collection) createNote,
    required TResult Function(NoteEntity note, String collection) updateNote,
    required TResult Function(String noteId, String collection) deleteNote,
    required TResult Function(String collection, String query) searchNotes,
    required TResult Function(
      String collection,
      NoteStatus? status,
      String? category,
    )
    filterNotes,
    required TResult Function(String collection) clearFilters,
  }) {
    return updateNote(note, collection);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String collection)? loadNotes,
    TResult? Function(String collection)? loadMore,
    TResult? Function(NoteEntity note, String collection)? createNote,
    TResult? Function(NoteEntity note, String collection)? updateNote,
    TResult? Function(String noteId, String collection)? deleteNote,
    TResult? Function(String collection, String query)? searchNotes,
    TResult? Function(String collection, NoteStatus? status, String? category)?
    filterNotes,
    TResult? Function(String collection)? clearFilters,
  }) {
    return updateNote?.call(note, collection);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String collection)? loadNotes,
    TResult Function(String collection)? loadMore,
    TResult Function(NoteEntity note, String collection)? createNote,
    TResult Function(NoteEntity note, String collection)? updateNote,
    TResult Function(String noteId, String collection)? deleteNote,
    TResult Function(String collection, String query)? searchNotes,
    TResult Function(String collection, NoteStatus? status, String? category)?
    filterNotes,
    TResult Function(String collection)? clearFilters,
    required TResult orElse(),
  }) {
    if (updateNote != null) {
      return updateNote(note, collection);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadNotes value) loadNotes,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_CreateNote value) createNote,
    required TResult Function(_UpdateNote value) updateNote,
    required TResult Function(_DeleteNote value) deleteNote,
    required TResult Function(_SearchNotes value) searchNotes,
    required TResult Function(_FilterNotes value) filterNotes,
    required TResult Function(_ClearFilters value) clearFilters,
  }) {
    return updateNote(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadNotes value)? loadNotes,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_CreateNote value)? createNote,
    TResult? Function(_UpdateNote value)? updateNote,
    TResult? Function(_DeleteNote value)? deleteNote,
    TResult? Function(_SearchNotes value)? searchNotes,
    TResult? Function(_FilterNotes value)? filterNotes,
    TResult? Function(_ClearFilters value)? clearFilters,
  }) {
    return updateNote?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadNotes value)? loadNotes,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_CreateNote value)? createNote,
    TResult Function(_UpdateNote value)? updateNote,
    TResult Function(_DeleteNote value)? deleteNote,
    TResult Function(_SearchNotes value)? searchNotes,
    TResult Function(_FilterNotes value)? filterNotes,
    TResult Function(_ClearFilters value)? clearFilters,
    required TResult orElse(),
  }) {
    if (updateNote != null) {
      return updateNote(this);
    }
    return orElse();
  }
}

abstract class _UpdateNote implements NotesEvent {
  const factory _UpdateNote({
    required final NoteEntity note,
    required final String collection,
  }) = _$UpdateNoteImpl;

  NoteEntity get note;
  @override
  String get collection;

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateNoteImplCopyWith<_$UpdateNoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteNoteImplCopyWith<$Res>
    implements $NotesEventCopyWith<$Res> {
  factory _$$DeleteNoteImplCopyWith(
    _$DeleteNoteImpl value,
    $Res Function(_$DeleteNoteImpl) then,
  ) = __$$DeleteNoteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String noteId, String collection});
}

/// @nodoc
class __$$DeleteNoteImplCopyWithImpl<$Res>
    extends _$NotesEventCopyWithImpl<$Res, _$DeleteNoteImpl>
    implements _$$DeleteNoteImplCopyWith<$Res> {
  __$$DeleteNoteImplCopyWithImpl(
    _$DeleteNoteImpl _value,
    $Res Function(_$DeleteNoteImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? noteId = null, Object? collection = null}) {
    return _then(
      _$DeleteNoteImpl(
        noteId: null == noteId
            ? _value.noteId
            : noteId // ignore: cast_nullable_to_non_nullable
                  as String,
        collection: null == collection
            ? _value.collection
            : collection // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$DeleteNoteImpl implements _DeleteNote {
  const _$DeleteNoteImpl({required this.noteId, required this.collection});

  @override
  final String noteId;
  @override
  final String collection;

  @override
  String toString() {
    return 'NotesEvent.deleteNote(noteId: $noteId, collection: $collection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteNoteImpl &&
            (identical(other.noteId, noteId) || other.noteId == noteId) &&
            (identical(other.collection, collection) ||
                other.collection == collection));
  }

  @override
  int get hashCode => Object.hash(runtimeType, noteId, collection);

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteNoteImplCopyWith<_$DeleteNoteImpl> get copyWith =>
      __$$DeleteNoteImplCopyWithImpl<_$DeleteNoteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String collection) loadNotes,
    required TResult Function(String collection) loadMore,
    required TResult Function(NoteEntity note, String collection) createNote,
    required TResult Function(NoteEntity note, String collection) updateNote,
    required TResult Function(String noteId, String collection) deleteNote,
    required TResult Function(String collection, String query) searchNotes,
    required TResult Function(
      String collection,
      NoteStatus? status,
      String? category,
    )
    filterNotes,
    required TResult Function(String collection) clearFilters,
  }) {
    return deleteNote(noteId, collection);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String collection)? loadNotes,
    TResult? Function(String collection)? loadMore,
    TResult? Function(NoteEntity note, String collection)? createNote,
    TResult? Function(NoteEntity note, String collection)? updateNote,
    TResult? Function(String noteId, String collection)? deleteNote,
    TResult? Function(String collection, String query)? searchNotes,
    TResult? Function(String collection, NoteStatus? status, String? category)?
    filterNotes,
    TResult? Function(String collection)? clearFilters,
  }) {
    return deleteNote?.call(noteId, collection);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String collection)? loadNotes,
    TResult Function(String collection)? loadMore,
    TResult Function(NoteEntity note, String collection)? createNote,
    TResult Function(NoteEntity note, String collection)? updateNote,
    TResult Function(String noteId, String collection)? deleteNote,
    TResult Function(String collection, String query)? searchNotes,
    TResult Function(String collection, NoteStatus? status, String? category)?
    filterNotes,
    TResult Function(String collection)? clearFilters,
    required TResult orElse(),
  }) {
    if (deleteNote != null) {
      return deleteNote(noteId, collection);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadNotes value) loadNotes,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_CreateNote value) createNote,
    required TResult Function(_UpdateNote value) updateNote,
    required TResult Function(_DeleteNote value) deleteNote,
    required TResult Function(_SearchNotes value) searchNotes,
    required TResult Function(_FilterNotes value) filterNotes,
    required TResult Function(_ClearFilters value) clearFilters,
  }) {
    return deleteNote(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadNotes value)? loadNotes,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_CreateNote value)? createNote,
    TResult? Function(_UpdateNote value)? updateNote,
    TResult? Function(_DeleteNote value)? deleteNote,
    TResult? Function(_SearchNotes value)? searchNotes,
    TResult? Function(_FilterNotes value)? filterNotes,
    TResult? Function(_ClearFilters value)? clearFilters,
  }) {
    return deleteNote?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadNotes value)? loadNotes,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_CreateNote value)? createNote,
    TResult Function(_UpdateNote value)? updateNote,
    TResult Function(_DeleteNote value)? deleteNote,
    TResult Function(_SearchNotes value)? searchNotes,
    TResult Function(_FilterNotes value)? filterNotes,
    TResult Function(_ClearFilters value)? clearFilters,
    required TResult orElse(),
  }) {
    if (deleteNote != null) {
      return deleteNote(this);
    }
    return orElse();
  }
}

abstract class _DeleteNote implements NotesEvent {
  const factory _DeleteNote({
    required final String noteId,
    required final String collection,
  }) = _$DeleteNoteImpl;

  String get noteId;
  @override
  String get collection;

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteNoteImplCopyWith<_$DeleteNoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchNotesImplCopyWith<$Res>
    implements $NotesEventCopyWith<$Res> {
  factory _$$SearchNotesImplCopyWith(
    _$SearchNotesImpl value,
    $Res Function(_$SearchNotesImpl) then,
  ) = __$$SearchNotesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String collection, String query});
}

/// @nodoc
class __$$SearchNotesImplCopyWithImpl<$Res>
    extends _$NotesEventCopyWithImpl<$Res, _$SearchNotesImpl>
    implements _$$SearchNotesImplCopyWith<$Res> {
  __$$SearchNotesImplCopyWithImpl(
    _$SearchNotesImpl _value,
    $Res Function(_$SearchNotesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? collection = null, Object? query = null}) {
    return _then(
      _$SearchNotesImpl(
        collection: null == collection
            ? _value.collection
            : collection // ignore: cast_nullable_to_non_nullable
                  as String,
        query: null == query
            ? _value.query
            : query // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SearchNotesImpl implements _SearchNotes {
  const _$SearchNotesImpl({required this.collection, required this.query});

  @override
  final String collection;
  @override
  final String query;

  @override
  String toString() {
    return 'NotesEvent.searchNotes(collection: $collection, query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchNotesImpl &&
            (identical(other.collection, collection) ||
                other.collection == collection) &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, collection, query);

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchNotesImplCopyWith<_$SearchNotesImpl> get copyWith =>
      __$$SearchNotesImplCopyWithImpl<_$SearchNotesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String collection) loadNotes,
    required TResult Function(String collection) loadMore,
    required TResult Function(NoteEntity note, String collection) createNote,
    required TResult Function(NoteEntity note, String collection) updateNote,
    required TResult Function(String noteId, String collection) deleteNote,
    required TResult Function(String collection, String query) searchNotes,
    required TResult Function(
      String collection,
      NoteStatus? status,
      String? category,
    )
    filterNotes,
    required TResult Function(String collection) clearFilters,
  }) {
    return searchNotes(collection, query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String collection)? loadNotes,
    TResult? Function(String collection)? loadMore,
    TResult? Function(NoteEntity note, String collection)? createNote,
    TResult? Function(NoteEntity note, String collection)? updateNote,
    TResult? Function(String noteId, String collection)? deleteNote,
    TResult? Function(String collection, String query)? searchNotes,
    TResult? Function(String collection, NoteStatus? status, String? category)?
    filterNotes,
    TResult? Function(String collection)? clearFilters,
  }) {
    return searchNotes?.call(collection, query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String collection)? loadNotes,
    TResult Function(String collection)? loadMore,
    TResult Function(NoteEntity note, String collection)? createNote,
    TResult Function(NoteEntity note, String collection)? updateNote,
    TResult Function(String noteId, String collection)? deleteNote,
    TResult Function(String collection, String query)? searchNotes,
    TResult Function(String collection, NoteStatus? status, String? category)?
    filterNotes,
    TResult Function(String collection)? clearFilters,
    required TResult orElse(),
  }) {
    if (searchNotes != null) {
      return searchNotes(collection, query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadNotes value) loadNotes,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_CreateNote value) createNote,
    required TResult Function(_UpdateNote value) updateNote,
    required TResult Function(_DeleteNote value) deleteNote,
    required TResult Function(_SearchNotes value) searchNotes,
    required TResult Function(_FilterNotes value) filterNotes,
    required TResult Function(_ClearFilters value) clearFilters,
  }) {
    return searchNotes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadNotes value)? loadNotes,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_CreateNote value)? createNote,
    TResult? Function(_UpdateNote value)? updateNote,
    TResult? Function(_DeleteNote value)? deleteNote,
    TResult? Function(_SearchNotes value)? searchNotes,
    TResult? Function(_FilterNotes value)? filterNotes,
    TResult? Function(_ClearFilters value)? clearFilters,
  }) {
    return searchNotes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadNotes value)? loadNotes,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_CreateNote value)? createNote,
    TResult Function(_UpdateNote value)? updateNote,
    TResult Function(_DeleteNote value)? deleteNote,
    TResult Function(_SearchNotes value)? searchNotes,
    TResult Function(_FilterNotes value)? filterNotes,
    TResult Function(_ClearFilters value)? clearFilters,
    required TResult orElse(),
  }) {
    if (searchNotes != null) {
      return searchNotes(this);
    }
    return orElse();
  }
}

abstract class _SearchNotes implements NotesEvent {
  const factory _SearchNotes({
    required final String collection,
    required final String query,
  }) = _$SearchNotesImpl;

  @override
  String get collection;
  String get query;

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchNotesImplCopyWith<_$SearchNotesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterNotesImplCopyWith<$Res>
    implements $NotesEventCopyWith<$Res> {
  factory _$$FilterNotesImplCopyWith(
    _$FilterNotesImpl value,
    $Res Function(_$FilterNotesImpl) then,
  ) = __$$FilterNotesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String collection, NoteStatus? status, String? category});
}

/// @nodoc
class __$$FilterNotesImplCopyWithImpl<$Res>
    extends _$NotesEventCopyWithImpl<$Res, _$FilterNotesImpl>
    implements _$$FilterNotesImplCopyWith<$Res> {
  __$$FilterNotesImplCopyWithImpl(
    _$FilterNotesImpl _value,
    $Res Function(_$FilterNotesImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collection = null,
    Object? status = freezed,
    Object? category = freezed,
  }) {
    return _then(
      _$FilterNotesImpl(
        collection: null == collection
            ? _value.collection
            : collection // ignore: cast_nullable_to_non_nullable
                  as String,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as NoteStatus?,
        category: freezed == category
            ? _value.category
            : category // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$FilterNotesImpl implements _FilterNotes {
  const _$FilterNotesImpl({
    required this.collection,
    this.status,
    this.category,
  });

  @override
  final String collection;
  @override
  final NoteStatus? status;
  @override
  final String? category;

  @override
  String toString() {
    return 'NotesEvent.filterNotes(collection: $collection, status: $status, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterNotesImpl &&
            (identical(other.collection, collection) ||
                other.collection == collection) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, collection, status, category);

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterNotesImplCopyWith<_$FilterNotesImpl> get copyWith =>
      __$$FilterNotesImplCopyWithImpl<_$FilterNotesImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String collection) loadNotes,
    required TResult Function(String collection) loadMore,
    required TResult Function(NoteEntity note, String collection) createNote,
    required TResult Function(NoteEntity note, String collection) updateNote,
    required TResult Function(String noteId, String collection) deleteNote,
    required TResult Function(String collection, String query) searchNotes,
    required TResult Function(
      String collection,
      NoteStatus? status,
      String? category,
    )
    filterNotes,
    required TResult Function(String collection) clearFilters,
  }) {
    return filterNotes(collection, status, category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String collection)? loadNotes,
    TResult? Function(String collection)? loadMore,
    TResult? Function(NoteEntity note, String collection)? createNote,
    TResult? Function(NoteEntity note, String collection)? updateNote,
    TResult? Function(String noteId, String collection)? deleteNote,
    TResult? Function(String collection, String query)? searchNotes,
    TResult? Function(String collection, NoteStatus? status, String? category)?
    filterNotes,
    TResult? Function(String collection)? clearFilters,
  }) {
    return filterNotes?.call(collection, status, category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String collection)? loadNotes,
    TResult Function(String collection)? loadMore,
    TResult Function(NoteEntity note, String collection)? createNote,
    TResult Function(NoteEntity note, String collection)? updateNote,
    TResult Function(String noteId, String collection)? deleteNote,
    TResult Function(String collection, String query)? searchNotes,
    TResult Function(String collection, NoteStatus? status, String? category)?
    filterNotes,
    TResult Function(String collection)? clearFilters,
    required TResult orElse(),
  }) {
    if (filterNotes != null) {
      return filterNotes(collection, status, category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadNotes value) loadNotes,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_CreateNote value) createNote,
    required TResult Function(_UpdateNote value) updateNote,
    required TResult Function(_DeleteNote value) deleteNote,
    required TResult Function(_SearchNotes value) searchNotes,
    required TResult Function(_FilterNotes value) filterNotes,
    required TResult Function(_ClearFilters value) clearFilters,
  }) {
    return filterNotes(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadNotes value)? loadNotes,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_CreateNote value)? createNote,
    TResult? Function(_UpdateNote value)? updateNote,
    TResult? Function(_DeleteNote value)? deleteNote,
    TResult? Function(_SearchNotes value)? searchNotes,
    TResult? Function(_FilterNotes value)? filterNotes,
    TResult? Function(_ClearFilters value)? clearFilters,
  }) {
    return filterNotes?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadNotes value)? loadNotes,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_CreateNote value)? createNote,
    TResult Function(_UpdateNote value)? updateNote,
    TResult Function(_DeleteNote value)? deleteNote,
    TResult Function(_SearchNotes value)? searchNotes,
    TResult Function(_FilterNotes value)? filterNotes,
    TResult Function(_ClearFilters value)? clearFilters,
    required TResult orElse(),
  }) {
    if (filterNotes != null) {
      return filterNotes(this);
    }
    return orElse();
  }
}

abstract class _FilterNotes implements NotesEvent {
  const factory _FilterNotes({
    required final String collection,
    final NoteStatus? status,
    final String? category,
  }) = _$FilterNotesImpl;

  @override
  String get collection;
  NoteStatus? get status;
  String? get category;

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterNotesImplCopyWith<_$FilterNotesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearFiltersImplCopyWith<$Res>
    implements $NotesEventCopyWith<$Res> {
  factory _$$ClearFiltersImplCopyWith(
    _$ClearFiltersImpl value,
    $Res Function(_$ClearFiltersImpl) then,
  ) = __$$ClearFiltersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String collection});
}

/// @nodoc
class __$$ClearFiltersImplCopyWithImpl<$Res>
    extends _$NotesEventCopyWithImpl<$Res, _$ClearFiltersImpl>
    implements _$$ClearFiltersImplCopyWith<$Res> {
  __$$ClearFiltersImplCopyWithImpl(
    _$ClearFiltersImpl _value,
    $Res Function(_$ClearFiltersImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? collection = null}) {
    return _then(
      _$ClearFiltersImpl(
        null == collection
            ? _value.collection
            : collection // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ClearFiltersImpl implements _ClearFilters {
  const _$ClearFiltersImpl(this.collection);

  @override
  final String collection;

  @override
  String toString() {
    return 'NotesEvent.clearFilters(collection: $collection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClearFiltersImpl &&
            (identical(other.collection, collection) ||
                other.collection == collection));
  }

  @override
  int get hashCode => Object.hash(runtimeType, collection);

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClearFiltersImplCopyWith<_$ClearFiltersImpl> get copyWith =>
      __$$ClearFiltersImplCopyWithImpl<_$ClearFiltersImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String collection) loadNotes,
    required TResult Function(String collection) loadMore,
    required TResult Function(NoteEntity note, String collection) createNote,
    required TResult Function(NoteEntity note, String collection) updateNote,
    required TResult Function(String noteId, String collection) deleteNote,
    required TResult Function(String collection, String query) searchNotes,
    required TResult Function(
      String collection,
      NoteStatus? status,
      String? category,
    )
    filterNotes,
    required TResult Function(String collection) clearFilters,
  }) {
    return clearFilters(collection);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String collection)? loadNotes,
    TResult? Function(String collection)? loadMore,
    TResult? Function(NoteEntity note, String collection)? createNote,
    TResult? Function(NoteEntity note, String collection)? updateNote,
    TResult? Function(String noteId, String collection)? deleteNote,
    TResult? Function(String collection, String query)? searchNotes,
    TResult? Function(String collection, NoteStatus? status, String? category)?
    filterNotes,
    TResult? Function(String collection)? clearFilters,
  }) {
    return clearFilters?.call(collection);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String collection)? loadNotes,
    TResult Function(String collection)? loadMore,
    TResult Function(NoteEntity note, String collection)? createNote,
    TResult Function(NoteEntity note, String collection)? updateNote,
    TResult Function(String noteId, String collection)? deleteNote,
    TResult Function(String collection, String query)? searchNotes,
    TResult Function(String collection, NoteStatus? status, String? category)?
    filterNotes,
    TResult Function(String collection)? clearFilters,
    required TResult orElse(),
  }) {
    if (clearFilters != null) {
      return clearFilters(collection);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadNotes value) loadNotes,
    required TResult Function(_LoadMore value) loadMore,
    required TResult Function(_CreateNote value) createNote,
    required TResult Function(_UpdateNote value) updateNote,
    required TResult Function(_DeleteNote value) deleteNote,
    required TResult Function(_SearchNotes value) searchNotes,
    required TResult Function(_FilterNotes value) filterNotes,
    required TResult Function(_ClearFilters value) clearFilters,
  }) {
    return clearFilters(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadNotes value)? loadNotes,
    TResult? Function(_LoadMore value)? loadMore,
    TResult? Function(_CreateNote value)? createNote,
    TResult? Function(_UpdateNote value)? updateNote,
    TResult? Function(_DeleteNote value)? deleteNote,
    TResult? Function(_SearchNotes value)? searchNotes,
    TResult? Function(_FilterNotes value)? filterNotes,
    TResult? Function(_ClearFilters value)? clearFilters,
  }) {
    return clearFilters?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadNotes value)? loadNotes,
    TResult Function(_LoadMore value)? loadMore,
    TResult Function(_CreateNote value)? createNote,
    TResult Function(_UpdateNote value)? updateNote,
    TResult Function(_DeleteNote value)? deleteNote,
    TResult Function(_SearchNotes value)? searchNotes,
    TResult Function(_FilterNotes value)? filterNotes,
    TResult Function(_ClearFilters value)? clearFilters,
    required TResult orElse(),
  }) {
    if (clearFilters != null) {
      return clearFilters(this);
    }
    return orElse();
  }
}

abstract class _ClearFilters implements NotesEvent {
  const factory _ClearFilters(final String collection) = _$ClearFiltersImpl;

  @override
  String get collection;

  /// Create a copy of NotesEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClearFiltersImplCopyWith<_$ClearFiltersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
