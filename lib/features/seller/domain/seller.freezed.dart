// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Seller _$SellerFromJson(Map<String, dynamic> json) {
  return _Seller.fromJson(json);
}

/// @nodoc
mixin _$Seller {
  String? get id => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  String? get speciality => throw _privateConstructorUsedError;
  String? get industry => throw _privateConstructorUsedError;
  String? get graduation => throw _privateConstructorUsedError;
  String? get sellerBio => throw _privateConstructorUsedError;
  Image? get sellerImage => throw _privateConstructorUsedError;
  Category? get sellerMainCategory => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SellerCopyWith<Seller> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellerCopyWith<$Res> {
  factory $SellerCopyWith(Seller value, $Res Function(Seller) then) =
      _$SellerCopyWithImpl<$Res, Seller>;
  @useResult
  $Res call(
      {String? id,
      User? user,
      String? speciality,
      String? industry,
      String? graduation,
      String? sellerBio,
      Image? sellerImage,
      Category? sellerMainCategory});

  $UserCopyWith<$Res>? get user;
  $ImageCopyWith<$Res>? get sellerImage;
  $CategoryCopyWith<$Res>? get sellerMainCategory;
}

/// @nodoc
class _$SellerCopyWithImpl<$Res, $Val extends Seller>
    implements $SellerCopyWith<$Res> {
  _$SellerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? speciality = freezed,
    Object? industry = freezed,
    Object? graduation = freezed,
    Object? sellerBio = freezed,
    Object? sellerImage = freezed,
    Object? sellerMainCategory = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      speciality: freezed == speciality
          ? _value.speciality
          : speciality // ignore: cast_nullable_to_non_nullable
              as String?,
      industry: freezed == industry
          ? _value.industry
          : industry // ignore: cast_nullable_to_non_nullable
              as String?,
      graduation: freezed == graduation
          ? _value.graduation
          : graduation // ignore: cast_nullable_to_non_nullable
              as String?,
      sellerBio: freezed == sellerBio
          ? _value.sellerBio
          : sellerBio // ignore: cast_nullable_to_non_nullable
              as String?,
      sellerImage: freezed == sellerImage
          ? _value.sellerImage
          : sellerImage // ignore: cast_nullable_to_non_nullable
              as Image?,
      sellerMainCategory: freezed == sellerMainCategory
          ? _value.sellerMainCategory
          : sellerMainCategory // ignore: cast_nullable_to_non_nullable
              as Category?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageCopyWith<$Res>? get sellerImage {
    if (_value.sellerImage == null) {
      return null;
    }

    return $ImageCopyWith<$Res>(_value.sellerImage!, (value) {
      return _then(_value.copyWith(sellerImage: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res>? get sellerMainCategory {
    if (_value.sellerMainCategory == null) {
      return null;
    }

    return $CategoryCopyWith<$Res>(_value.sellerMainCategory!, (value) {
      return _then(_value.copyWith(sellerMainCategory: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_SellerCopyWith<$Res> implements $SellerCopyWith<$Res> {
  factory _$$_SellerCopyWith(_$_Seller value, $Res Function(_$_Seller) then) =
      __$$_SellerCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      User? user,
      String? speciality,
      String? industry,
      String? graduation,
      String? sellerBio,
      Image? sellerImage,
      Category? sellerMainCategory});

  @override
  $UserCopyWith<$Res>? get user;
  @override
  $ImageCopyWith<$Res>? get sellerImage;
  @override
  $CategoryCopyWith<$Res>? get sellerMainCategory;
}

/// @nodoc
class __$$_SellerCopyWithImpl<$Res>
    extends _$SellerCopyWithImpl<$Res, _$_Seller>
    implements _$$_SellerCopyWith<$Res> {
  __$$_SellerCopyWithImpl(_$_Seller _value, $Res Function(_$_Seller) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user = freezed,
    Object? speciality = freezed,
    Object? industry = freezed,
    Object? graduation = freezed,
    Object? sellerBio = freezed,
    Object? sellerImage = freezed,
    Object? sellerMainCategory = freezed,
  }) {
    return _then(_$_Seller(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      speciality: freezed == speciality
          ? _value.speciality
          : speciality // ignore: cast_nullable_to_non_nullable
              as String?,
      industry: freezed == industry
          ? _value.industry
          : industry // ignore: cast_nullable_to_non_nullable
              as String?,
      graduation: freezed == graduation
          ? _value.graduation
          : graduation // ignore: cast_nullable_to_non_nullable
              as String?,
      sellerBio: freezed == sellerBio
          ? _value.sellerBio
          : sellerBio // ignore: cast_nullable_to_non_nullable
              as String?,
      sellerImage: freezed == sellerImage
          ? _value.sellerImage
          : sellerImage // ignore: cast_nullable_to_non_nullable
              as Image?,
      sellerMainCategory: freezed == sellerMainCategory
          ? _value.sellerMainCategory
          : sellerMainCategory // ignore: cast_nullable_to_non_nullable
              as Category?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Seller implements _Seller {
  _$_Seller(
      {this.id,
      this.user,
      this.speciality,
      this.industry,
      this.graduation,
      this.sellerBio,
      this.sellerImage,
      this.sellerMainCategory});

  factory _$_Seller.fromJson(Map<String, dynamic> json) =>
      _$$_SellerFromJson(json);

  @override
  final String? id;
  @override
  final User? user;
  @override
  final String? speciality;
  @override
  final String? industry;
  @override
  final String? graduation;
  @override
  final String? sellerBio;
  @override
  final Image? sellerImage;
  @override
  final Category? sellerMainCategory;

  @override
  String toString() {
    return 'Seller(id: $id, user: $user, speciality: $speciality, industry: $industry, graduation: $graduation, sellerBio: $sellerBio, sellerImage: $sellerImage, sellerMainCategory: $sellerMainCategory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Seller &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.speciality, speciality) ||
                other.speciality == speciality) &&
            (identical(other.industry, industry) ||
                other.industry == industry) &&
            (identical(other.graduation, graduation) ||
                other.graduation == graduation) &&
            (identical(other.sellerBio, sellerBio) ||
                other.sellerBio == sellerBio) &&
            (identical(other.sellerImage, sellerImage) ||
                other.sellerImage == sellerImage) &&
            (identical(other.sellerMainCategory, sellerMainCategory) ||
                other.sellerMainCategory == sellerMainCategory));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, user, speciality, industry,
      graduation, sellerBio, sellerImage, sellerMainCategory);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SellerCopyWith<_$_Seller> get copyWith =>
      __$$_SellerCopyWithImpl<_$_Seller>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SellerToJson(
      this,
    );
  }
}

abstract class _Seller implements Seller {
  factory _Seller(
      {final String? id,
      final User? user,
      final String? speciality,
      final String? industry,
      final String? graduation,
      final String? sellerBio,
      final Image? sellerImage,
      final Category? sellerMainCategory}) = _$_Seller;

  factory _Seller.fromJson(Map<String, dynamic> json) = _$_Seller.fromJson;

  @override
  String? get id;
  @override
  User? get user;
  @override
  String? get speciality;
  @override
  String? get industry;
  @override
  String? get graduation;
  @override
  String? get sellerBio;
  @override
  Image? get sellerImage;
  @override
  Category? get sellerMainCategory;
  @override
  @JsonKey(ignore: true)
  _$$_SellerCopyWith<_$_Seller> get copyWith =>
      throw _privateConstructorUsedError;
}
