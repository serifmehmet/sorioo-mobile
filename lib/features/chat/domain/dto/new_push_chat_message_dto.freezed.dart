// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_push_chat_message_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewPushChatMessageDto _$NewPushChatMessageDtoFromJson(
    Map<String, dynamic> json) {
  return _NewPushChatMessageDto.fromJson(json);
}

/// @nodoc
mixin _$NewPushChatMessageDto {
  String get message => throw _privateConstructorUsedError;
  String? get clientId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewPushChatMessageDtoCopyWith<NewPushChatMessageDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewPushChatMessageDtoCopyWith<$Res> {
  factory $NewPushChatMessageDtoCopyWith(NewPushChatMessageDto value,
          $Res Function(NewPushChatMessageDto) then) =
      _$NewPushChatMessageDtoCopyWithImpl<$Res, NewPushChatMessageDto>;
  @useResult
  $Res call({String message, String? clientId});
}

/// @nodoc
class _$NewPushChatMessageDtoCopyWithImpl<$Res,
        $Val extends NewPushChatMessageDto>
    implements $NewPushChatMessageDtoCopyWith<$Res> {
  _$NewPushChatMessageDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? clientId = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      clientId: freezed == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewPushChatMessageDtoCopyWith<$Res>
    implements $NewPushChatMessageDtoCopyWith<$Res> {
  factory _$$_NewPushChatMessageDtoCopyWith(_$_NewPushChatMessageDto value,
          $Res Function(_$_NewPushChatMessageDto) then) =
      __$$_NewPushChatMessageDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, String? clientId});
}

/// @nodoc
class __$$_NewPushChatMessageDtoCopyWithImpl<$Res>
    extends _$NewPushChatMessageDtoCopyWithImpl<$Res, _$_NewPushChatMessageDto>
    implements _$$_NewPushChatMessageDtoCopyWith<$Res> {
  __$$_NewPushChatMessageDtoCopyWithImpl(_$_NewPushChatMessageDto _value,
      $Res Function(_$_NewPushChatMessageDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? clientId = freezed,
  }) {
    return _then(_$_NewPushChatMessageDto(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      clientId: freezed == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewPushChatMessageDto implements _NewPushChatMessageDto {
  _$_NewPushChatMessageDto({required this.message, this.clientId});

  factory _$_NewPushChatMessageDto.fromJson(Map<String, dynamic> json) =>
      _$$_NewPushChatMessageDtoFromJson(json);

  @override
  final String message;
  @override
  final String? clientId;

  @override
  String toString() {
    return 'NewPushChatMessageDto(message: $message, clientId: $clientId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewPushChatMessageDto &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, clientId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewPushChatMessageDtoCopyWith<_$_NewPushChatMessageDto> get copyWith =>
      __$$_NewPushChatMessageDtoCopyWithImpl<_$_NewPushChatMessageDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewPushChatMessageDtoToJson(
      this,
    );
  }
}

abstract class _NewPushChatMessageDto implements NewPushChatMessageDto {
  factory _NewPushChatMessageDto(
      {required final String message,
      final String? clientId}) = _$_NewPushChatMessageDto;

  factory _NewPushChatMessageDto.fromJson(Map<String, dynamic> json) =
      _$_NewPushChatMessageDto.fromJson;

  @override
  String get message;
  @override
  String? get clientId;
  @override
  @JsonKey(ignore: true)
  _$$_NewPushChatMessageDtoCopyWith<_$_NewPushChatMessageDto> get copyWith =>
      throw _privateConstructorUsedError;
}
