// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AuthEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signInWithEmail,
    required TResult Function(String email, String password) signUpWithEmail,
    required TResult Function() signOut,
    required TResult Function(String email) resetPassword,
    required TResult Function() signInWithGoogle,
    required TResult Function() checkAuthStatus,
    required TResult Function(UserEntity? user) authStateChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? signInWithEmail,
    TResult? Function(String email, String password)? signUpWithEmail,
    TResult? Function()? signOut,
    TResult? Function(String email)? resetPassword,
    TResult? Function()? signInWithGoogle,
    TResult? Function()? checkAuthStatus,
    TResult? Function(UserEntity? user)? authStateChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmail,
    TResult Function(String email, String password)? signUpWithEmail,
    TResult Function()? signOut,
    TResult Function(String email)? resetPassword,
    TResult Function()? signInWithGoogle,
    TResult Function()? checkAuthStatus,
    TResult Function(UserEntity? user)? authStateChanged,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInWithEmail value) signInWithEmail,
    required TResult Function(_SignUpWithEmail value) signUpWithEmail,
    required TResult Function(_SignOut value) signOut,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
    required TResult Function(_CheckAuthStatus value) checkAuthStatus,
    required TResult Function(_AuthStateChanged value) authStateChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithEmail value)? signInWithEmail,
    TResult? Function(_SignUpWithEmail value)? signUpWithEmail,
    TResult? Function(_SignOut value)? signOut,
    TResult? Function(_ResetPassword value)? resetPassword,
    TResult? Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult? Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(_AuthStateChanged value)? authStateChanged,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithEmail value)? signInWithEmail,
    TResult Function(_SignUpWithEmail value)? signUpWithEmail,
    TResult Function(_SignOut value)? signOut,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult Function(_AuthStateChanged value)? authStateChanged,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SignInWithEmailImplCopyWith<$Res> {
  factory _$$SignInWithEmailImplCopyWith(
    _$SignInWithEmailImpl value,
    $Res Function(_$SignInWithEmailImpl) then,
  ) = __$$SignInWithEmailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$SignInWithEmailImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignInWithEmailImpl>
    implements _$$SignInWithEmailImplCopyWith<$Res> {
  __$$SignInWithEmailImplCopyWithImpl(
    _$SignInWithEmailImpl _value,
    $Res Function(_$SignInWithEmailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? password = null}) {
    return _then(
      _$SignInWithEmailImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SignInWithEmailImpl implements _SignInWithEmail {
  const _$SignInWithEmailImpl({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.signInWithEmail(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignInWithEmailImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignInWithEmailImplCopyWith<_$SignInWithEmailImpl> get copyWith =>
      __$$SignInWithEmailImplCopyWithImpl<_$SignInWithEmailImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signInWithEmail,
    required TResult Function(String email, String password) signUpWithEmail,
    required TResult Function() signOut,
    required TResult Function(String email) resetPassword,
    required TResult Function() signInWithGoogle,
    required TResult Function() checkAuthStatus,
    required TResult Function(UserEntity? user) authStateChanged,
  }) {
    return signInWithEmail(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? signInWithEmail,
    TResult? Function(String email, String password)? signUpWithEmail,
    TResult? Function()? signOut,
    TResult? Function(String email)? resetPassword,
    TResult? Function()? signInWithGoogle,
    TResult? Function()? checkAuthStatus,
    TResult? Function(UserEntity? user)? authStateChanged,
  }) {
    return signInWithEmail?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmail,
    TResult Function(String email, String password)? signUpWithEmail,
    TResult Function()? signOut,
    TResult Function(String email)? resetPassword,
    TResult Function()? signInWithGoogle,
    TResult Function()? checkAuthStatus,
    TResult Function(UserEntity? user)? authStateChanged,
    required TResult orElse(),
  }) {
    if (signInWithEmail != null) {
      return signInWithEmail(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInWithEmail value) signInWithEmail,
    required TResult Function(_SignUpWithEmail value) signUpWithEmail,
    required TResult Function(_SignOut value) signOut,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
    required TResult Function(_CheckAuthStatus value) checkAuthStatus,
    required TResult Function(_AuthStateChanged value) authStateChanged,
  }) {
    return signInWithEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithEmail value)? signInWithEmail,
    TResult? Function(_SignUpWithEmail value)? signUpWithEmail,
    TResult? Function(_SignOut value)? signOut,
    TResult? Function(_ResetPassword value)? resetPassword,
    TResult? Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult? Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(_AuthStateChanged value)? authStateChanged,
  }) {
    return signInWithEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithEmail value)? signInWithEmail,
    TResult Function(_SignUpWithEmail value)? signUpWithEmail,
    TResult Function(_SignOut value)? signOut,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult Function(_AuthStateChanged value)? authStateChanged,
    required TResult orElse(),
  }) {
    if (signInWithEmail != null) {
      return signInWithEmail(this);
    }
    return orElse();
  }
}

abstract class _SignInWithEmail implements AuthEvent {
  const factory _SignInWithEmail({
    required final String email,
    required final String password,
  }) = _$SignInWithEmailImpl;

  String get email;
  String get password;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignInWithEmailImplCopyWith<_$SignInWithEmailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignUpWithEmailImplCopyWith<$Res> {
  factory _$$SignUpWithEmailImplCopyWith(
    _$SignUpWithEmailImpl value,
    $Res Function(_$SignUpWithEmailImpl) then,
  ) = __$$SignUpWithEmailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$SignUpWithEmailImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignUpWithEmailImpl>
    implements _$$SignUpWithEmailImplCopyWith<$Res> {
  __$$SignUpWithEmailImplCopyWithImpl(
    _$SignUpWithEmailImpl _value,
    $Res Function(_$SignUpWithEmailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null, Object? password = null}) {
    return _then(
      _$SignUpWithEmailImpl(
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        password: null == password
            ? _value.password
            : password // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SignUpWithEmailImpl implements _SignUpWithEmail {
  const _$SignUpWithEmailImpl({required this.email, required this.password});

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'AuthEvent.signUpWithEmail(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignUpWithEmailImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SignUpWithEmailImplCopyWith<_$SignUpWithEmailImpl> get copyWith =>
      __$$SignUpWithEmailImplCopyWithImpl<_$SignUpWithEmailImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signInWithEmail,
    required TResult Function(String email, String password) signUpWithEmail,
    required TResult Function() signOut,
    required TResult Function(String email) resetPassword,
    required TResult Function() signInWithGoogle,
    required TResult Function() checkAuthStatus,
    required TResult Function(UserEntity? user) authStateChanged,
  }) {
    return signUpWithEmail(email, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? signInWithEmail,
    TResult? Function(String email, String password)? signUpWithEmail,
    TResult? Function()? signOut,
    TResult? Function(String email)? resetPassword,
    TResult? Function()? signInWithGoogle,
    TResult? Function()? checkAuthStatus,
    TResult? Function(UserEntity? user)? authStateChanged,
  }) {
    return signUpWithEmail?.call(email, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmail,
    TResult Function(String email, String password)? signUpWithEmail,
    TResult Function()? signOut,
    TResult Function(String email)? resetPassword,
    TResult Function()? signInWithGoogle,
    TResult Function()? checkAuthStatus,
    TResult Function(UserEntity? user)? authStateChanged,
    required TResult orElse(),
  }) {
    if (signUpWithEmail != null) {
      return signUpWithEmail(email, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInWithEmail value) signInWithEmail,
    required TResult Function(_SignUpWithEmail value) signUpWithEmail,
    required TResult Function(_SignOut value) signOut,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
    required TResult Function(_CheckAuthStatus value) checkAuthStatus,
    required TResult Function(_AuthStateChanged value) authStateChanged,
  }) {
    return signUpWithEmail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithEmail value)? signInWithEmail,
    TResult? Function(_SignUpWithEmail value)? signUpWithEmail,
    TResult? Function(_SignOut value)? signOut,
    TResult? Function(_ResetPassword value)? resetPassword,
    TResult? Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult? Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(_AuthStateChanged value)? authStateChanged,
  }) {
    return signUpWithEmail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithEmail value)? signInWithEmail,
    TResult Function(_SignUpWithEmail value)? signUpWithEmail,
    TResult Function(_SignOut value)? signOut,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult Function(_AuthStateChanged value)? authStateChanged,
    required TResult orElse(),
  }) {
    if (signUpWithEmail != null) {
      return signUpWithEmail(this);
    }
    return orElse();
  }
}

abstract class _SignUpWithEmail implements AuthEvent {
  const factory _SignUpWithEmail({
    required final String email,
    required final String password,
  }) = _$SignUpWithEmailImpl;

  String get email;
  String get password;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SignUpWithEmailImplCopyWith<_$SignUpWithEmailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignOutImplCopyWith<$Res> {
  factory _$$SignOutImplCopyWith(
    _$SignOutImpl value,
    $Res Function(_$SignOutImpl) then,
  ) = __$$SignOutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignOutImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignOutImpl>
    implements _$$SignOutImplCopyWith<$Res> {
  __$$SignOutImplCopyWithImpl(
    _$SignOutImpl _value,
    $Res Function(_$SignOutImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignOutImpl implements _SignOut {
  const _$SignOutImpl();

  @override
  String toString() {
    return 'AuthEvent.signOut()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignOutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signInWithEmail,
    required TResult Function(String email, String password) signUpWithEmail,
    required TResult Function() signOut,
    required TResult Function(String email) resetPassword,
    required TResult Function() signInWithGoogle,
    required TResult Function() checkAuthStatus,
    required TResult Function(UserEntity? user) authStateChanged,
  }) {
    return signOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? signInWithEmail,
    TResult? Function(String email, String password)? signUpWithEmail,
    TResult? Function()? signOut,
    TResult? Function(String email)? resetPassword,
    TResult? Function()? signInWithGoogle,
    TResult? Function()? checkAuthStatus,
    TResult? Function(UserEntity? user)? authStateChanged,
  }) {
    return signOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmail,
    TResult Function(String email, String password)? signUpWithEmail,
    TResult Function()? signOut,
    TResult Function(String email)? resetPassword,
    TResult Function()? signInWithGoogle,
    TResult Function()? checkAuthStatus,
    TResult Function(UserEntity? user)? authStateChanged,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInWithEmail value) signInWithEmail,
    required TResult Function(_SignUpWithEmail value) signUpWithEmail,
    required TResult Function(_SignOut value) signOut,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
    required TResult Function(_CheckAuthStatus value) checkAuthStatus,
    required TResult Function(_AuthStateChanged value) authStateChanged,
  }) {
    return signOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithEmail value)? signInWithEmail,
    TResult? Function(_SignUpWithEmail value)? signUpWithEmail,
    TResult? Function(_SignOut value)? signOut,
    TResult? Function(_ResetPassword value)? resetPassword,
    TResult? Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult? Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(_AuthStateChanged value)? authStateChanged,
  }) {
    return signOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithEmail value)? signInWithEmail,
    TResult Function(_SignUpWithEmail value)? signUpWithEmail,
    TResult Function(_SignOut value)? signOut,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult Function(_AuthStateChanged value)? authStateChanged,
    required TResult orElse(),
  }) {
    if (signOut != null) {
      return signOut(this);
    }
    return orElse();
  }
}

abstract class _SignOut implements AuthEvent {
  const factory _SignOut() = _$SignOutImpl;
}

/// @nodoc
abstract class _$$ResetPasswordImplCopyWith<$Res> {
  factory _$$ResetPasswordImplCopyWith(
    _$ResetPasswordImpl value,
    $Res Function(_$ResetPasswordImpl) then,
  ) = __$$ResetPasswordImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$ResetPasswordImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$ResetPasswordImpl>
    implements _$$ResetPasswordImplCopyWith<$Res> {
  __$$ResetPasswordImplCopyWithImpl(
    _$ResetPasswordImpl _value,
    $Res Function(_$ResetPasswordImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? email = null}) {
    return _then(
      _$ResetPasswordImpl(
        null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ResetPasswordImpl implements _ResetPassword {
  const _$ResetPasswordImpl(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'AuthEvent.resetPassword(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordImplCopyWith<_$ResetPasswordImpl> get copyWith =>
      __$$ResetPasswordImplCopyWithImpl<_$ResetPasswordImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signInWithEmail,
    required TResult Function(String email, String password) signUpWithEmail,
    required TResult Function() signOut,
    required TResult Function(String email) resetPassword,
    required TResult Function() signInWithGoogle,
    required TResult Function() checkAuthStatus,
    required TResult Function(UserEntity? user) authStateChanged,
  }) {
    return resetPassword(email);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? signInWithEmail,
    TResult? Function(String email, String password)? signUpWithEmail,
    TResult? Function()? signOut,
    TResult? Function(String email)? resetPassword,
    TResult? Function()? signInWithGoogle,
    TResult? Function()? checkAuthStatus,
    TResult? Function(UserEntity? user)? authStateChanged,
  }) {
    return resetPassword?.call(email);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmail,
    TResult Function(String email, String password)? signUpWithEmail,
    TResult Function()? signOut,
    TResult Function(String email)? resetPassword,
    TResult Function()? signInWithGoogle,
    TResult Function()? checkAuthStatus,
    TResult Function(UserEntity? user)? authStateChanged,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword(email);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInWithEmail value) signInWithEmail,
    required TResult Function(_SignUpWithEmail value) signUpWithEmail,
    required TResult Function(_SignOut value) signOut,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
    required TResult Function(_CheckAuthStatus value) checkAuthStatus,
    required TResult Function(_AuthStateChanged value) authStateChanged,
  }) {
    return resetPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithEmail value)? signInWithEmail,
    TResult? Function(_SignUpWithEmail value)? signUpWithEmail,
    TResult? Function(_SignOut value)? signOut,
    TResult? Function(_ResetPassword value)? resetPassword,
    TResult? Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult? Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(_AuthStateChanged value)? authStateChanged,
  }) {
    return resetPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithEmail value)? signInWithEmail,
    TResult Function(_SignUpWithEmail value)? signUpWithEmail,
    TResult Function(_SignOut value)? signOut,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult Function(_AuthStateChanged value)? authStateChanged,
    required TResult orElse(),
  }) {
    if (resetPassword != null) {
      return resetPassword(this);
    }
    return orElse();
  }
}

abstract class _ResetPassword implements AuthEvent {
  const factory _ResetPassword(final String email) = _$ResetPasswordImpl;

  String get email;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResetPasswordImplCopyWith<_$ResetPasswordImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SignInWithGoogleImplCopyWith<$Res> {
  factory _$$SignInWithGoogleImplCopyWith(
    _$SignInWithGoogleImpl value,
    $Res Function(_$SignInWithGoogleImpl) then,
  ) = __$$SignInWithGoogleImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SignInWithGoogleImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$SignInWithGoogleImpl>
    implements _$$SignInWithGoogleImplCopyWith<$Res> {
  __$$SignInWithGoogleImplCopyWithImpl(
    _$SignInWithGoogleImpl _value,
    $Res Function(_$SignInWithGoogleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SignInWithGoogleImpl implements _SignInWithGoogle {
  const _$SignInWithGoogleImpl();

  @override
  String toString() {
    return 'AuthEvent.signInWithGoogle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SignInWithGoogleImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signInWithEmail,
    required TResult Function(String email, String password) signUpWithEmail,
    required TResult Function() signOut,
    required TResult Function(String email) resetPassword,
    required TResult Function() signInWithGoogle,
    required TResult Function() checkAuthStatus,
    required TResult Function(UserEntity? user) authStateChanged,
  }) {
    return signInWithGoogle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? signInWithEmail,
    TResult? Function(String email, String password)? signUpWithEmail,
    TResult? Function()? signOut,
    TResult? Function(String email)? resetPassword,
    TResult? Function()? signInWithGoogle,
    TResult? Function()? checkAuthStatus,
    TResult? Function(UserEntity? user)? authStateChanged,
  }) {
    return signInWithGoogle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmail,
    TResult Function(String email, String password)? signUpWithEmail,
    TResult Function()? signOut,
    TResult Function(String email)? resetPassword,
    TResult Function()? signInWithGoogle,
    TResult Function()? checkAuthStatus,
    TResult Function(UserEntity? user)? authStateChanged,
    required TResult orElse(),
  }) {
    if (signInWithGoogle != null) {
      return signInWithGoogle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInWithEmail value) signInWithEmail,
    required TResult Function(_SignUpWithEmail value) signUpWithEmail,
    required TResult Function(_SignOut value) signOut,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
    required TResult Function(_CheckAuthStatus value) checkAuthStatus,
    required TResult Function(_AuthStateChanged value) authStateChanged,
  }) {
    return signInWithGoogle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithEmail value)? signInWithEmail,
    TResult? Function(_SignUpWithEmail value)? signUpWithEmail,
    TResult? Function(_SignOut value)? signOut,
    TResult? Function(_ResetPassword value)? resetPassword,
    TResult? Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult? Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(_AuthStateChanged value)? authStateChanged,
  }) {
    return signInWithGoogle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithEmail value)? signInWithEmail,
    TResult Function(_SignUpWithEmail value)? signUpWithEmail,
    TResult Function(_SignOut value)? signOut,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult Function(_AuthStateChanged value)? authStateChanged,
    required TResult orElse(),
  }) {
    if (signInWithGoogle != null) {
      return signInWithGoogle(this);
    }
    return orElse();
  }
}

abstract class _SignInWithGoogle implements AuthEvent {
  const factory _SignInWithGoogle() = _$SignInWithGoogleImpl;
}

/// @nodoc
abstract class _$$CheckAuthStatusImplCopyWith<$Res> {
  factory _$$CheckAuthStatusImplCopyWith(
    _$CheckAuthStatusImpl value,
    $Res Function(_$CheckAuthStatusImpl) then,
  ) = __$$CheckAuthStatusImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CheckAuthStatusImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$CheckAuthStatusImpl>
    implements _$$CheckAuthStatusImplCopyWith<$Res> {
  __$$CheckAuthStatusImplCopyWithImpl(
    _$CheckAuthStatusImpl _value,
    $Res Function(_$CheckAuthStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CheckAuthStatusImpl implements _CheckAuthStatus {
  const _$CheckAuthStatusImpl();

  @override
  String toString() {
    return 'AuthEvent.checkAuthStatus()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CheckAuthStatusImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signInWithEmail,
    required TResult Function(String email, String password) signUpWithEmail,
    required TResult Function() signOut,
    required TResult Function(String email) resetPassword,
    required TResult Function() signInWithGoogle,
    required TResult Function() checkAuthStatus,
    required TResult Function(UserEntity? user) authStateChanged,
  }) {
    return checkAuthStatus();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? signInWithEmail,
    TResult? Function(String email, String password)? signUpWithEmail,
    TResult? Function()? signOut,
    TResult? Function(String email)? resetPassword,
    TResult? Function()? signInWithGoogle,
    TResult? Function()? checkAuthStatus,
    TResult? Function(UserEntity? user)? authStateChanged,
  }) {
    return checkAuthStatus?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmail,
    TResult Function(String email, String password)? signUpWithEmail,
    TResult Function()? signOut,
    TResult Function(String email)? resetPassword,
    TResult Function()? signInWithGoogle,
    TResult Function()? checkAuthStatus,
    TResult Function(UserEntity? user)? authStateChanged,
    required TResult orElse(),
  }) {
    if (checkAuthStatus != null) {
      return checkAuthStatus();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInWithEmail value) signInWithEmail,
    required TResult Function(_SignUpWithEmail value) signUpWithEmail,
    required TResult Function(_SignOut value) signOut,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
    required TResult Function(_CheckAuthStatus value) checkAuthStatus,
    required TResult Function(_AuthStateChanged value) authStateChanged,
  }) {
    return checkAuthStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithEmail value)? signInWithEmail,
    TResult? Function(_SignUpWithEmail value)? signUpWithEmail,
    TResult? Function(_SignOut value)? signOut,
    TResult? Function(_ResetPassword value)? resetPassword,
    TResult? Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult? Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(_AuthStateChanged value)? authStateChanged,
  }) {
    return checkAuthStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithEmail value)? signInWithEmail,
    TResult Function(_SignUpWithEmail value)? signUpWithEmail,
    TResult Function(_SignOut value)? signOut,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult Function(_AuthStateChanged value)? authStateChanged,
    required TResult orElse(),
  }) {
    if (checkAuthStatus != null) {
      return checkAuthStatus(this);
    }
    return orElse();
  }
}

abstract class _CheckAuthStatus implements AuthEvent {
  const factory _CheckAuthStatus() = _$CheckAuthStatusImpl;
}

/// @nodoc
abstract class _$$AuthStateChangedImplCopyWith<$Res> {
  factory _$$AuthStateChangedImplCopyWith(
    _$AuthStateChangedImpl value,
    $Res Function(_$AuthStateChangedImpl) then,
  ) = __$$AuthStateChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserEntity? user});
}

/// @nodoc
class __$$AuthStateChangedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$AuthStateChangedImpl>
    implements _$$AuthStateChangedImplCopyWith<$Res> {
  __$$AuthStateChangedImplCopyWithImpl(
    _$AuthStateChangedImpl _value,
    $Res Function(_$AuthStateChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? user = freezed}) {
    return _then(
      _$AuthStateChangedImpl(
        freezed == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as UserEntity?,
      ),
    );
  }
}

/// @nodoc

class _$AuthStateChangedImpl implements _AuthStateChanged {
  const _$AuthStateChangedImpl(this.user);

  @override
  final UserEntity? user;

  @override
  String toString() {
    return 'AuthEvent.authStateChanged(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthStateChangedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthStateChangedImplCopyWith<_$AuthStateChangedImpl> get copyWith =>
      __$$AuthStateChangedImplCopyWithImpl<_$AuthStateChangedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String email, String password) signInWithEmail,
    required TResult Function(String email, String password) signUpWithEmail,
    required TResult Function() signOut,
    required TResult Function(String email) resetPassword,
    required TResult Function() signInWithGoogle,
    required TResult Function() checkAuthStatus,
    required TResult Function(UserEntity? user) authStateChanged,
  }) {
    return authStateChanged(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String email, String password)? signInWithEmail,
    TResult? Function(String email, String password)? signUpWithEmail,
    TResult? Function()? signOut,
    TResult? Function(String email)? resetPassword,
    TResult? Function()? signInWithGoogle,
    TResult? Function()? checkAuthStatus,
    TResult? Function(UserEntity? user)? authStateChanged,
  }) {
    return authStateChanged?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String email, String password)? signInWithEmail,
    TResult Function(String email, String password)? signUpWithEmail,
    TResult Function()? signOut,
    TResult Function(String email)? resetPassword,
    TResult Function()? signInWithGoogle,
    TResult Function()? checkAuthStatus,
    TResult Function(UserEntity? user)? authStateChanged,
    required TResult orElse(),
  }) {
    if (authStateChanged != null) {
      return authStateChanged(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignInWithEmail value) signInWithEmail,
    required TResult Function(_SignUpWithEmail value) signUpWithEmail,
    required TResult Function(_SignOut value) signOut,
    required TResult Function(_ResetPassword value) resetPassword,
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
    required TResult Function(_CheckAuthStatus value) checkAuthStatus,
    required TResult Function(_AuthStateChanged value) authStateChanged,
  }) {
    return authStateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignInWithEmail value)? signInWithEmail,
    TResult? Function(_SignUpWithEmail value)? signUpWithEmail,
    TResult? Function(_SignOut value)? signOut,
    TResult? Function(_ResetPassword value)? resetPassword,
    TResult? Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult? Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult? Function(_AuthStateChanged value)? authStateChanged,
  }) {
    return authStateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignInWithEmail value)? signInWithEmail,
    TResult Function(_SignUpWithEmail value)? signUpWithEmail,
    TResult Function(_SignOut value)? signOut,
    TResult Function(_ResetPassword value)? resetPassword,
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_CheckAuthStatus value)? checkAuthStatus,
    TResult Function(_AuthStateChanged value)? authStateChanged,
    required TResult orElse(),
  }) {
    if (authStateChanged != null) {
      return authStateChanged(this);
    }
    return orElse();
  }
}

abstract class _AuthStateChanged implements AuthEvent {
  const factory _AuthStateChanged(final UserEntity? user) =
      _$AuthStateChangedImpl;

  UserEntity? get user;

  /// Create a copy of AuthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthStateChangedImplCopyWith<_$AuthStateChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
