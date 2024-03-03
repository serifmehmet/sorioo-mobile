// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'advert_detail_packages_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AdvertDetailPackagesDto _$AdvertDetailPackagesDtoFromJson(
    Map<String, dynamic> json) {
  return _AdvertDetailPackagesDto.fromJson(json);
}

/// @nodoc
mixin _$AdvertDetailPackagesDto {
  double get price => throw _privateConstructorUsedError;
  int? get packageType => throw _privateConstructorUsedError;
  int? get educationOrConsultancy => throw _privateConstructorUsedError;
  int? get workDurationLimit => throw _privateConstructorUsedError;
  int? get advertPackageChoice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdvertDetailPackagesDtoCopyWith<AdvertDetailPackagesDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdvertDetailPackagesDtoCopyWith<$Res> {
  factory $AdvertDetailPackagesDtoCopyWith(AdvertDetailPackagesDto value,
          $Res Function(AdvertDetailPackagesDto) then) =
      _$AdvertDetailPackagesDtoCopyWithImpl<$Res, AdvertDetailPackagesDto>;
  @useResult
  $Res call(
      {double price,
      int? packageType,
      int? educationOrConsultancy,
      int? workDurationLimit,
      int? advertPackageChoice});
}

/// @nodoc
class _$AdvertDetailPackagesDtoCopyWithImpl<$Res,
        $Val extends AdvertDetailPackagesDto>
    implements $AdvertDetailPackagesDtoCopyWith<$Res> {
  _$AdvertDetailPackagesDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? packageType = freezed,
    Object? educationOrConsultancy = freezed,
    Object? workDurationLimit = freezed,
    Object? advertPackageChoice = freezed,
  }) {
    return _then(_value.copyWith(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      packageType: freezed == packageType
          ? _value.packageType
          : packageType // ignore: cast_nullable_to_non_nullable
              as int?,
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
abstract class _$$_AdvertDetailPackagesDtoCopyWith<$Res>
    implements $AdvertDetailPackagesDtoCopyWith<$Res> {
  factory _$$_AdvertDetailPackagesDtoCopyWith(_$_AdvertDetailPackagesDto value,
          $Res Function(_$_AdvertDetailPackagesDto) then) =
      __$$_AdvertDetailPackagesDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double price,
      int? packageType,
      int? educationOrConsultancy,
      int? workDurationLimit,
      int? advertPackageChoice});
}

/// @nodoc
class __$$_AdvertDetailPackagesDtoCopyWithImpl<$Res>
    extends _$AdvertDetailPackagesDtoCopyWithImpl<$Res,
        _$_AdvertDetailPackagesDto>
    implements _$$_AdvertDetailPackagesDtoCopyWith<$Res> {
  __$$_AdvertDetailPackagesDtoCopyWithImpl(_$_AdvertDetailPackagesDto _value,
      $Res Function(_$_AdvertDetailPackagesDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? packageType = freezed,
    Object? educationOrConsultancy = freezed,
    Object? workDurationLimit = freezed,
    Object? advertPackageChoice = freezed,
  }) {
    return _then(_$_AdvertDetailPackagesDto(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      packageType: freezed == packageType
          ? _value.packageType
          : packageType // ignore: cast_nullable_to_non_nullable
              as int?,
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
class _$_AdvertDetailPackagesDto implements _AdvertDetailPackagesDto {
  _$_AdvertDetailPackagesDto(
      {required this.price,
      this.packageType,
      this.educationOrConsultancy,
      this.workDurationLimit,
      this.advertPackageChoice});

  factory _$_AdvertDetailPackagesDto.fromJson(Map<String, dynamic> json) =>
      _$$_AdvertDetailPackagesDtoFromJson(json);

  @override
  final double price;
  @override
  final int? packageType;
  @override
  final int? educationOrConsultancy;
  @override
  final int? workDurationLimit;
  @override
  final int? advertPackageChoice;

  @override
  String toString() {
    return 'AdvertDetailPackagesDto(price: $price, packageType: $packageType, educationOrConsultancy: $educationOrConsultancy, workDurationLimit: $workDurationLimit, advertPackageChoice: $advertPackageChoice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdvertDetailPackagesDto &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.packageType, packageType) ||
                other.packageType == packageType) &&
            (identical(other.educationOrConsultancy, educationOrConsultancy) ||
                other.educationOrConsultancy == educationOrConsultancy) &&
            (identical(other.workDurationLimit, workDurationLimit) ||
                other.workDurationLimit == workDurationLimit) &&
            (identical(other.advertPackageChoice, advertPackageChoice) ||
                other.advertPackageChoice == advertPackageChoice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, price, packageType,
      educationOrConsultancy, workDurationLimit, advertPackageChoice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdvertDetailPackagesDtoCopyWith<_$_AdvertDetailPackagesDto>
      get copyWith =>
          __$$_AdvertDetailPackagesDtoCopyWithImpl<_$_AdvertDetailPackagesDto>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdvertDetailPackagesDtoToJson(
      this,
    );
  }
}

abstract class _AdvertDetailPackagesDto implements AdvertDetailPackagesDto {
  factory _AdvertDetailPackagesDto(
      {required final double price,
      final int? packageType,
      final int? educationOrConsultancy,
      final int? workDurationLimit,
      final int? advertPackageChoice}) = _$_AdvertDetailPackagesDto;

  factory _AdvertDetailPackagesDto.fromJson(Map<String, dynamic> json) =
      _$_AdvertDetailPackagesDto.fromJson;

  @override
  double get price;
  @override
  int? get packageType;
  @override
  int? get educationOrConsultancy;
  @override
  int? get workDurationLimit;
  @override
  int? get advertPackageChoice;
  @override
  @JsonKey(ignore: true)
  _$$_AdvertDetailPackagesDtoCopyWith<_$_AdvertDetailPackagesDto>
      get copyWith => throw _privateConstructorUsedError;
}
