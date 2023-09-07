// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'refresh_token_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RefreshTokenResult _$RefreshTokenResultFromJson(Map<String, dynamic> json) {
  return _RefreshTokenResult.fromJson(json);
}

/// @nodoc
mixin _$RefreshTokenResult {
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RefreshTokenResultCopyWith<RefreshTokenResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RefreshTokenResultCopyWith<$Res> {
  factory $RefreshTokenResultCopyWith(
          RefreshTokenResult value, $Res Function(RefreshTokenResult) then) =
      _$RefreshTokenResultCopyWithImpl<$Res, RefreshTokenResult>;
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class _$RefreshTokenResultCopyWithImpl<$Res, $Val extends RefreshTokenResult>
    implements $RefreshTokenResultCopyWith<$Res> {
  _$RefreshTokenResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RefreshTokenResultCopyWith<$Res>
    implements $RefreshTokenResultCopyWith<$Res> {
  factory _$$_RefreshTokenResultCopyWith(_$_RefreshTokenResult value,
          $Res Function(_$_RefreshTokenResult) then) =
      __$$_RefreshTokenResultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken, String refreshToken});
}

/// @nodoc
class __$$_RefreshTokenResultCopyWithImpl<$Res>
    extends _$RefreshTokenResultCopyWithImpl<$Res, _$_RefreshTokenResult>
    implements _$$_RefreshTokenResultCopyWith<$Res> {
  __$$_RefreshTokenResultCopyWithImpl(
      _$_RefreshTokenResult _value, $Res Function(_$_RefreshTokenResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
  }) {
    return _then(_$_RefreshTokenResult(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RefreshTokenResult implements _RefreshTokenResult {
  _$_RefreshTokenResult(
      {required this.accessToken, required this.refreshToken});

  factory _$_RefreshTokenResult.fromJson(Map<String, dynamic> json) =>
      _$$_RefreshTokenResultFromJson(json);

  @override
  final String accessToken;
  @override
  final String refreshToken;

  @override
  String toString() {
    return 'RefreshTokenResult(accessToken: $accessToken, refreshToken: $refreshToken)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RefreshTokenResult &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RefreshTokenResultCopyWith<_$_RefreshTokenResult> get copyWith =>
      __$$_RefreshTokenResultCopyWithImpl<_$_RefreshTokenResult>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RefreshTokenResultToJson(
      this,
    );
  }
}

abstract class _RefreshTokenResult implements RefreshTokenResult {
  factory _RefreshTokenResult(
      {required final String accessToken,
      required final String refreshToken}) = _$_RefreshTokenResult;

  factory _RefreshTokenResult.fromJson(Map<String, dynamic> json) =
      _$_RefreshTokenResult.fromJson;

  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  @JsonKey(ignore: true)
  _$$_RefreshTokenResultCopyWith<_$_RefreshTokenResult> get copyWith =>
      throw _privateConstructorUsedError;
}
