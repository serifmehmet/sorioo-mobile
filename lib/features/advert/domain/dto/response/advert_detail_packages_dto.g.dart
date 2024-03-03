// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advert_detail_packages_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AdvertDetailPackagesDto _$$_AdvertDetailPackagesDtoFromJson(
        Map<String, dynamic> json) =>
    _$_AdvertDetailPackagesDto(
      price: (json['price'] as num).toDouble(),
      packageType: json['packageType'] as int?,
      educationOrConsultancy: json['educationOrConsultancy'] as int?,
      workDurationLimit: json['workDurationLimit'] as int?,
      advertPackageChoice: json['advertPackageChoice'] as int?,
    );

Map<String, dynamic> _$$_AdvertDetailPackagesDtoToJson(
        _$_AdvertDetailPackagesDto instance) =>
    <String, dynamic>{
      'price': instance.price,
      'packageType': instance.packageType,
      'educationOrConsultancy': instance.educationOrConsultancy,
      'workDurationLimit': instance.workDurationLimit,
      'advertPackageChoice': instance.advertPackageChoice,
    };
