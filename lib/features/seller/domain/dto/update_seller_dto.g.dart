// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_seller_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdateSellerDto _$$_UpdateSellerDtoFromJson(Map<String, dynamic> json) =>
    _$_UpdateSellerDto(
      id: json['id'] as String,
      userId: json['userId'] as String,
      fullName: json['fullName'] as String?,
      graduation: json['graduation'] as String?,
      industry: json['industry'] as String?,
      sellerBio: json['sellerBio'] as String?,
      sellerMainCategoryId: json['sellerMainCategoryId'] as String?,
      image: json['image'] == null
          ? null
          : Image.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UpdateSellerDtoToJson(_$_UpdateSellerDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'fullName': instance.fullName,
      'graduation': instance.graduation,
      'industry': instance.industry,
      'sellerBio': instance.sellerBio,
      'sellerMainCategoryId': instance.sellerMainCategoryId,
      'image': instance.image,
    };
