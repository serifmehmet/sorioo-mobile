// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_advert_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BasicAdvertItemDto _$$_BasicAdvertItemDtoFromJson(
        Map<String, dynamic> json) =>
    _$_BasicAdvertItemDto(
      id: json['id'] as String,
      title: json['title'] as String,
      categoryName: json['categoryName'] as String,
      price: (json['price'] as num).toDouble(),
      userName: json['userName'] as String,
      userProfilePicture: json['userProfilePicture'] as String,
    );

Map<String, dynamic> _$$_BasicAdvertItemDtoToJson(
        _$_BasicAdvertItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'categoryName': instance.categoryName,
      'price': instance.price,
      'userName': instance.userName,
      'userProfilePicture': instance.userProfilePicture,
    };
