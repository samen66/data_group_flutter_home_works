// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$NotificationsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeFCM,
    required TResult Function(String token, String userId, String platform)
    saveToken,
    required TResult Function(String token, String userId, String platform)
    updateToken,
    required TResult Function(String userId) loadSettings,
    required TResult Function(String userId, bool enabled) updateSettings,
    required TResult Function(Map<String, dynamic> payload) handleNotification,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeFCM,
    TResult? Function(String token, String userId, String platform)? saveToken,
    TResult? Function(String token, String userId, String platform)?
    updateToken,
    TResult? Function(String userId)? loadSettings,
    TResult? Function(String userId, bool enabled)? updateSettings,
    TResult? Function(Map<String, dynamic> payload)? handleNotification,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeFCM,
    TResult Function(String token, String userId, String platform)? saveToken,
    TResult Function(String token, String userId, String platform)? updateToken,
    TResult Function(String userId)? loadSettings,
    TResult Function(String userId, bool enabled)? updateSettings,
    TResult Function(Map<String, dynamic> payload)? handleNotification,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeFCM value) initializeFCM,
    required TResult Function(_SaveToken value) saveToken,
    required TResult Function(_UpdateToken value) updateToken,
    required TResult Function(_LoadSettings value) loadSettings,
    required TResult Function(_UpdateSettings value) updateSettings,
    required TResult Function(_HandleNotification value) handleNotification,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitializeFCM value)? initializeFCM,
    TResult? Function(_SaveToken value)? saveToken,
    TResult? Function(_UpdateToken value)? updateToken,
    TResult? Function(_LoadSettings value)? loadSettings,
    TResult? Function(_UpdateSettings value)? updateSettings,
    TResult? Function(_HandleNotification value)? handleNotification,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeFCM value)? initializeFCM,
    TResult Function(_SaveToken value)? saveToken,
    TResult Function(_UpdateToken value)? updateToken,
    TResult Function(_LoadSettings value)? loadSettings,
    TResult Function(_UpdateSettings value)? updateSettings,
    TResult Function(_HandleNotification value)? handleNotification,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationsEventCopyWith<$Res> {
  factory $NotificationsEventCopyWith(
    NotificationsEvent value,
    $Res Function(NotificationsEvent) then,
  ) = _$NotificationsEventCopyWithImpl<$Res, NotificationsEvent>;
}

/// @nodoc
class _$NotificationsEventCopyWithImpl<$Res, $Val extends NotificationsEvent>
    implements $NotificationsEventCopyWith<$Res> {
  _$NotificationsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitializeFCMImplCopyWith<$Res> {
  factory _$$InitializeFCMImplCopyWith(
    _$InitializeFCMImpl value,
    $Res Function(_$InitializeFCMImpl) then,
  ) = __$$InitializeFCMImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializeFCMImplCopyWithImpl<$Res>
    extends _$NotificationsEventCopyWithImpl<$Res, _$InitializeFCMImpl>
    implements _$$InitializeFCMImplCopyWith<$Res> {
  __$$InitializeFCMImplCopyWithImpl(
    _$InitializeFCMImpl _value,
    $Res Function(_$InitializeFCMImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitializeFCMImpl implements _InitializeFCM {
  const _$InitializeFCMImpl();

  @override
  String toString() {
    return 'NotificationsEvent.initializeFCM()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitializeFCMImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeFCM,
    required TResult Function(String token, String userId, String platform)
    saveToken,
    required TResult Function(String token, String userId, String platform)
    updateToken,
    required TResult Function(String userId) loadSettings,
    required TResult Function(String userId, bool enabled) updateSettings,
    required TResult Function(Map<String, dynamic> payload) handleNotification,
  }) {
    return initializeFCM();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeFCM,
    TResult? Function(String token, String userId, String platform)? saveToken,
    TResult? Function(String token, String userId, String platform)?
    updateToken,
    TResult? Function(String userId)? loadSettings,
    TResult? Function(String userId, bool enabled)? updateSettings,
    TResult? Function(Map<String, dynamic> payload)? handleNotification,
  }) {
    return initializeFCM?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeFCM,
    TResult Function(String token, String userId, String platform)? saveToken,
    TResult Function(String token, String userId, String platform)? updateToken,
    TResult Function(String userId)? loadSettings,
    TResult Function(String userId, bool enabled)? updateSettings,
    TResult Function(Map<String, dynamic> payload)? handleNotification,
    required TResult orElse(),
  }) {
    if (initializeFCM != null) {
      return initializeFCM();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeFCM value) initializeFCM,
    required TResult Function(_SaveToken value) saveToken,
    required TResult Function(_UpdateToken value) updateToken,
    required TResult Function(_LoadSettings value) loadSettings,
    required TResult Function(_UpdateSettings value) updateSettings,
    required TResult Function(_HandleNotification value) handleNotification,
  }) {
    return initializeFCM(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitializeFCM value)? initializeFCM,
    TResult? Function(_SaveToken value)? saveToken,
    TResult? Function(_UpdateToken value)? updateToken,
    TResult? Function(_LoadSettings value)? loadSettings,
    TResult? Function(_UpdateSettings value)? updateSettings,
    TResult? Function(_HandleNotification value)? handleNotification,
  }) {
    return initializeFCM?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeFCM value)? initializeFCM,
    TResult Function(_SaveToken value)? saveToken,
    TResult Function(_UpdateToken value)? updateToken,
    TResult Function(_LoadSettings value)? loadSettings,
    TResult Function(_UpdateSettings value)? updateSettings,
    TResult Function(_HandleNotification value)? handleNotification,
    required TResult orElse(),
  }) {
    if (initializeFCM != null) {
      return initializeFCM(this);
    }
    return orElse();
  }
}

abstract class _InitializeFCM implements NotificationsEvent {
  const factory _InitializeFCM() = _$InitializeFCMImpl;
}

/// @nodoc
abstract class _$$SaveTokenImplCopyWith<$Res> {
  factory _$$SaveTokenImplCopyWith(
    _$SaveTokenImpl value,
    $Res Function(_$SaveTokenImpl) then,
  ) = __$$SaveTokenImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String token, String userId, String platform});
}

/// @nodoc
class __$$SaveTokenImplCopyWithImpl<$Res>
    extends _$NotificationsEventCopyWithImpl<$Res, _$SaveTokenImpl>
    implements _$$SaveTokenImplCopyWith<$Res> {
  __$$SaveTokenImplCopyWithImpl(
    _$SaveTokenImpl _value,
    $Res Function(_$SaveTokenImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? userId = null,
    Object? platform = null,
  }) {
    return _then(
      _$SaveTokenImpl(
        token: null == token
            ? _value.token
            : token // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        platform: null == platform
            ? _value.platform
            : platform // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SaveTokenImpl implements _SaveToken {
  const _$SaveTokenImpl({
    required this.token,
    required this.userId,
    required this.platform,
  });

  @override
  final String token;
  @override
  final String userId;
  @override
  final String platform;

  @override
  String toString() {
    return 'NotificationsEvent.saveToken(token: $token, userId: $userId, platform: $platform)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveTokenImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.platform, platform) ||
                other.platform == platform));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token, userId, platform);

  /// Create a copy of NotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveTokenImplCopyWith<_$SaveTokenImpl> get copyWith =>
      __$$SaveTokenImplCopyWithImpl<_$SaveTokenImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeFCM,
    required TResult Function(String token, String userId, String platform)
    saveToken,
    required TResult Function(String token, String userId, String platform)
    updateToken,
    required TResult Function(String userId) loadSettings,
    required TResult Function(String userId, bool enabled) updateSettings,
    required TResult Function(Map<String, dynamic> payload) handleNotification,
  }) {
    return saveToken(token, userId, platform);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeFCM,
    TResult? Function(String token, String userId, String platform)? saveToken,
    TResult? Function(String token, String userId, String platform)?
    updateToken,
    TResult? Function(String userId)? loadSettings,
    TResult? Function(String userId, bool enabled)? updateSettings,
    TResult? Function(Map<String, dynamic> payload)? handleNotification,
  }) {
    return saveToken?.call(token, userId, platform);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeFCM,
    TResult Function(String token, String userId, String platform)? saveToken,
    TResult Function(String token, String userId, String platform)? updateToken,
    TResult Function(String userId)? loadSettings,
    TResult Function(String userId, bool enabled)? updateSettings,
    TResult Function(Map<String, dynamic> payload)? handleNotification,
    required TResult orElse(),
  }) {
    if (saveToken != null) {
      return saveToken(token, userId, platform);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeFCM value) initializeFCM,
    required TResult Function(_SaveToken value) saveToken,
    required TResult Function(_UpdateToken value) updateToken,
    required TResult Function(_LoadSettings value) loadSettings,
    required TResult Function(_UpdateSettings value) updateSettings,
    required TResult Function(_HandleNotification value) handleNotification,
  }) {
    return saveToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitializeFCM value)? initializeFCM,
    TResult? Function(_SaveToken value)? saveToken,
    TResult? Function(_UpdateToken value)? updateToken,
    TResult? Function(_LoadSettings value)? loadSettings,
    TResult? Function(_UpdateSettings value)? updateSettings,
    TResult? Function(_HandleNotification value)? handleNotification,
  }) {
    return saveToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeFCM value)? initializeFCM,
    TResult Function(_SaveToken value)? saveToken,
    TResult Function(_UpdateToken value)? updateToken,
    TResult Function(_LoadSettings value)? loadSettings,
    TResult Function(_UpdateSettings value)? updateSettings,
    TResult Function(_HandleNotification value)? handleNotification,
    required TResult orElse(),
  }) {
    if (saveToken != null) {
      return saveToken(this);
    }
    return orElse();
  }
}

abstract class _SaveToken implements NotificationsEvent {
  const factory _SaveToken({
    required final String token,
    required final String userId,
    required final String platform,
  }) = _$SaveTokenImpl;

  String get token;
  String get userId;
  String get platform;

  /// Create a copy of NotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaveTokenImplCopyWith<_$SaveTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateTokenImplCopyWith<$Res> {
  factory _$$UpdateTokenImplCopyWith(
    _$UpdateTokenImpl value,
    $Res Function(_$UpdateTokenImpl) then,
  ) = __$$UpdateTokenImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String token, String userId, String platform});
}

/// @nodoc
class __$$UpdateTokenImplCopyWithImpl<$Res>
    extends _$NotificationsEventCopyWithImpl<$Res, _$UpdateTokenImpl>
    implements _$$UpdateTokenImplCopyWith<$Res> {
  __$$UpdateTokenImplCopyWithImpl(
    _$UpdateTokenImpl _value,
    $Res Function(_$UpdateTokenImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
    Object? userId = null,
    Object? platform = null,
  }) {
    return _then(
      _$UpdateTokenImpl(
        token: null == token
            ? _value.token
            : token // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        platform: null == platform
            ? _value.platform
            : platform // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$UpdateTokenImpl implements _UpdateToken {
  const _$UpdateTokenImpl({
    required this.token,
    required this.userId,
    required this.platform,
  });

  @override
  final String token;
  @override
  final String userId;
  @override
  final String platform;

  @override
  String toString() {
    return 'NotificationsEvent.updateToken(token: $token, userId: $userId, platform: $platform)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateTokenImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.platform, platform) ||
                other.platform == platform));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token, userId, platform);

  /// Create a copy of NotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateTokenImplCopyWith<_$UpdateTokenImpl> get copyWith =>
      __$$UpdateTokenImplCopyWithImpl<_$UpdateTokenImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeFCM,
    required TResult Function(String token, String userId, String platform)
    saveToken,
    required TResult Function(String token, String userId, String platform)
    updateToken,
    required TResult Function(String userId) loadSettings,
    required TResult Function(String userId, bool enabled) updateSettings,
    required TResult Function(Map<String, dynamic> payload) handleNotification,
  }) {
    return updateToken(token, userId, platform);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeFCM,
    TResult? Function(String token, String userId, String platform)? saveToken,
    TResult? Function(String token, String userId, String platform)?
    updateToken,
    TResult? Function(String userId)? loadSettings,
    TResult? Function(String userId, bool enabled)? updateSettings,
    TResult? Function(Map<String, dynamic> payload)? handleNotification,
  }) {
    return updateToken?.call(token, userId, platform);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeFCM,
    TResult Function(String token, String userId, String platform)? saveToken,
    TResult Function(String token, String userId, String platform)? updateToken,
    TResult Function(String userId)? loadSettings,
    TResult Function(String userId, bool enabled)? updateSettings,
    TResult Function(Map<String, dynamic> payload)? handleNotification,
    required TResult orElse(),
  }) {
    if (updateToken != null) {
      return updateToken(token, userId, platform);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeFCM value) initializeFCM,
    required TResult Function(_SaveToken value) saveToken,
    required TResult Function(_UpdateToken value) updateToken,
    required TResult Function(_LoadSettings value) loadSettings,
    required TResult Function(_UpdateSettings value) updateSettings,
    required TResult Function(_HandleNotification value) handleNotification,
  }) {
    return updateToken(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitializeFCM value)? initializeFCM,
    TResult? Function(_SaveToken value)? saveToken,
    TResult? Function(_UpdateToken value)? updateToken,
    TResult? Function(_LoadSettings value)? loadSettings,
    TResult? Function(_UpdateSettings value)? updateSettings,
    TResult? Function(_HandleNotification value)? handleNotification,
  }) {
    return updateToken?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeFCM value)? initializeFCM,
    TResult Function(_SaveToken value)? saveToken,
    TResult Function(_UpdateToken value)? updateToken,
    TResult Function(_LoadSettings value)? loadSettings,
    TResult Function(_UpdateSettings value)? updateSettings,
    TResult Function(_HandleNotification value)? handleNotification,
    required TResult orElse(),
  }) {
    if (updateToken != null) {
      return updateToken(this);
    }
    return orElse();
  }
}

abstract class _UpdateToken implements NotificationsEvent {
  const factory _UpdateToken({
    required final String token,
    required final String userId,
    required final String platform,
  }) = _$UpdateTokenImpl;

  String get token;
  String get userId;
  String get platform;

  /// Create a copy of NotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateTokenImplCopyWith<_$UpdateTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadSettingsImplCopyWith<$Res> {
  factory _$$LoadSettingsImplCopyWith(
    _$LoadSettingsImpl value,
    $Res Function(_$LoadSettingsImpl) then,
  ) = __$$LoadSettingsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$LoadSettingsImplCopyWithImpl<$Res>
    extends _$NotificationsEventCopyWithImpl<$Res, _$LoadSettingsImpl>
    implements _$$LoadSettingsImplCopyWith<$Res> {
  __$$LoadSettingsImplCopyWithImpl(
    _$LoadSettingsImpl _value,
    $Res Function(_$LoadSettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null}) {
    return _then(
      _$LoadSettingsImpl(
        null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$LoadSettingsImpl implements _LoadSettings {
  const _$LoadSettingsImpl(this.userId);

  @override
  final String userId;

  @override
  String toString() {
    return 'NotificationsEvent.loadSettings(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadSettingsImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  /// Create a copy of NotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadSettingsImplCopyWith<_$LoadSettingsImpl> get copyWith =>
      __$$LoadSettingsImplCopyWithImpl<_$LoadSettingsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeFCM,
    required TResult Function(String token, String userId, String platform)
    saveToken,
    required TResult Function(String token, String userId, String platform)
    updateToken,
    required TResult Function(String userId) loadSettings,
    required TResult Function(String userId, bool enabled) updateSettings,
    required TResult Function(Map<String, dynamic> payload) handleNotification,
  }) {
    return loadSettings(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeFCM,
    TResult? Function(String token, String userId, String platform)? saveToken,
    TResult? Function(String token, String userId, String platform)?
    updateToken,
    TResult? Function(String userId)? loadSettings,
    TResult? Function(String userId, bool enabled)? updateSettings,
    TResult? Function(Map<String, dynamic> payload)? handleNotification,
  }) {
    return loadSettings?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeFCM,
    TResult Function(String token, String userId, String platform)? saveToken,
    TResult Function(String token, String userId, String platform)? updateToken,
    TResult Function(String userId)? loadSettings,
    TResult Function(String userId, bool enabled)? updateSettings,
    TResult Function(Map<String, dynamic> payload)? handleNotification,
    required TResult orElse(),
  }) {
    if (loadSettings != null) {
      return loadSettings(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeFCM value) initializeFCM,
    required TResult Function(_SaveToken value) saveToken,
    required TResult Function(_UpdateToken value) updateToken,
    required TResult Function(_LoadSettings value) loadSettings,
    required TResult Function(_UpdateSettings value) updateSettings,
    required TResult Function(_HandleNotification value) handleNotification,
  }) {
    return loadSettings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitializeFCM value)? initializeFCM,
    TResult? Function(_SaveToken value)? saveToken,
    TResult? Function(_UpdateToken value)? updateToken,
    TResult? Function(_LoadSettings value)? loadSettings,
    TResult? Function(_UpdateSettings value)? updateSettings,
    TResult? Function(_HandleNotification value)? handleNotification,
  }) {
    return loadSettings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeFCM value)? initializeFCM,
    TResult Function(_SaveToken value)? saveToken,
    TResult Function(_UpdateToken value)? updateToken,
    TResult Function(_LoadSettings value)? loadSettings,
    TResult Function(_UpdateSettings value)? updateSettings,
    TResult Function(_HandleNotification value)? handleNotification,
    required TResult orElse(),
  }) {
    if (loadSettings != null) {
      return loadSettings(this);
    }
    return orElse();
  }
}

abstract class _LoadSettings implements NotificationsEvent {
  const factory _LoadSettings(final String userId) = _$LoadSettingsImpl;

  String get userId;

  /// Create a copy of NotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadSettingsImplCopyWith<_$LoadSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateSettingsImplCopyWith<$Res> {
  factory _$$UpdateSettingsImplCopyWith(
    _$UpdateSettingsImpl value,
    $Res Function(_$UpdateSettingsImpl) then,
  ) = __$$UpdateSettingsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, bool enabled});
}

/// @nodoc
class __$$UpdateSettingsImplCopyWithImpl<$Res>
    extends _$NotificationsEventCopyWithImpl<$Res, _$UpdateSettingsImpl>
    implements _$$UpdateSettingsImplCopyWith<$Res> {
  __$$UpdateSettingsImplCopyWithImpl(
    _$UpdateSettingsImpl _value,
    $Res Function(_$UpdateSettingsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null, Object? enabled = null}) {
    return _then(
      _$UpdateSettingsImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        enabled: null == enabled
            ? _value.enabled
            : enabled // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$UpdateSettingsImpl implements _UpdateSettings {
  const _$UpdateSettingsImpl({required this.userId, required this.enabled});

  @override
  final String userId;
  @override
  final bool enabled;

  @override
  String toString() {
    return 'NotificationsEvent.updateSettings(userId: $userId, enabled: $enabled)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSettingsImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, enabled);

  /// Create a copy of NotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSettingsImplCopyWith<_$UpdateSettingsImpl> get copyWith =>
      __$$UpdateSettingsImplCopyWithImpl<_$UpdateSettingsImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeFCM,
    required TResult Function(String token, String userId, String platform)
    saveToken,
    required TResult Function(String token, String userId, String platform)
    updateToken,
    required TResult Function(String userId) loadSettings,
    required TResult Function(String userId, bool enabled) updateSettings,
    required TResult Function(Map<String, dynamic> payload) handleNotification,
  }) {
    return updateSettings(userId, enabled);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeFCM,
    TResult? Function(String token, String userId, String platform)? saveToken,
    TResult? Function(String token, String userId, String platform)?
    updateToken,
    TResult? Function(String userId)? loadSettings,
    TResult? Function(String userId, bool enabled)? updateSettings,
    TResult? Function(Map<String, dynamic> payload)? handleNotification,
  }) {
    return updateSettings?.call(userId, enabled);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeFCM,
    TResult Function(String token, String userId, String platform)? saveToken,
    TResult Function(String token, String userId, String platform)? updateToken,
    TResult Function(String userId)? loadSettings,
    TResult Function(String userId, bool enabled)? updateSettings,
    TResult Function(Map<String, dynamic> payload)? handleNotification,
    required TResult orElse(),
  }) {
    if (updateSettings != null) {
      return updateSettings(userId, enabled);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeFCM value) initializeFCM,
    required TResult Function(_SaveToken value) saveToken,
    required TResult Function(_UpdateToken value) updateToken,
    required TResult Function(_LoadSettings value) loadSettings,
    required TResult Function(_UpdateSettings value) updateSettings,
    required TResult Function(_HandleNotification value) handleNotification,
  }) {
    return updateSettings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitializeFCM value)? initializeFCM,
    TResult? Function(_SaveToken value)? saveToken,
    TResult? Function(_UpdateToken value)? updateToken,
    TResult? Function(_LoadSettings value)? loadSettings,
    TResult? Function(_UpdateSettings value)? updateSettings,
    TResult? Function(_HandleNotification value)? handleNotification,
  }) {
    return updateSettings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeFCM value)? initializeFCM,
    TResult Function(_SaveToken value)? saveToken,
    TResult Function(_UpdateToken value)? updateToken,
    TResult Function(_LoadSettings value)? loadSettings,
    TResult Function(_UpdateSettings value)? updateSettings,
    TResult Function(_HandleNotification value)? handleNotification,
    required TResult orElse(),
  }) {
    if (updateSettings != null) {
      return updateSettings(this);
    }
    return orElse();
  }
}

abstract class _UpdateSettings implements NotificationsEvent {
  const factory _UpdateSettings({
    required final String userId,
    required final bool enabled,
  }) = _$UpdateSettingsImpl;

  String get userId;
  bool get enabled;

  /// Create a copy of NotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateSettingsImplCopyWith<_$UpdateSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$HandleNotificationImplCopyWith<$Res> {
  factory _$$HandleNotificationImplCopyWith(
    _$HandleNotificationImpl value,
    $Res Function(_$HandleNotificationImpl) then,
  ) = __$$HandleNotificationImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> payload});
}

/// @nodoc
class __$$HandleNotificationImplCopyWithImpl<$Res>
    extends _$NotificationsEventCopyWithImpl<$Res, _$HandleNotificationImpl>
    implements _$$HandleNotificationImplCopyWith<$Res> {
  __$$HandleNotificationImplCopyWithImpl(
    _$HandleNotificationImpl _value,
    $Res Function(_$HandleNotificationImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? payload = null}) {
    return _then(
      _$HandleNotificationImpl(
        payload: null == payload
            ? _value._payload
            : payload // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc

class _$HandleNotificationImpl implements _HandleNotification {
  const _$HandleNotificationImpl({required final Map<String, dynamic> payload})
    : _payload = payload;

  final Map<String, dynamic> _payload;
  @override
  Map<String, dynamic> get payload {
    if (_payload is EqualUnmodifiableMapView) return _payload;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_payload);
  }

  @override
  String toString() {
    return 'NotificationsEvent.handleNotification(payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HandleNotificationImpl &&
            const DeepCollectionEquality().equals(other._payload, _payload));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_payload));

  /// Create a copy of NotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HandleNotificationImplCopyWith<_$HandleNotificationImpl> get copyWith =>
      __$$HandleNotificationImplCopyWithImpl<_$HandleNotificationImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeFCM,
    required TResult Function(String token, String userId, String platform)
    saveToken,
    required TResult Function(String token, String userId, String platform)
    updateToken,
    required TResult Function(String userId) loadSettings,
    required TResult Function(String userId, bool enabled) updateSettings,
    required TResult Function(Map<String, dynamic> payload) handleNotification,
  }) {
    return handleNotification(payload);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeFCM,
    TResult? Function(String token, String userId, String platform)? saveToken,
    TResult? Function(String token, String userId, String platform)?
    updateToken,
    TResult? Function(String userId)? loadSettings,
    TResult? Function(String userId, bool enabled)? updateSettings,
    TResult? Function(Map<String, dynamic> payload)? handleNotification,
  }) {
    return handleNotification?.call(payload);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeFCM,
    TResult Function(String token, String userId, String platform)? saveToken,
    TResult Function(String token, String userId, String platform)? updateToken,
    TResult Function(String userId)? loadSettings,
    TResult Function(String userId, bool enabled)? updateSettings,
    TResult Function(Map<String, dynamic> payload)? handleNotification,
    required TResult orElse(),
  }) {
    if (handleNotification != null) {
      return handleNotification(payload);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeFCM value) initializeFCM,
    required TResult Function(_SaveToken value) saveToken,
    required TResult Function(_UpdateToken value) updateToken,
    required TResult Function(_LoadSettings value) loadSettings,
    required TResult Function(_UpdateSettings value) updateSettings,
    required TResult Function(_HandleNotification value) handleNotification,
  }) {
    return handleNotification(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitializeFCM value)? initializeFCM,
    TResult? Function(_SaveToken value)? saveToken,
    TResult? Function(_UpdateToken value)? updateToken,
    TResult? Function(_LoadSettings value)? loadSettings,
    TResult? Function(_UpdateSettings value)? updateSettings,
    TResult? Function(_HandleNotification value)? handleNotification,
  }) {
    return handleNotification?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeFCM value)? initializeFCM,
    TResult Function(_SaveToken value)? saveToken,
    TResult Function(_UpdateToken value)? updateToken,
    TResult Function(_LoadSettings value)? loadSettings,
    TResult Function(_UpdateSettings value)? updateSettings,
    TResult Function(_HandleNotification value)? handleNotification,
    required TResult orElse(),
  }) {
    if (handleNotification != null) {
      return handleNotification(this);
    }
    return orElse();
  }
}

abstract class _HandleNotification implements NotificationsEvent {
  const factory _HandleNotification({
    required final Map<String, dynamic> payload,
  }) = _$HandleNotificationImpl;

  Map<String, dynamic> get payload;

  /// Create a copy of NotificationsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HandleNotificationImplCopyWith<_$HandleNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
