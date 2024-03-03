// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advert_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AdvertDetailDto _$$_AdvertDetailDtoFromJson(Map<String, dynamic> json) =>
    _$_AdvertDetailDto(
      id: json['id'] as String,
      userName: json['userName'] as String,
      title: json['title'] as String,
      details: json['details'] as String,
      needsToStart: json['needsToStart'] as String,
      advertPackages: (json['advertPackages'] as List<dynamic>)
          .map((e) =>
              AdvertDetailPackagesDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_AdvertDetailDtoToJson(_$_AdvertDetailDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'title': instance.title,
      'details': instance.details,
      'needsToStart': instance.needsToStart,
      'advertPackages': instance.advertPackages,
    };
