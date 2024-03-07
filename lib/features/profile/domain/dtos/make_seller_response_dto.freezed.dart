// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'make_seller_response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MakeSellerResponseDto _$MakeSellerResponseDtoFromJson(
    Map<String, dynamic> json) {
  return _MakeSellerResponseDto.fromJson(json);
}

/// @nodoc
mixin _$MakeSellerResponseDto {
  String get id => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  bool get isSeller => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MakeSellerResponseDtoCopyWith<MakeSellerResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MakeSellerResponseDtoCopyWith<$Res> {
  factory $MakeSellerResponseDtoCopyWith(MakeSellerResponseDto value,
          $Res Function(MakeSellerResponseDto) then) =
      _$MakeSellerResponseDtoCopyWithImpl<$Res, MakeSellerResponseDto>;
  @useResult
  $Res call({String id, String fullName, bool isSeller});
}

/// @nodoc
class _$MakeSellerResponseDtoCopyWithImpl<$Res,
        $Val extends MakeSellerResponseDto>
    implements $MakeSellerResponseDtoCopyWith<$Res> {
  _$MakeSellerResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? isSeller = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      isSeller: null == isSeller
          ? _value.isSeller
          : isSeller // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MakeSellerResponseDtoCopyWith<$Res>
    implements $MakeSellerResponseDtoCopyWith<$Res> {
  factory _$$_MakeSellerResponseDtoCopyWith(_$_MakeSellerResponseDto value,
          $Res Function(_$_MakeSellerResponseDto) then) =
      __$$_MakeSellerResponseDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String fullName, bool isSeller});
}

/// @nodoc
class __$$_MakeSellerResponseDtoCopyWithImpl<$Res>
    extends _$MakeSellerResponseDtoCopyWithImpl<$Res, _$_MakeSellerResponseDto>
    implements _$$_MakeSellerResponseDtoCopyWith<$Res> {
  __$$_MakeSellerResponseDtoCopyWithImpl(_$_MakeSellerResponseDto _value,
      $Res Function(_$_MakeSellerResponseDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = null,
    Object? isSeller = null,
  }) {
    return _then(_$_MakeSellerResponseDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      isSeller: null == isSeller
          ? _value.isSeller
          : isSeller // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MakeSellerResponseDto implements _MakeSellerResponseDto {
  _$_MakeSellerResponseDto(
      {required this.id, required this.fullName, required this.isSeller});

  factory _$_MakeSellerResponseDto.fromJson(Map<String, dynamic> json) =>
      _$$_MakeSellerResponseDtoFromJson(json);

  @override
  final String id;
  @override
  final String fullName;
  @override
  final bool isSeller;

  @override
  String toString() {
    return 'MakeSellerResponseDto(id: $id, fullName: $fullName, isSeller: $isSeller)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MakeSellerResponseDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.isSeller, isSeller) ||
                other.isSeller == isSeller));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, fullName, isSeller);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MakeSellerResponseDtoCopyWith<_$_MakeSellerResponseDto> get copyWith =>
      __$$_MakeSellerResponseDtoCopyWithImpl<_$_MakeSellerResponseDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MakeSellerResponseDtoToJson(
      this,
    );
  }
}

abstract class _MakeSellerResponseDto implements MakeSellerResponseDto {
  factory _MakeSellerResponseDto(
      {required final String id,
      required final String fullName,
      required final bool isSeller}) = _$_MakeSellerResponseDto;

  factory _MakeSellerResponseDto.fromJson(Map<String, dynamic> json) =
      _$_MakeSellerResponseDto.fromJson;

  @override
  String get id;
  @override
  String get fullName;
  @override
  bool get isSeller;
  @override
  @JsonKey(ignore: true)
  _$$_MakeSellerResponseDtoCopyWith<_$_MakeSellerResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}
