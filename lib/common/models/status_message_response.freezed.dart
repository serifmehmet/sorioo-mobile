// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status_message_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StatusMessageResponse _$StatusMessageResponseFromJson(
    Map<String, dynamic> json) {
  return _StatusMessageResponse.fromJson(json);
}

/// @nodoc
mixin _$StatusMessageResponse {
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatusMessageResponseCopyWith<StatusMessageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusMessageResponseCopyWith<$Res> {
  factory $StatusMessageResponseCopyWith(StatusMessageResponse value,
          $Res Function(StatusMessageResponse) then) =
      _$StatusMessageResponseCopyWithImpl<$Res, StatusMessageResponse>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$StatusMessageResponseCopyWithImpl<$Res,
        $Val extends StatusMessageResponse>
    implements $StatusMessageResponseCopyWith<$Res> {
  _$StatusMessageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StatusMessageResponseCopyWith<$Res>
    implements $StatusMessageResponseCopyWith<$Res> {
  factory _$$_StatusMessageResponseCopyWith(_$_StatusMessageResponse value,
          $Res Function(_$_StatusMessageResponse) then) =
      __$$_StatusMessageResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_StatusMessageResponseCopyWithImpl<$Res>
    extends _$StatusMessageResponseCopyWithImpl<$Res, _$_StatusMessageResponse>
    implements _$$_StatusMessageResponseCopyWith<$Res> {
  __$$_StatusMessageResponseCopyWithImpl(_$_StatusMessageResponse _value,
      $Res Function(_$_StatusMessageResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_StatusMessageResponse(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_StatusMessageResponse implements _StatusMessageResponse {
  _$_StatusMessageResponse({required this.message});

  factory _$_StatusMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$$_StatusMessageResponseFromJson(json);

  @override
  final String message;

  @override
  String toString() {
    return 'StatusMessageResponse(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StatusMessageResponse &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StatusMessageResponseCopyWith<_$_StatusMessageResponse> get copyWith =>
      __$$_StatusMessageResponseCopyWithImpl<_$_StatusMessageResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StatusMessageResponseToJson(
      this,
    );
  }
}

abstract class _StatusMessageResponse implements StatusMessageResponse {
  factory _StatusMessageResponse({required final String message}) =
      _$_StatusMessageResponse;

  factory _StatusMessageResponse.fromJson(Map<String, dynamic> json) =
      _$_StatusMessageResponse.fromJson;

  @override
  String get message;
  @override
  @JsonKey(ignore: true)
  _$$_StatusMessageResponseCopyWith<_$_StatusMessageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
