// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_buyer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UpdateBuyerDto _$$_UpdateBuyerDtoFromJson(Map<String, dynamic> json) =>
    _$_UpdateBuyerDto(
      id: json['id'] as String,
      fullName: json['fullName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      about: json['about'] as String?,
      image: json['image'] == null
          ? null
          : Image.fromJson(json['image'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UpdateBuyerDtoToJson(_$_UpdateBuyerDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'about': instance.about,
      'image': instance.image,
    };
