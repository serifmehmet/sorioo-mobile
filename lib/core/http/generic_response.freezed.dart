// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generic_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GenericResponse<T> _$GenericResponseFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _GenericResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$GenericResponse<T> {
  T? get data => throw _privateConstructorUsedError;
  ApiError? get error => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenericResponseCopyWith<T, GenericResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenericResponseCopyWith<T, $Res> {
  factory $GenericResponseCopyWith(
          GenericResponse<T> value, $Res Function(GenericResponse<T>) then) =
      _$GenericResponseCopyWithImpl<T, $Res, GenericResponse<T>>;
  @useResult
  $Res call({T? data, ApiError? error});

  $ApiErrorCopyWith<$Res>? get error;
}

/// @nodoc
class _$GenericResponseCopyWithImpl<T, $Res, $Val extends GenericResponse<T>>
    implements $GenericResponseCopyWith<T, $Res> {
  _$GenericResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ApiError?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ApiErrorCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $ApiErrorCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GenericResponseCopyWith<T, $Res>
    implements $GenericResponseCopyWith<T, $Res> {
  factory _$$_GenericResponseCopyWith(_$_GenericResponse<T> value,
          $Res Function(_$_GenericResponse<T>) then) =
      __$$_GenericResponseCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T? data, ApiError? error});

  @override
  $ApiErrorCopyWith<$Res>? get error;
}

/// @nodoc
class __$$_GenericResponseCopyWithImpl<T, $Res>
    extends _$GenericResponseCopyWithImpl<T, $Res, _$_GenericResponse<T>>
    implements _$$_GenericResponseCopyWith<T, $Res> {
  __$$_GenericResponseCopyWithImpl(
      _$_GenericResponse<T> _value, $Res Function(_$_GenericResponse<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_$_GenericResponse<T>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ApiError?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$_GenericResponse<T> implements _GenericResponse<T> {
  _$_GenericResponse({this.data, this.error});

  factory _$_GenericResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$_GenericResponseFromJson(json, fromJsonT);

  @override
  final T? data;
  @override
  final ApiError? error;

  @override
  String toString() {
    return 'GenericResponse<$T>(data: $data, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GenericResponse<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(data), error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GenericResponseCopyWith<T, _$_GenericResponse<T>> get copyWith =>
      __$$_GenericResponseCopyWithImpl<T, _$_GenericResponse<T>>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$_GenericResponseToJson<T>(this, toJsonT);
  }
}

abstract class _GenericResponse<T> implements GenericResponse<T> {
  factory _GenericResponse({final T? data, final ApiError? error}) =
      _$_GenericResponse<T>;

  factory _GenericResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$_GenericResponse<T>.fromJson;

  @override
  T? get data;
  @override
  ApiError? get error;
  @override
  @JsonKey(ignore: true)
  _$$_GenericResponseCopyWith<T, _$_GenericResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
