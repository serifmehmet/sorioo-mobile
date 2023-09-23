// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_seller_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateSellerDto _$UpdateSellerDtoFromJson(Map<String, dynamic> json) {
  return _UpdateSellerDto.fromJson(json);
}

/// @nodoc
mixin _$UpdateSellerDto {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String? get fullName => throw _privateConstructorUsedError;
  String? get graduation => throw _privateConstructorUsedError;
  String? get industry => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  String? get mainCategoryId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateSellerDtoCopyWith<UpdateSellerDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateSellerDtoCopyWith<$Res> {
  factory $UpdateSellerDtoCopyWith(
          UpdateSellerDto value, $Res Function(UpdateSellerDto) then) =
      _$UpdateSellerDtoCopyWithImpl<$Res, UpdateSellerDto>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String? fullName,
      String? graduation,
      String? industry,
      String? bio,
      String? mainCategoryId});
}

/// @nodoc
class _$UpdateSellerDtoCopyWithImpl<$Res, $Val extends UpdateSellerDto>
    implements $UpdateSellerDtoCopyWith<$Res> {
  _$UpdateSellerDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? fullName = freezed,
    Object? graduation = freezed,
    Object? industry = freezed,
    Object? bio = freezed,
    Object? mainCategoryId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      graduation: freezed == graduation
          ? _value.graduation
          : graduation // ignore: cast_nullable_to_non_nullable
              as String?,
      industry: freezed == industry
          ? _value.industry
          : industry // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      mainCategoryId: freezed == mainCategoryId
          ? _value.mainCategoryId
          : mainCategoryId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdateSellerDtoCopyWith<$Res>
    implements $UpdateSellerDtoCopyWith<$Res> {
  factory _$$_UpdateSellerDtoCopyWith(
          _$_UpdateSellerDto value, $Res Function(_$_UpdateSellerDto) then) =
      __$$_UpdateSellerDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String? fullName,
      String? graduation,
      String? industry,
      String? bio,
      String? mainCategoryId});
}

/// @nodoc
class __$$_UpdateSellerDtoCopyWithImpl<$Res>
    extends _$UpdateSellerDtoCopyWithImpl<$Res, _$_UpdateSellerDto>
    implements _$$_UpdateSellerDtoCopyWith<$Res> {
  __$$_UpdateSellerDtoCopyWithImpl(
      _$_UpdateSellerDto _value, $Res Function(_$_UpdateSellerDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? fullName = freezed,
    Object? graduation = freezed,
    Object? industry = freezed,
    Object? bio = freezed,
    Object? mainCategoryId = freezed,
  }) {
    return _then(_$_UpdateSellerDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: freezed == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String?,
      graduation: freezed == graduation
          ? _value.graduation
          : graduation // ignore: cast_nullable_to_non_nullable
              as String?,
      industry: freezed == industry
          ? _value.industry
          : industry // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      mainCategoryId: freezed == mainCategoryId
          ? _value.mainCategoryId
          : mainCategoryId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdateSellerDto implements _UpdateSellerDto {
  _$_UpdateSellerDto(
      {required this.id,
      required this.userId,
      this.fullName,
      this.graduation,
      this.industry,
      this.bio,
      this.mainCategoryId});

  factory _$_UpdateSellerDto.fromJson(Map<String, dynamic> json) =>
      _$$_UpdateSellerDtoFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String? fullName;
  @override
  final String? graduation;
  @override
  final String? industry;
  @override
  final String? bio;
  @override
  final String? mainCategoryId;

  @override
  String toString() {
    return 'UpdateSellerDto(id: $id, userId: $userId, fullName: $fullName, graduation: $graduation, industry: $industry, bio: $bio, mainCategoryId: $mainCategoryId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateSellerDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.graduation, graduation) ||
                other.graduation == graduation) &&
            (identical(other.industry, industry) ||
                other.industry == industry) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.mainCategoryId, mainCategoryId) ||
                other.mainCategoryId == mainCategoryId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, fullName, graduation,
      industry, bio, mainCategoryId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateSellerDtoCopyWith<_$_UpdateSellerDto> get copyWith =>
      __$$_UpdateSellerDtoCopyWithImpl<_$_UpdateSellerDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdateSellerDtoToJson(
      this,
    );
  }
}

abstract class _UpdateSellerDto implements UpdateSellerDto {
  factory _UpdateSellerDto(
      {required final String id,
      required final String userId,
      final String? fullName,
      final String? graduation,
      final String? industry,
      final String? bio,
      final String? mainCategoryId}) = _$_UpdateSellerDto;

  factory _UpdateSellerDto.fromJson(Map<String, dynamic> json) =
      _$_UpdateSellerDto.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String? get fullName;
  @override
  String? get graduation;
  @override
  String? get industry;
  @override
  String? get bio;
  @override
  String? get mainCategoryId;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateSellerDtoCopyWith<_$_UpdateSellerDto> get copyWith =>
      throw _privateConstructorUsedError;
}
