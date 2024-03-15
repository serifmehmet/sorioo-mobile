// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advert_detail_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AdvertDetailDto _$$_AdvertDetailDtoFromJson(Map<String, dynamic> json) =>
    _$_AdvertDetailDto(
      id: json['id'] as String,
      advertPackages: (json['advertPackages'] as List<dynamic>)
          .map((e) =>
              AdvertDetailPackagesDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String?,
      details: json['details'] as String?,
      needsToStart: json['needsToStart'] as String?,
      userName: json['userName'] as String?,
    );

Map<String, dynamic> _$$_AdvertDetailDtoToJson(_$_AdvertDetailDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'advertPackages': instance.advertPackages,
      'title': instance.title,
      'details': instance.details,
      'needsToStart': instance.needsToStart,
      'userName': instance.userName,
    };
