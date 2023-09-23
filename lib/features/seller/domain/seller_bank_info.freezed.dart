// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_bank_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SellerBankInfo _$SellerBankInfoFromJson(Map<String, dynamic> json) {
  return _SellerBankInfo.fromJson(json);
}

/// @nodoc
mixin _$SellerBankInfo {
  String? get id => throw _privateConstructorUsedError;
  String? get sellerId => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get bankName => throw _privateConstructorUsedError;
  String? get iban => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SellerBankInfoCopyWith<SellerBankInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellerBankInfoCopyWith<$Res> {
  factory $SellerBankInfoCopyWith(
          SellerBankInfo value, $Res Function(SellerBankInfo) then) =
      _$SellerBankInfoCopyWithImpl<$Res, SellerBankInfo>;
  @useResult
  $Res call(
      {String? id,
      String? sellerId,
      String? name,
      String? bankName,
      String? iban});
}

/// @nodoc
class _$SellerBankInfoCopyWithImpl<$Res, $Val extends SellerBankInfo>
    implements $SellerBankInfoCopyWith<$Res> {
  _$SellerBankInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? sellerId = freezed,
    Object? name = freezed,
    Object? bankName = freezed,
    Object? iban = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      sellerId: freezed == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      iban: freezed == iban
          ? _value.iban
          : iban // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SellerBankInfoCopyWith<$Res>
    implements $SellerBankInfoCopyWith<$Res> {
  factory _$$_SellerBankInfoCopyWith(
          _$_SellerBankInfo value, $Res Function(_$_SellerBankInfo) then) =
      __$$_SellerBankInfoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? sellerId,
      String? name,
      String? bankName,
      String? iban});
}

/// @nodoc
class __$$_SellerBankInfoCopyWithImpl<$Res>
    extends _$SellerBankInfoCopyWithImpl<$Res, _$_SellerBankInfo>
    implements _$$_SellerBankInfoCopyWith<$Res> {
  __$$_SellerBankInfoCopyWithImpl(
      _$_SellerBankInfo _value, $Res Function(_$_SellerBankInfo) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? sellerId = freezed,
    Object? name = freezed,
    Object? bankName = freezed,
    Object? iban = freezed,
  }) {
    return _then(_$_SellerBankInfo(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      sellerId: freezed == sellerId
          ? _value.sellerId
          : sellerId // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      iban: freezed == iban
          ? _value.iban
          : iban // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SellerBankInfo implements _SellerBankInfo {
  _$_SellerBankInfo(
      {this.id, this.sellerId, this.name, this.bankName, this.iban});

  factory _$_SellerBankInfo.fromJson(Map<String, dynamic> json) =>
      _$$_SellerBankInfoFromJson(json);

  @override
  final String? id;
  @override
  final String? sellerId;
  @override
  final String? name;
  @override
  final String? bankName;
  @override
  final String? iban;

  @override
  String toString() {
    return 'SellerBankInfo(id: $id, sellerId: $sellerId, name: $name, bankName: $bankName, iban: $iban)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SellerBankInfo &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.sellerId, sellerId) ||
                other.sellerId == sellerId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.iban, iban) || other.iban == iban));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, sellerId, name, bankName, iban);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SellerBankInfoCopyWith<_$_SellerBankInfo> get copyWith =>
      __$$_SellerBankInfoCopyWithImpl<_$_SellerBankInfo>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SellerBankInfoToJson(
      this,
    );
  }
}

abstract class _SellerBankInfo implements SellerBankInfo {
  factory _SellerBankInfo(
      {final String? id,
      final String? sellerId,
      final String? name,
      final String? bankName,
      final String? iban}) = _$_SellerBankInfo;

  factory _SellerBankInfo.fromJson(Map<String, dynamic> json) =
      _$_SellerBankInfo.fromJson;

  @override
  String? get id;
  @override
  String? get sellerId;
  @override
  String? get name;
  @override
  String? get bankName;
  @override
  String? get iban;
  @override
  @JsonKey(ignore: true)
  _$$_SellerBankInfoCopyWith<_$_SellerBankInfo> get copyWith =>
      throw _privateConstructorUsedError;
}
