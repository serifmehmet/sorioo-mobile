// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'advert_detail_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AdvertDetailDto _$AdvertDetailDtoFromJson(Map<String, dynamic> json) {
  return _AdvertDetailDto.fromJson(json);
}

/// @nodoc
mixin _$AdvertDetailDto {
  String get id => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get details => throw _privateConstructorUsedError;
  String get needsToStart => throw _privateConstructorUsedError;
  List<AdvertDetailPackagesDto> get advertPackages =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AdvertDetailDtoCopyWith<AdvertDetailDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdvertDetailDtoCopyWith<$Res> {
  factory $AdvertDetailDtoCopyWith(
          AdvertDetailDto value, $Res Function(AdvertDetailDto) then) =
      _$AdvertDetailDtoCopyWithImpl<$Res, AdvertDetailDto>;
  @useResult
  $Res call(
      {String id,
      String userName,
      String title,
      String details,
      String needsToStart,
      List<AdvertDetailPackagesDto> advertPackages});
}

/// @nodoc
class _$AdvertDetailDtoCopyWithImpl<$Res, $Val extends AdvertDetailDto>
    implements $AdvertDetailDtoCopyWith<$Res> {
  _$AdvertDetailDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userName = null,
    Object? title = null,
    Object? details = null,
    Object? needsToStart = null,
    Object? advertPackages = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      needsToStart: null == needsToStart
          ? _value.needsToStart
          : needsToStart // ignore: cast_nullable_to_non_nullable
              as String,
      advertPackages: null == advertPackages
          ? _value.advertPackages
          : advertPackages // ignore: cast_nullable_to_non_nullable
              as List<AdvertDetailPackagesDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AdvertDetailDtoCopyWith<$Res>
    implements $AdvertDetailDtoCopyWith<$Res> {
  factory _$$_AdvertDetailDtoCopyWith(
          _$_AdvertDetailDto value, $Res Function(_$_AdvertDetailDto) then) =
      __$$_AdvertDetailDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userName,
      String title,
      String details,
      String needsToStart,
      List<AdvertDetailPackagesDto> advertPackages});
}

/// @nodoc
class __$$_AdvertDetailDtoCopyWithImpl<$Res>
    extends _$AdvertDetailDtoCopyWithImpl<$Res, _$_AdvertDetailDto>
    implements _$$_AdvertDetailDtoCopyWith<$Res> {
  __$$_AdvertDetailDtoCopyWithImpl(
      _$_AdvertDetailDto _value, $Res Function(_$_AdvertDetailDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userName = null,
    Object? title = null,
    Object? details = null,
    Object? needsToStart = null,
    Object? advertPackages = null,
  }) {
    return _then(_$_AdvertDetailDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      needsToStart: null == needsToStart
          ? _value.needsToStart
          : needsToStart // ignore: cast_nullable_to_non_nullable
              as String,
      advertPackages: null == advertPackages
          ? _value._advertPackages
          : advertPackages // ignore: cast_nullable_to_non_nullable
              as List<AdvertDetailPackagesDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AdvertDetailDto implements _AdvertDetailDto {
  _$_AdvertDetailDto(
      {required this.id,
      required this.userName,
      required this.title,
      required this.details,
      required this.needsToStart,
      required final List<AdvertDetailPackagesDto> advertPackages})
      : _advertPackages = advertPackages;

  factory _$_AdvertDetailDto.fromJson(Map<String, dynamic> json) =>
      _$$_AdvertDetailDtoFromJson(json);

  @override
  final String id;
  @override
  final String userName;
  @override
  final String title;
  @override
  final String details;
  @override
  final String needsToStart;
  final List<AdvertDetailPackagesDto> _advertPackages;
  @override
  List<AdvertDetailPackagesDto> get advertPackages {
    if (_advertPackages is EqualUnmodifiableListView) return _advertPackages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_advertPackages);
  }

  @override
  String toString() {
    return 'AdvertDetailDto(id: $id, userName: $userName, title: $title, details: $details, needsToStart: $needsToStart, advertPackages: $advertPackages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdvertDetailDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.needsToStart, needsToStart) ||
                other.needsToStart == needsToStart) &&
            const DeepCollectionEquality()
                .equals(other._advertPackages, _advertPackages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userName, title, details,
      needsToStart, const DeepCollectionEquality().hash(_advertPackages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdvertDetailDtoCopyWith<_$_AdvertDetailDto> get copyWith =>
      __$$_AdvertDetailDtoCopyWithImpl<_$_AdvertDetailDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AdvertDetailDtoToJson(
      this,
    );
  }
}

abstract class _AdvertDetailDto implements AdvertDetailDto {
  factory _AdvertDetailDto(
          {required final String id,
          required final String userName,
          required final String title,
          required final String details,
          required final String needsToStart,
          required final List<AdvertDetailPackagesDto> advertPackages}) =
      _$_AdvertDetailDto;

  factory _AdvertDetailDto.fromJson(Map<String, dynamic> json) =
      _$_AdvertDetailDto.fromJson;

  @override
  String get id;
  @override
  String get userName;
  @override
  String get title;
  @override
  String get details;
  @override
  String get needsToStart;
  @override
  List<AdvertDetailPackagesDto> get advertPackages;
  @override
  @JsonKey(ignore: true)
  _$$_AdvertDetailDtoCopyWith<_$_AdvertDetailDto> get copyWith =>
      throw _privateConstructorUsedError;
}
