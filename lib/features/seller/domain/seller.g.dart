// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Seller _$$_SellerFromJson(Map<String, dynamic> json) => _$_Seller(
      id: json['id'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      speciality: json['speciality'] as String?,
      industry: json['industry'] as String?,
      graduation: json['graduation'] as String?,
      sellerBio: json['sellerBio'] as String?,
      sellerImage: json['sellerImage'] == null
          ? null
          : Image.fromJson(json['sellerImage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_SellerToJson(_$_Seller instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'speciality': instance.speciality,
      'industry': instance.industry,
      'graduation': instance.graduation,
      'sellerBio': instance.sellerBio,
      'sellerImage': instance.sellerImage,
    };
