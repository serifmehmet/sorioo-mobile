// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_advert_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateAdvertDto _$CreateAdvertDtoFromJson(Map<String, dynamic> json) {
  return _CreateAdvertDto.fromJson(json);
}

/// @nodoc
mixin _$CreateAdvertDto {
  Advert get advert => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateAdvertDtoCopyWith<CreateAdvertDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateAdvertDtoCopyWith<$Res> {
  factory $CreateAdvertDtoCopyWith(
          CreateAdvertDto value, $Res Function(CreateAdvertDto) then) =
      _$CreateAdvertDtoCopyWithImpl<$Res, CreateAdvertDto>;
  @useResult
  $Res call({Advert advert});

  $AdvertCopyWith<$Res> get advert;
}

/// @nodoc
class _$CreateAdvertDtoCopyWithImpl<$Res, $Val extends CreateAdvertDto>
    implements $CreateAdvertDtoCopyWith<$Res> {
  _$CreateAdvertDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? advert = null,
  }) {
    return _then(_value.copyWith(
      advert: null == advert
          ? _value.advert
          : advert // ignore: cast_nullable_to_non_nullable
              as Advert,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AdvertCopyWith<$Res> get advert {
    return $AdvertCopyWith<$Res>(_value.advert, (value) {
      return _then(_value.copyWith(advert: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CreateAdvertDtoCopyWith<$Res>
    implements $CreateAdvertDtoCopyWith<$Res> {
  factory _$$_CreateAdvertDtoCopyWith(
          _$_CreateAdvertDto value, $Res Function(_$_CreateAdvertDto) then) =
      __$$_CreateAdvertDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Advert advert});

  @override
  $AdvertCopyWith<$Res> get advert;
}

/// @nodoc
class __$$_CreateAdvertDtoCopyWithImpl<$Res>
    extends _$CreateAdvertDtoCopyWithImpl<$Res, _$_CreateAdvertDto>
    implements _$$_CreateAdvertDtoCopyWith<$Res> {
  __$$_CreateAdvertDtoCopyWithImpl(
      _$_CreateAdvertDto _value, $Res Function(_$_CreateAdvertDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? advert = null,
  }) {
    return _then(_$_CreateAdvertDto(
      advert: null == advert
          ? _value.advert
          : advert // ignore: cast_nullable_to_non_nullable
              as Advert,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreateAdvertDto implements _CreateAdvertDto {
  _$_CreateAdvertDto({required this.advert});

  factory _$_CreateAdvertDto.fromJson(Map<String, dynamic> json) =>
      _$$_CreateAdvertDtoFromJson(json);

  @override
  final Advert advert;

  @override
  String toString() {
    return 'CreateAdvertDto(advert: $advert)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateAdvertDto &&
            (identical(other.advert, advert) || other.advert == advert));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, advert);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateAdvertDtoCopyWith<_$_CreateAdvertDto> get copyWith =>
      __$$_CreateAdvertDtoCopyWithImpl<_$_CreateAdvertDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateAdvertDtoToJson(
      this,
    );
  }
}

abstract class _CreateAdvertDto implements CreateAdvertDto {
  factory _CreateAdvertDto({required final Advert advert}) = _$_CreateAdvertDto;

  factory _CreateAdvertDto.fromJson(Map<String, dynamic> json) =
      _$_CreateAdvertDto.fromJson;

  @override
  Advert get advert;
  @override
  @JsonKey(ignore: true)
  _$$_CreateAdvertDtoCopyWith<_$_CreateAdvertDto> get copyWith =>
      throw _privateConstructorUsedError;
}
