// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'advert_package.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AdvertPackage _$AdvertPackageFromJson(Map<String, dynamic> json) {
  return _AdvertPackage.fromJson(json);
}

/// @nodoc
mixin _$AdvertPackage {
  int get packageType => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  String? get advertId => throw _privateConstructorUsedError;
  int? get educationOrConsultancy => throw _privateConstructorUsedError;
  int? get workDurationLimit => throw _privateConstructorUsedError;
  int? get advertPackageChoice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdvertPackageCopyWith<AdvertPackage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdvertPackageCopyWith<$Res> {
  factory $AdvertPackageCopyWith(
          AdvertPackage value, $Res Function(AdvertPackage) then) =
      _$AdvertPackageCopyWithImpl<$Res, AdvertPackage>;
  @useResult
  $Res call(
      {int packageType,
      double price,
      @JsonKey(includeToJson: false) String? advertId,
      int? educationOrConsultancy,
      int? workDurationLimit,
      int? advertPackageChoice});
}

/// @nodoc
class _$AdvertPackageCopyWithImpl<$Res, $Val extends AdvertPackage>
    implements $AdvertPackageCopyWith<$Res> {
  _$AdvertPackageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packageType = null,
    Object? price = null,
    Object? advertId = freezed,
    Object? educationOrConsultancy = freezed,
    Object? workDurationLimit = freezed,
    Object? advertPackageChoice = freezed,
  }) {
    return _then(_value.copyWith(
      packageType: null == packageType
          ? _value.packageType
          : packageType // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      advertId: freezed == advertId
          ? _value.advertId
          : advertId // ignore: cast_nullable_to_non_nullable
              as String?,
      educationOrConsultancy: freezed == educationOrConsultancy
          ? _value.educationOrConsultancy
          : educationOrConsultancy // ignore: cast_nullable_to_non_nullable
              as int?,
      workDurationLimit: freezed == workDurationLimit
          ? _value.workDurationLimit
          : workDurationLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      advertPackageChoice: freezed == advertPackageChoice
          ? _value.advertPackageChoice
          : advertPackageChoice // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AdvertPackageCopyWith<$Res>
    implements $AdvertPackageCopyWith<$Res> {
  factory _$$_AdvertPackageCopyWith(
          _$_AdvertPackage value, $Res Function(_$_AdvertPackage) then) =
      __$$_AdvertPackageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int packageType,
      double price,
      @JsonKey(includeToJson: false) String? advertId,
      int? educationOrConsultancy,
      int? workDurationLimit,
      int? advertPackageChoice});
}

/// @nodoc
class __$$_AdvertPackageCopyWithImpl<$Res>
    extends _$AdvertPackageCopyWithImpl<$Res, _$_AdvertPackage>
    implements _$$_AdvertPackageCopyWith<$Res> {
  __$$_AdvertPackageCopyWithImpl(
      _$_AdvertPackage _value, $Res Function(_$_AdvertPackage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? packageType = null,
    Object? price = null,
    Object? advertId = freezed,
    Object? educationOrConsultancy = freezed,
    Object? workDurationLimit = freezed,
    Object? advertPackageChoice = freezed,
  }) {
    return _then(_$_AdvertPackage(
      packageType: null == packageType
          ? _value.packageType
          : packageType // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      advertId: freezed == advertId
          ? _value.advertId
          : advertId // ignore: cast_nullable_to_non_nullable
              as String?,
      educationOrConsultancy: freezed == educationOrConsultancy
          ? _value.educationOrConsultancy
          : educationOrConsultancy // ignore: cast_nullable_to_non_nullable
              as int?,
      workDurationLimit: freezed == workDurationLimit
          ? _value.workDurationLimit
          : workDurationLimit // ignore: cast_nullable_to_non_nullable
              as int?,
      advertPackageChoice: freezed == advertPackageChoice
          ? _value.advertPackageChoice
          : advertPackageChoice // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AdvertPackage implements _AdvertPackage {
  _$_AdvertPackage(
      {required this.packageType,
      required this.price,
      @JsonKey(includeToJson: false) this.advertId,
      this.educationOrConsultancy,
      this.workDurationLimit,
      this.advertPackageChoice});

  factory _$_AdvertPackage.fromJson(Map<String, dynamic> json) =>
      _$$_AdvertPackageFromJson(json);

  @override
  final int packageType;
  @override
  final double price;
  @override
  @JsonKey(includeToJson: false)
  final String? advertId;
  @override
  final int? educationOrConsultancy;
  @override
  final int? workDurationLimit;
  @override
  final int? advertPackageChoice;

  @override
  String toString() {
    return 'AdvertPackage(packageType: $packageType, price: $price, advertId: $advertId, educationOrConsultancy: $educationOrConsultancy, workDurationLimit: $workDurationLimit, advertPackageChoice: $advertPackageChoice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdvertPackage &&
            (identical(other.packageType, packageType) ||
                other.packageType == packageType) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.advertId, advertId) ||
                other.advertId == advertId) &&
            (identical(other.educationOrConsultancy, educationOrConsultancy) ||
                other.educationOrConsultancy == educationOrConsultancy) &&
            (identical(other.workDurationLimit, workDurationLimit) ||
                other.workDurationLimit == workDurationLimit) &&
            (identical(other.advertPackageChoice, advertPackageChoice) ||
                other.advertPackageChoice == advertPackageChoice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, packageType, price, advertId,
      educationOrConsultancy, workDurationLimit, advertPackageChoice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdvertPackageCopyWith<_$_AdvertPackage> get copyWith =>
      __$$_AdvertPackageCopyWithImpl<_$_AdvertPackage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdvertPackageToJson(
      this,
    );
  }
}

abstract class _AdvertPackage implements AdvertPackage {
  factory _AdvertPackage(
      {required final int packageType,
      required final double price,
      @JsonKey(includeToJson: false) final String? advertId,
      final int? educationOrConsultancy,
      final int? workDurationLimit,
      final int? advertPackageChoice}) = _$_AdvertPackage;

  factory _AdvertPackage.fromJson(Map<String, dynamic> json) =
      _$_AdvertPackage.fromJson;

  @override
  int get packageType;
  @override
  double get price;
  @override
  @JsonKey(includeToJson: false)
  String? get advertId;
  @override
  int? get educationOrConsultancy;
  @override
  int? get workDurationLimit;
  @override
  int? get advertPackageChoice;
  @override
  @JsonKey(ignore: true)
  _$$_AdvertPackageCopyWith<_$_AdvertPackage> get copyWith =>
      throw _privateConstructorUsedError;
}
