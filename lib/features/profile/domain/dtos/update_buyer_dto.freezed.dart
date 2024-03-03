// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_buyer_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateBuyerDto _$UpdateBuyerDtoFromJson(Map<String, dynamic> json) {
  return _UpdateBuyerDto.fromJson(json);
}

/// @nodoc
mixin _$UpdateBuyerDto {
  String get id => throw _privateConstructorUsedError;
  String? get fullName => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get about => throw _privateConstructorUsedError;
  Image? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateBuyerDtoCopyWith<UpdateBuyerDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateBuyerDtoCopyWith<$Res> {
  factory $UpdateBuyerDtoCopyWith(
          UpdateBuyerDto value, $Res Function(UpdateBuyerDto) then) =
      _$UpdateBuyerDtoCopyWithImpl<$Res, UpdateBuyerDto>;
  @useResult
  $Res call(
      {String id,
      String? fullName,
      String? phoneNumber,
      String? about,
      Image? image});

  $ImageCopyWith<$Res>? get image;
}

/// @nodoc
class _$UpdateBuyerDtoCopyWithImpl<$Res, $Val extends UpdateBuyerDto>
    implements $UpdateBuyerDtoCopyWith<$Res> {
  _$UpdateBuyerDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = freezed,
    Object? phoneNumber = freezed,
    Object? about = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageCopyWith<$Res>? get image {
    if (_value.image == null) {
      return null;
    }

    return $ImageCopyWith<$Res>(_value.image!, (value) {
      return _then(_value.copyWith(image: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UpdateBuyerDtoCopyWith<$Res>
    implements $UpdateBuyerDtoCopyWith<$Res> {
  factory _$$_UpdateBuyerDtoCopyWith(
          _$_UpdateBuyerDto value, $Res Function(_$_UpdateBuyerDto) then) =
      __$$_UpdateBuyerDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? fullName,
      String? phoneNumber,
      String? about,
      Image? image});

  @override
  $ImageCopyWith<$Res>? get image;
}

/// @nodoc
class __$$_UpdateBuyerDtoCopyWithImpl<$Res>
    extends _$UpdateBuyerDtoCopyWithImpl<$Res, _$_UpdateBuyerDto>
    implements _$$_UpdateBuyerDtoCopyWith<$Res> {
  __$$_UpdateBuyerDtoCopyWithImpl(
      _$_UpdateBuyerDto _value, $Res Function(_$_UpdateBuyerDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? fullName = freezed,
    Object? phoneNumber = freezed,
    Object? about = freezed,
    Object? image = freezed,
  }) {
    return _then(_$_UpdateBuyerDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      about: freezed == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdateBuyerDto implements _UpdateBuyerDto {
  _$_UpdateBuyerDto(
      {required this.id,
      this.fullName,
      this.phoneNumber,
      this.about,
      this.image});

  factory _$_UpdateBuyerDto.fromJson(Map<String, dynamic> json) =>
      _$$_UpdateBuyerDtoFromJson(json);

  @override
  final String id;
  @override
  final String? fullName;
  @override
  final String? phoneNumber;
  @override
  final String? about;
  @override
  final Image? image;

  @override
  String toString() {
    return 'UpdateBuyerDto(id: $id, fullName: $fullName, phoneNumber: $phoneNumber, about: $about, image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateBuyerDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, fullName, phoneNumber, about, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateBuyerDtoCopyWith<_$_UpdateBuyerDto> get copyWith =>
      __$$_UpdateBuyerDtoCopyWithImpl<_$_UpdateBuyerDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdateBuyerDtoToJson(
      this,
    );
  }
}

abstract class _UpdateBuyerDto implements UpdateBuyerDto {
  factory _UpdateBuyerDto(
      {required final String id,
      final String? fullName,
      final String? phoneNumber,
      final String? about,
      final Image? image}) = _$_UpdateBuyerDto;

  factory _UpdateBuyerDto.fromJson(Map<String, dynamic> json) =
      _$_UpdateBuyerDto.fromJson;

  @override
  String get id;
  @override
  String? get fullName;
  @override
  String? get phoneNumber;
  @override
  String? get about;
  @override
  Image? get image;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateBuyerDtoCopyWith<_$_UpdateBuyerDto> get copyWith =>
      throw _privateConstructorUsedError;
}
