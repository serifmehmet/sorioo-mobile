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
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

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
  $Res call({String name, String description, double price});
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
    Object? name = null,
    Object? description = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
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
  $Res call({String name, String description, double price});
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
    Object? name = null,
    Object? description = null,
    Object? price = null,
  }) {
    return _then(_$_AdvertPackage(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AdvertPackage implements _AdvertPackage {
  _$_AdvertPackage(
      {required this.name, required this.description, required this.price});

  factory _$_AdvertPackage.fromJson(Map<String, dynamic> json) =>
      _$$_AdvertPackageFromJson(json);

  @override
  final String name;
  @override
  final String description;
  @override
  final double price;

  @override
  String toString() {
    return 'AdvertPackage(name: $name, description: $description, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdvertPackage &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, description, price);

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
      {required final String name,
      required final String description,
      required final double price}) = _$_AdvertPackage;

  factory _AdvertPackage.fromJson(Map<String, dynamic> json) =
      _$_AdvertPackage.fromJson;

  @override
  String get name;
  @override
  String get description;
  @override
  double get price;
  @override
  @JsonKey(ignore: true)
  _$$_AdvertPackageCopyWith<_$_AdvertPackage> get copyWith =>
      throw _privateConstructorUsedError;
}
