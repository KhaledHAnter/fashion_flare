// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signin_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SigninState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() emailSuccess,
    required TResult Function(String errMsg) emailError,
    required TResult Function() googleSuccess,
    required TResult Function() googleError,
    required TResult Function() googleNotRegistered,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? emailSuccess,
    TResult? Function(String errMsg)? emailError,
    TResult? Function()? googleSuccess,
    TResult? Function()? googleError,
    TResult? Function()? googleNotRegistered,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? emailSuccess,
    TResult Function(String errMsg)? emailError,
    TResult Function()? googleSuccess,
    TResult Function()? googleError,
    TResult Function()? googleNotRegistered,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(EmailSuccess value) emailSuccess,
    required TResult Function(EmailError value) emailError,
    required TResult Function(GoogleSuccess value) googleSuccess,
    required TResult Function(GoogleError value) googleError,
    required TResult Function(GoogleNotRegistered value) googleNotRegistered,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(EmailSuccess value)? emailSuccess,
    TResult? Function(EmailError value)? emailError,
    TResult? Function(GoogleSuccess value)? googleSuccess,
    TResult? Function(GoogleError value)? googleError,
    TResult? Function(GoogleNotRegistered value)? googleNotRegistered,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(EmailSuccess value)? emailSuccess,
    TResult Function(EmailError value)? emailError,
    TResult Function(GoogleSuccess value)? googleSuccess,
    TResult Function(GoogleError value)? googleError,
    TResult Function(GoogleNotRegistered value)? googleNotRegistered,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SigninStateCopyWith<$Res> {
  factory $SigninStateCopyWith(
          SigninState value, $Res Function(SigninState) then) =
      _$SigninStateCopyWithImpl<$Res, SigninState>;
}

/// @nodoc
class _$SigninStateCopyWithImpl<$Res, $Val extends SigninState>
    implements $SigninStateCopyWith<$Res> {
  _$SigninStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SigninState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SigninStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SigninState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SigninState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() emailSuccess,
    required TResult Function(String errMsg) emailError,
    required TResult Function() googleSuccess,
    required TResult Function() googleError,
    required TResult Function() googleNotRegistered,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? emailSuccess,
    TResult? Function(String errMsg)? emailError,
    TResult? Function()? googleSuccess,
    TResult? Function()? googleError,
    TResult? Function()? googleNotRegistered,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? emailSuccess,
    TResult Function(String errMsg)? emailError,
    TResult Function()? googleSuccess,
    TResult Function()? googleError,
    TResult Function()? googleNotRegistered,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(EmailSuccess value) emailSuccess,
    required TResult Function(EmailError value) emailError,
    required TResult Function(GoogleSuccess value) googleSuccess,
    required TResult Function(GoogleError value) googleError,
    required TResult Function(GoogleNotRegistered value) googleNotRegistered,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(EmailSuccess value)? emailSuccess,
    TResult? Function(EmailError value)? emailError,
    TResult? Function(GoogleSuccess value)? googleSuccess,
    TResult? Function(GoogleError value)? googleError,
    TResult? Function(GoogleNotRegistered value)? googleNotRegistered,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(EmailSuccess value)? emailSuccess,
    TResult Function(EmailError value)? emailError,
    TResult Function(GoogleSuccess value)? googleSuccess,
    TResult Function(GoogleError value)? googleError,
    TResult Function(GoogleNotRegistered value)? googleNotRegistered,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SigninState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$SigninStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SigninState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'SigninState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() emailSuccess,
    required TResult Function(String errMsg) emailError,
    required TResult Function() googleSuccess,
    required TResult Function() googleError,
    required TResult Function() googleNotRegistered,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? emailSuccess,
    TResult? Function(String errMsg)? emailError,
    TResult? Function()? googleSuccess,
    TResult? Function()? googleError,
    TResult? Function()? googleNotRegistered,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? emailSuccess,
    TResult Function(String errMsg)? emailError,
    TResult Function()? googleSuccess,
    TResult Function()? googleError,
    TResult Function()? googleNotRegistered,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(EmailSuccess value) emailSuccess,
    required TResult Function(EmailError value) emailError,
    required TResult Function(GoogleSuccess value) googleSuccess,
    required TResult Function(GoogleError value) googleError,
    required TResult Function(GoogleNotRegistered value) googleNotRegistered,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(EmailSuccess value)? emailSuccess,
    TResult? Function(EmailError value)? emailError,
    TResult? Function(GoogleSuccess value)? googleSuccess,
    TResult? Function(GoogleError value)? googleError,
    TResult? Function(GoogleNotRegistered value)? googleNotRegistered,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(EmailSuccess value)? emailSuccess,
    TResult Function(EmailError value)? emailError,
    TResult Function(GoogleSuccess value)? googleSuccess,
    TResult Function(GoogleError value)? googleError,
    TResult Function(GoogleNotRegistered value)? googleNotRegistered,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements SigninState {
  const factory Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$EmailSuccessImplCopyWith<$Res> {
  factory _$$EmailSuccessImplCopyWith(
          _$EmailSuccessImpl value, $Res Function(_$EmailSuccessImpl) then) =
      __$$EmailSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmailSuccessImplCopyWithImpl<$Res>
    extends _$SigninStateCopyWithImpl<$Res, _$EmailSuccessImpl>
    implements _$$EmailSuccessImplCopyWith<$Res> {
  __$$EmailSuccessImplCopyWithImpl(
      _$EmailSuccessImpl _value, $Res Function(_$EmailSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of SigninState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EmailSuccessImpl implements EmailSuccess {
  const _$EmailSuccessImpl();

  @override
  String toString() {
    return 'SigninState.emailSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmailSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() emailSuccess,
    required TResult Function(String errMsg) emailError,
    required TResult Function() googleSuccess,
    required TResult Function() googleError,
    required TResult Function() googleNotRegistered,
  }) {
    return emailSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? emailSuccess,
    TResult? Function(String errMsg)? emailError,
    TResult? Function()? googleSuccess,
    TResult? Function()? googleError,
    TResult? Function()? googleNotRegistered,
  }) {
    return emailSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? emailSuccess,
    TResult Function(String errMsg)? emailError,
    TResult Function()? googleSuccess,
    TResult Function()? googleError,
    TResult Function()? googleNotRegistered,
    required TResult orElse(),
  }) {
    if (emailSuccess != null) {
      return emailSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(EmailSuccess value) emailSuccess,
    required TResult Function(EmailError value) emailError,
    required TResult Function(GoogleSuccess value) googleSuccess,
    required TResult Function(GoogleError value) googleError,
    required TResult Function(GoogleNotRegistered value) googleNotRegistered,
  }) {
    return emailSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(EmailSuccess value)? emailSuccess,
    TResult? Function(EmailError value)? emailError,
    TResult? Function(GoogleSuccess value)? googleSuccess,
    TResult? Function(GoogleError value)? googleError,
    TResult? Function(GoogleNotRegistered value)? googleNotRegistered,
  }) {
    return emailSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(EmailSuccess value)? emailSuccess,
    TResult Function(EmailError value)? emailError,
    TResult Function(GoogleSuccess value)? googleSuccess,
    TResult Function(GoogleError value)? googleError,
    TResult Function(GoogleNotRegistered value)? googleNotRegistered,
    required TResult orElse(),
  }) {
    if (emailSuccess != null) {
      return emailSuccess(this);
    }
    return orElse();
  }
}

abstract class EmailSuccess implements SigninState {
  const factory EmailSuccess() = _$EmailSuccessImpl;
}

/// @nodoc
abstract class _$$EmailErrorImplCopyWith<$Res> {
  factory _$$EmailErrorImplCopyWith(
          _$EmailErrorImpl value, $Res Function(_$EmailErrorImpl) then) =
      __$$EmailErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String errMsg});
}

/// @nodoc
class __$$EmailErrorImplCopyWithImpl<$Res>
    extends _$SigninStateCopyWithImpl<$Res, _$EmailErrorImpl>
    implements _$$EmailErrorImplCopyWith<$Res> {
  __$$EmailErrorImplCopyWithImpl(
      _$EmailErrorImpl _value, $Res Function(_$EmailErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of SigninState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errMsg = null,
  }) {
    return _then(_$EmailErrorImpl(
      null == errMsg
          ? _value.errMsg
          : errMsg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmailErrorImpl implements EmailError {
  const _$EmailErrorImpl(this.errMsg);

  @override
  final String errMsg;

  @override
  String toString() {
    return 'SigninState.emailError(errMsg: $errMsg)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailErrorImpl &&
            (identical(other.errMsg, errMsg) || other.errMsg == errMsg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errMsg);

  /// Create a copy of SigninState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EmailErrorImplCopyWith<_$EmailErrorImpl> get copyWith =>
      __$$EmailErrorImplCopyWithImpl<_$EmailErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() emailSuccess,
    required TResult Function(String errMsg) emailError,
    required TResult Function() googleSuccess,
    required TResult Function() googleError,
    required TResult Function() googleNotRegistered,
  }) {
    return emailError(errMsg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? emailSuccess,
    TResult? Function(String errMsg)? emailError,
    TResult? Function()? googleSuccess,
    TResult? Function()? googleError,
    TResult? Function()? googleNotRegistered,
  }) {
    return emailError?.call(errMsg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? emailSuccess,
    TResult Function(String errMsg)? emailError,
    TResult Function()? googleSuccess,
    TResult Function()? googleError,
    TResult Function()? googleNotRegistered,
    required TResult orElse(),
  }) {
    if (emailError != null) {
      return emailError(errMsg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(EmailSuccess value) emailSuccess,
    required TResult Function(EmailError value) emailError,
    required TResult Function(GoogleSuccess value) googleSuccess,
    required TResult Function(GoogleError value) googleError,
    required TResult Function(GoogleNotRegistered value) googleNotRegistered,
  }) {
    return emailError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(EmailSuccess value)? emailSuccess,
    TResult? Function(EmailError value)? emailError,
    TResult? Function(GoogleSuccess value)? googleSuccess,
    TResult? Function(GoogleError value)? googleError,
    TResult? Function(GoogleNotRegistered value)? googleNotRegistered,
  }) {
    return emailError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(EmailSuccess value)? emailSuccess,
    TResult Function(EmailError value)? emailError,
    TResult Function(GoogleSuccess value)? googleSuccess,
    TResult Function(GoogleError value)? googleError,
    TResult Function(GoogleNotRegistered value)? googleNotRegistered,
    required TResult orElse(),
  }) {
    if (emailError != null) {
      return emailError(this);
    }
    return orElse();
  }
}

abstract class EmailError implements SigninState {
  const factory EmailError(final String errMsg) = _$EmailErrorImpl;

  String get errMsg;

  /// Create a copy of SigninState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EmailErrorImplCopyWith<_$EmailErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GoogleSuccessImplCopyWith<$Res> {
  factory _$$GoogleSuccessImplCopyWith(
          _$GoogleSuccessImpl value, $Res Function(_$GoogleSuccessImpl) then) =
      __$$GoogleSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoogleSuccessImplCopyWithImpl<$Res>
    extends _$SigninStateCopyWithImpl<$Res, _$GoogleSuccessImpl>
    implements _$$GoogleSuccessImplCopyWith<$Res> {
  __$$GoogleSuccessImplCopyWithImpl(
      _$GoogleSuccessImpl _value, $Res Function(_$GoogleSuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of SigninState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GoogleSuccessImpl implements GoogleSuccess {
  const _$GoogleSuccessImpl();

  @override
  String toString() {
    return 'SigninState.googleSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GoogleSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() emailSuccess,
    required TResult Function(String errMsg) emailError,
    required TResult Function() googleSuccess,
    required TResult Function() googleError,
    required TResult Function() googleNotRegistered,
  }) {
    return googleSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? emailSuccess,
    TResult? Function(String errMsg)? emailError,
    TResult? Function()? googleSuccess,
    TResult? Function()? googleError,
    TResult? Function()? googleNotRegistered,
  }) {
    return googleSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? emailSuccess,
    TResult Function(String errMsg)? emailError,
    TResult Function()? googleSuccess,
    TResult Function()? googleError,
    TResult Function()? googleNotRegistered,
    required TResult orElse(),
  }) {
    if (googleSuccess != null) {
      return googleSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(EmailSuccess value) emailSuccess,
    required TResult Function(EmailError value) emailError,
    required TResult Function(GoogleSuccess value) googleSuccess,
    required TResult Function(GoogleError value) googleError,
    required TResult Function(GoogleNotRegistered value) googleNotRegistered,
  }) {
    return googleSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(EmailSuccess value)? emailSuccess,
    TResult? Function(EmailError value)? emailError,
    TResult? Function(GoogleSuccess value)? googleSuccess,
    TResult? Function(GoogleError value)? googleError,
    TResult? Function(GoogleNotRegistered value)? googleNotRegistered,
  }) {
    return googleSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(EmailSuccess value)? emailSuccess,
    TResult Function(EmailError value)? emailError,
    TResult Function(GoogleSuccess value)? googleSuccess,
    TResult Function(GoogleError value)? googleError,
    TResult Function(GoogleNotRegistered value)? googleNotRegistered,
    required TResult orElse(),
  }) {
    if (googleSuccess != null) {
      return googleSuccess(this);
    }
    return orElse();
  }
}

abstract class GoogleSuccess implements SigninState {
  const factory GoogleSuccess() = _$GoogleSuccessImpl;
}

/// @nodoc
abstract class _$$GoogleErrorImplCopyWith<$Res> {
  factory _$$GoogleErrorImplCopyWith(
          _$GoogleErrorImpl value, $Res Function(_$GoogleErrorImpl) then) =
      __$$GoogleErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoogleErrorImplCopyWithImpl<$Res>
    extends _$SigninStateCopyWithImpl<$Res, _$GoogleErrorImpl>
    implements _$$GoogleErrorImplCopyWith<$Res> {
  __$$GoogleErrorImplCopyWithImpl(
      _$GoogleErrorImpl _value, $Res Function(_$GoogleErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of SigninState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GoogleErrorImpl implements GoogleError {
  const _$GoogleErrorImpl();

  @override
  String toString() {
    return 'SigninState.googleError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GoogleErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() emailSuccess,
    required TResult Function(String errMsg) emailError,
    required TResult Function() googleSuccess,
    required TResult Function() googleError,
    required TResult Function() googleNotRegistered,
  }) {
    return googleError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? emailSuccess,
    TResult? Function(String errMsg)? emailError,
    TResult? Function()? googleSuccess,
    TResult? Function()? googleError,
    TResult? Function()? googleNotRegistered,
  }) {
    return googleError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? emailSuccess,
    TResult Function(String errMsg)? emailError,
    TResult Function()? googleSuccess,
    TResult Function()? googleError,
    TResult Function()? googleNotRegistered,
    required TResult orElse(),
  }) {
    if (googleError != null) {
      return googleError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(EmailSuccess value) emailSuccess,
    required TResult Function(EmailError value) emailError,
    required TResult Function(GoogleSuccess value) googleSuccess,
    required TResult Function(GoogleError value) googleError,
    required TResult Function(GoogleNotRegistered value) googleNotRegistered,
  }) {
    return googleError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(EmailSuccess value)? emailSuccess,
    TResult? Function(EmailError value)? emailError,
    TResult? Function(GoogleSuccess value)? googleSuccess,
    TResult? Function(GoogleError value)? googleError,
    TResult? Function(GoogleNotRegistered value)? googleNotRegistered,
  }) {
    return googleError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(EmailSuccess value)? emailSuccess,
    TResult Function(EmailError value)? emailError,
    TResult Function(GoogleSuccess value)? googleSuccess,
    TResult Function(GoogleError value)? googleError,
    TResult Function(GoogleNotRegistered value)? googleNotRegistered,
    required TResult orElse(),
  }) {
    if (googleError != null) {
      return googleError(this);
    }
    return orElse();
  }
}

abstract class GoogleError implements SigninState {
  const factory GoogleError() = _$GoogleErrorImpl;
}

/// @nodoc
abstract class _$$GoogleNotRegisteredImplCopyWith<$Res> {
  factory _$$GoogleNotRegisteredImplCopyWith(_$GoogleNotRegisteredImpl value,
          $Res Function(_$GoogleNotRegisteredImpl) then) =
      __$$GoogleNotRegisteredImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GoogleNotRegisteredImplCopyWithImpl<$Res>
    extends _$SigninStateCopyWithImpl<$Res, _$GoogleNotRegisteredImpl>
    implements _$$GoogleNotRegisteredImplCopyWith<$Res> {
  __$$GoogleNotRegisteredImplCopyWithImpl(_$GoogleNotRegisteredImpl _value,
      $Res Function(_$GoogleNotRegisteredImpl) _then)
      : super(_value, _then);

  /// Create a copy of SigninState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GoogleNotRegisteredImpl implements GoogleNotRegistered {
  const _$GoogleNotRegisteredImpl();

  @override
  String toString() {
    return 'SigninState.googleNotRegistered()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoogleNotRegisteredImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() emailSuccess,
    required TResult Function(String errMsg) emailError,
    required TResult Function() googleSuccess,
    required TResult Function() googleError,
    required TResult Function() googleNotRegistered,
  }) {
    return googleNotRegistered();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? emailSuccess,
    TResult? Function(String errMsg)? emailError,
    TResult? Function()? googleSuccess,
    TResult? Function()? googleError,
    TResult? Function()? googleNotRegistered,
  }) {
    return googleNotRegistered?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? emailSuccess,
    TResult Function(String errMsg)? emailError,
    TResult Function()? googleSuccess,
    TResult Function()? googleError,
    TResult Function()? googleNotRegistered,
    required TResult orElse(),
  }) {
    if (googleNotRegistered != null) {
      return googleNotRegistered();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(EmailSuccess value) emailSuccess,
    required TResult Function(EmailError value) emailError,
    required TResult Function(GoogleSuccess value) googleSuccess,
    required TResult Function(GoogleError value) googleError,
    required TResult Function(GoogleNotRegistered value) googleNotRegistered,
  }) {
    return googleNotRegistered(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(EmailSuccess value)? emailSuccess,
    TResult? Function(EmailError value)? emailError,
    TResult? Function(GoogleSuccess value)? googleSuccess,
    TResult? Function(GoogleError value)? googleError,
    TResult? Function(GoogleNotRegistered value)? googleNotRegistered,
  }) {
    return googleNotRegistered?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(EmailSuccess value)? emailSuccess,
    TResult Function(EmailError value)? emailError,
    TResult Function(GoogleSuccess value)? googleSuccess,
    TResult Function(GoogleError value)? googleError,
    TResult Function(GoogleNotRegistered value)? googleNotRegistered,
    required TResult orElse(),
  }) {
    if (googleNotRegistered != null) {
      return googleNotRegistered(this);
    }
    return orElse();
  }
}

abstract class GoogleNotRegistered implements SigninState {
  const factory GoogleNotRegistered() = _$GoogleNotRegisteredImpl;
}
