// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_seller_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SingleSellerResponseDto _$$_SingleSellerResponseDtoFromJson(
        Map<String, dynamic> json) =>
    _$_SingleSellerResponseDto(
      id: json['id'] as String?,
      sellerGoogleImageUrl: json['sellerGoogleImageUrl'] as String? ?? '',
      sellerFullName: json['sellerFullName'] as String? ?? '',
      speciality: json['speciality'] as String? ?? '',
      industry: json['industry'] as String? ?? '',
      graduation: json['graduation'] as String? ?? '',
      sellerImagePath: json['sellerImagePath'] as String? ?? '',
      sellerCategory: json['sellerCategory'] == null
          ? null
          : Category.fromJson(json['sellerCategory'] as Map<String, dynamic>),
      sellerBio: json['sellerBio'] as String? ?? '',
    );

Map<String, dynamic> _$$_SingleSellerResponseDtoToJson(
        _$_SingleSellerResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sellerGoogleImageUrl': instance.sellerGoogleImageUrl,
      'sellerFullName': instance.sellerFullName,
      'speciality': instance.speciality,
      'industry': instance.industry,
      'graduation': instance.graduation,
      'sellerImagePath': instance.sellerImagePath,
      'sellerCategory': instance.sellerCategory,
      'sellerBio': instance.sellerBio,
    };
