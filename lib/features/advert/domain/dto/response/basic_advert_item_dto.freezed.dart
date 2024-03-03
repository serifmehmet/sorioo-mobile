// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basic_advert_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BasicAdvertItemDto _$BasicAdvertItemDtoFromJson(Map<String, dynamic> json) {
  return _BasicAdvertItemDto.fromJson(json);
}

/// @nodoc
mixin _$BasicAdvertItemDto {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get categoryName => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BasicAdvertItemDtoCopyWith<BasicAdvertItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasicAdvertItemDtoCopyWith<$Res> {
  factory $BasicAdvertItemDtoCopyWith(
          BasicAdvertItemDto value, $Res Function(BasicAdvertItemDto) then) =
      _$BasicAdvertItemDtoCopyWithImpl<$Res, BasicAdvertItemDto>;
  @useResult
  $Res call({String id, String title, String categoryName, double price});
}

/// @nodoc
class _$BasicAdvertItemDtoCopyWithImpl<$Res, $Val extends BasicAdvertItemDto>
    implements $BasicAdvertItemDtoCopyWith<$Res> {
  _$BasicAdvertItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? categoryName = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BasicAdvertItemDtoCopyWith<$Res>
    implements $BasicAdvertItemDtoCopyWith<$Res> {
  factory _$$_BasicAdvertItemDtoCopyWith(_$_BasicAdvertItemDto value,
          $Res Function(_$_BasicAdvertItemDto) then) =
      __$$_BasicAdvertItemDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String title, String categoryName, double price});
}

/// @nodoc
class __$$_BasicAdvertItemDtoCopyWithImpl<$Res>
    extends _$BasicAdvertItemDtoCopyWithImpl<$Res, _$_BasicAdvertItemDto>
    implements _$$_BasicAdvertItemDtoCopyWith<$Res> {
  __$$_BasicAdvertItemDtoCopyWithImpl(
      _$_BasicAdvertItemDto _value, $Res Function(_$_BasicAdvertItemDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? categoryName = null,
    Object? price = null,
  }) {
    return _then(_$_BasicAdvertItemDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
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
class _$_BasicAdvertItemDto implements _BasicAdvertItemDto {
  _$_BasicAdvertItemDto(
      {required this.id,
      required this.title,
      required this.categoryName,
      required this.price});

  factory _$_BasicAdvertItemDto.fromJson(Map<String, dynamic> json) =>
      _$$_BasicAdvertItemDtoFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String categoryName;
  @override
  final double price;

  @override
  String toString() {
    return 'BasicAdvertItemDto(id: $id, title: $title, categoryName: $categoryName, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BasicAdvertItemDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, categoryName, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BasicAdvertItemDtoCopyWith<_$_BasicAdvertItemDto> get copyWith =>
      __$$_BasicAdvertItemDtoCopyWithImpl<_$_BasicAdvertItemDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BasicAdvertItemDtoToJson(
      this,
    );
  }
}

abstract class _BasicAdvertItemDto implements BasicAdvertItemDto {
  factory _BasicAdvertItemDto(
      {required final String id,
      required final String title,
      required final String categoryName,
      required final double price}) = _$_BasicAdvertItemDto;

  factory _BasicAdvertItemDto.fromJson(Map<String, dynamic> json) =
      _$_BasicAdvertItemDto.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get categoryName;
  @override
  double get price;
  @override
  @JsonKey(ignore: true)
  _$$_BasicAdvertItemDtoCopyWith<_$_BasicAdvertItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}
