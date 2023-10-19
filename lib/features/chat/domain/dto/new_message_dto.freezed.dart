// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'new_message_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewMessageDto _$NewMessageDtoFromJson(Map<String, dynamic> json) {
  return _NewMessageDto.fromJson(json);
}

/// @nodoc
mixin _$NewMessageDto {
  String? get clientId => throw _privateConstructorUsedError;
  String? get textMessage => throw _privateConstructorUsedError;
  String? get dateTime => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewMessageDtoCopyWith<NewMessageDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewMessageDtoCopyWith<$Res> {
  factory $NewMessageDtoCopyWith(
          NewMessageDto value, $Res Function(NewMessageDto) then) =
      _$NewMessageDtoCopyWithImpl<$Res, NewMessageDto>;
  @useResult
  $Res call({String? clientId, String? textMessage, String? dateTime});
}

/// @nodoc
class _$NewMessageDtoCopyWithImpl<$Res, $Val extends NewMessageDto>
    implements $NewMessageDtoCopyWith<$Res> {
  _$NewMessageDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientId = freezed,
    Object? textMessage = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_value.copyWith(
      clientId: freezed == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String?,
      textMessage: freezed == textMessage
          ? _value.textMessage
          : textMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NewMessageDtoCopyWith<$Res>
    implements $NewMessageDtoCopyWith<$Res> {
  factory _$$_NewMessageDtoCopyWith(
          _$_NewMessageDto value, $Res Function(_$_NewMessageDto) then) =
      __$$_NewMessageDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? clientId, String? textMessage, String? dateTime});
}

/// @nodoc
class __$$_NewMessageDtoCopyWithImpl<$Res>
    extends _$NewMessageDtoCopyWithImpl<$Res, _$_NewMessageDto>
    implements _$$_NewMessageDtoCopyWith<$Res> {
  __$$_NewMessageDtoCopyWithImpl(
      _$_NewMessageDto _value, $Res Function(_$_NewMessageDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientId = freezed,
    Object? textMessage = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_$_NewMessageDto(
      clientId: freezed == clientId
          ? _value.clientId
          : clientId // ignore: cast_nullable_to_non_nullable
              as String?,
      textMessage: freezed == textMessage
          ? _value.textMessage
          : textMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      dateTime: freezed == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewMessageDto implements _NewMessageDto {
  _$_NewMessageDto({this.clientId, this.textMessage, this.dateTime});

  factory _$_NewMessageDto.fromJson(Map<String, dynamic> json) =>
      _$$_NewMessageDtoFromJson(json);

  @override
  final String? clientId;
  @override
  final String? textMessage;
  @override
  final String? dateTime;

  @override
  String toString() {
    return 'NewMessageDto(clientId: $clientId, textMessage: $textMessage, dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NewMessageDto &&
            (identical(other.clientId, clientId) ||
                other.clientId == clientId) &&
            (identical(other.textMessage, textMessage) ||
                other.textMessage == textMessage) &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, clientId, textMessage, dateTime);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NewMessageDtoCopyWith<_$_NewMessageDto> get copyWith =>
      __$$_NewMessageDtoCopyWithImpl<_$_NewMessageDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewMessageDtoToJson(
      this,
    );
  }
}

abstract class _NewMessageDto implements NewMessageDto {
  factory _NewMessageDto(
      {final String? clientId,
      final String? textMessage,
      final String? dateTime}) = _$_NewMessageDto;

  factory _NewMessageDto.fromJson(Map<String, dynamic> json) =
      _$_NewMessageDto.fromJson;

  @override
  String? get clientId;
  @override
  String? get textMessage;
  @override
  String? get dateTime;
  @override
  @JsonKey(ignore: true)
  _$$_NewMessageDtoCopyWith<_$_NewMessageDto> get copyWith =>
      throw _privateConstructorUsedError;
}
