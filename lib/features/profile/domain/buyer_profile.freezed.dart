// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'buyer_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BuyerProfile _$BuyerProfileFromJson(Map<String, dynamic> json) {
  return _BuyerProfile.fromJson(json);
}

/// @nodoc
mixin _$BuyerProfile {
  String get fullName => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  String get about => throw _privateConstructorUsedError;
  String get profilePictureUrl => throw _privateConstructorUsedError;
  Image? get userProfileImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BuyerProfileCopyWith<BuyerProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuyerProfileCopyWith<$Res> {
  factory $BuyerProfileCopyWith(
          BuyerProfile value, $Res Function(BuyerProfile) then) =
      _$BuyerProfileCopyWithImpl<$Res, BuyerProfile>;
  @useResult
  $Res call(
      {String fullName,
      String phoneNumber,
      String about,
      String profilePictureUrl,
      Image? userProfileImage});

  $ImageCopyWith<$Res>? get userProfileImage;
}

/// @nodoc
class _$BuyerProfileCopyWithImpl<$Res, $Val extends BuyerProfile>
    implements $BuyerProfileCopyWith<$Res> {
  _$BuyerProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? phoneNumber = null,
    Object? about = null,
    Object? profilePictureUrl = null,
    Object? userProfileImage = freezed,
  }) {
    return _then(_value.copyWith(
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      profilePictureUrl: null == profilePictureUrl
          ? _value.profilePictureUrl
          : profilePictureUrl // ignore: cast_nullable_to_non_nullable
              as String,
      userProfileImage: freezed == userProfileImage
          ? _value.userProfileImage
          : userProfileImage // ignore: cast_nullable_to_non_nullable
              as Image?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageCopyWith<$Res>? get userProfileImage {
    if (_value.userProfileImage == null) {
      return null;
    }

    return $ImageCopyWith<$Res>(_value.userProfileImage!, (value) {
      return _then(_value.copyWith(userProfileImage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BuyerProfileCopyWith<$Res>
    implements $BuyerProfileCopyWith<$Res> {
  factory _$$_BuyerProfileCopyWith(
          _$_BuyerProfile value, $Res Function(_$_BuyerProfile) then) =
      __$$_BuyerProfileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String fullName,
      String phoneNumber,
      String about,
      String profilePictureUrl,
      Image? userProfileImage});

  @override
  $ImageCopyWith<$Res>? get userProfileImage;
}

/// @nodoc
class __$$_BuyerProfileCopyWithImpl<$Res>
    extends _$BuyerProfileCopyWithImpl<$Res, _$_BuyerProfile>
    implements _$$_BuyerProfileCopyWith<$Res> {
  __$$_BuyerProfileCopyWithImpl(
      _$_BuyerProfile _value, $Res Function(_$_BuyerProfile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullName = null,
    Object? phoneNumber = null,
    Object? about = null,
    Object? profilePictureUrl = null,
    Object? userProfileImage = freezed,
  }) {
    return _then(_$_BuyerProfile(
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      about: null == about
          ? _value.about
          : about // ignore: cast_nullable_to_non_nullable
              as String,
      profilePictureUrl: null == profilePictureUrl
          ? _value.profilePictureUrl
          : profilePictureUrl // ignore: cast_nullable_to_non_nullable
              as String,
      userProfileImage: freezed == userProfileImage
          ? _value.userProfileImage
          : userProfileImage // ignore: cast_nullable_to_non_nullable
              as Image?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BuyerProfile implements _BuyerProfile {
  _$_BuyerProfile(
      {required this.fullName,
      this.phoneNumber = '',
      this.about = '',
      this.profilePictureUrl = '',
      this.userProfileImage});

  factory _$_BuyerProfile.fromJson(Map<String, dynamic> json) =>
      _$$_BuyerProfileFromJson(json);

  @override
  final String fullName;
  @override
  @JsonKey()
  final String phoneNumber;
  @override
  @JsonKey()
  final String about;
  @override
  @JsonKey()
  final String profilePictureUrl;
  @override
  final Image? userProfileImage;

  @override
  String toString() {
    return 'BuyerProfile(fullName: $fullName, phoneNumber: $phoneNumber, about: $about, profilePictureUrl: $profilePictureUrl, userProfileImage: $userProfileImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BuyerProfile &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.about, about) || other.about == about) &&
            (identical(other.profilePictureUrl, profilePictureUrl) ||
                other.profilePictureUrl == profilePictureUrl) &&
            (identical(other.userProfileImage, userProfileImage) ||
                other.userProfileImage == userProfileImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, fullName, phoneNumber, about,
      profilePictureUrl, userProfileImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BuyerProfileCopyWith<_$_BuyerProfile> get copyWith =>
      __$$_BuyerProfileCopyWithImpl<_$_BuyerProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BuyerProfileToJson(
      this,
    );
  }
}

abstract class _BuyerProfile implements BuyerProfile {
  factory _BuyerProfile(
      {required final String fullName,
      final String phoneNumber,
      final String about,
      final String profilePictureUrl,
      final Image? userProfileImage}) = _$_BuyerProfile;

  factory _BuyerProfile.fromJson(Map<String, dynamic> json) =
      _$_BuyerProfile.fromJson;

  @override
  String get fullName;
  @override
  String get phoneNumber;
  @override
  String get about;
  @override
  String get profilePictureUrl;
  @override
  Image? get userProfileImage;
  @override
  @JsonKey(ignore: true)
  _$$_BuyerProfileCopyWith<_$_BuyerProfile> get copyWith =>
      throw _privateConstructorUsedError;
}
