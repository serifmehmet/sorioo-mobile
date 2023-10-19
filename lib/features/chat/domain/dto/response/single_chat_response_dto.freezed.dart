// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'single_chat_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SingleChatResponseDto _$SingleChatResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _SingleChatResponseDto.fromJson(json);
}

/// @nodoc
mixin _$SingleChatResponseDto {
  String get id => throw _privateConstructorUsedError;
  String get senderFullName => throw _privateConstructorUsedError;
  DateTime get addedDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SingleChatResponseDtoCopyWith<SingleChatResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SingleChatResponseDtoCopyWith<$Res> {
  factory $SingleChatResponseDtoCopyWith(SingleChatResponseDto value,
          $Res Function(SingleChatResponseDto) then) =
      _$SingleChatResponseDtoCopyWithImpl<$Res, SingleChatResponseDto>;
  @useResult
  $Res call({String id, String senderFullName, DateTime addedDate});
}

/// @nodoc
class _$SingleChatResponseDtoCopyWithImpl<$Res,
        $Val extends SingleChatResponseDto>
    implements $SingleChatResponseDtoCopyWith<$Res> {
  _$SingleChatResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderFullName = null,
    Object? addedDate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      senderFullName: null == senderFullName
          ? _value.senderFullName
          : senderFullName // ignore: cast_nullable_to_non_nullable
              as String,
      addedDate: null == addedDate
          ? _value.addedDate
          : addedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SingleChatResponseDtoCopyWith<$Res>
    implements $SingleChatResponseDtoCopyWith<$Res> {
  factory _$$_SingleChatResponseDtoCopyWith(_$_SingleChatResponseDto value,
          $Res Function(_$_SingleChatResponseDto) then) =
      __$$_SingleChatResponseDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String senderFullName, DateTime addedDate});
}

/// @nodoc
class __$$_SingleChatResponseDtoCopyWithImpl<$Res>
    extends _$SingleChatResponseDtoCopyWithImpl<$Res, _$_SingleChatResponseDto>
    implements _$$_SingleChatResponseDtoCopyWith<$Res> {
  __$$_SingleChatResponseDtoCopyWithImpl(_$_SingleChatResponseDto _value,
      $Res Function(_$_SingleChatResponseDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? senderFullName = null,
    Object? addedDate = null,
  }) {
    return _then(_$_SingleChatResponseDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      senderFullName: null == senderFullName
          ? _value.senderFullName
          : senderFullName // ignore: cast_nullable_to_non_nullable
              as String,
      addedDate: null == addedDate
          ? _value.addedDate
          : addedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SingleChatResponseDto implements _SingleChatResponseDto {
  _$_SingleChatResponseDto(
      {required this.id,
      required this.senderFullName,
      required this.addedDate});

  factory _$_SingleChatResponseDto.fromJson(Map<String, dynamic> json) =>
      _$$_SingleChatResponseDtoFromJson(json);

  @override
  final String id;
  @override
  final String senderFullName;
  @override
  final DateTime addedDate;

  @override
  String toString() {
    return 'SingleChatResponseDto(id: $id, senderFullName: $senderFullName, addedDate: $addedDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SingleChatResponseDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.senderFullName, senderFullName) ||
                other.senderFullName == senderFullName) &&
            (identical(other.addedDate, addedDate) ||
                other.addedDate == addedDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, senderFullName, addedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SingleChatResponseDtoCopyWith<_$_SingleChatResponseDto> get copyWith =>
      __$$_SingleChatResponseDtoCopyWithImpl<_$_SingleChatResponseDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SingleChatResponseDtoToJson(
      this,
    );
  }
}

abstract class _SingleChatResponseDto implements SingleChatResponseDto {
  factory _SingleChatResponseDto(
      {required final String id,
      required final String senderFullName,
      required final DateTime addedDate}) = _$_SingleChatResponseDto;

  factory _SingleChatResponseDto.fromJson(Map<String, dynamic> json) =
      _$_SingleChatResponseDto.fromJson;

  @override
  String get id;
  @override
  String get senderFullName;
  @override
  DateTime get addedDate;
  @override
  @JsonKey(ignore: true)
  _$$_SingleChatResponseDtoCopyWith<_$_SingleChatResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}
