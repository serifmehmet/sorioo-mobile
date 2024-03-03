// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advert_package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AdvertPackage _$$_AdvertPackageFromJson(Map<String, dynamic> json) =>
    _$_AdvertPackage(
      packageType: json['packageType'] as int,
      price: (json['price'] as num).toDouble(),
      advertId: json['advertId'] as String?,
      educationOrConsultancy: json['educationOrConsultancy'] as int?,
      workDurationLimit: json['workDurationLimit'] as int?,
      advertPackageChoice: json['advertPackageChoice'] as int?,
    );

Map<String, dynamic> _$$_AdvertPackageToJson(_$_AdvertPackage instance) =>
    <String, dynamic>{
      'packageType': instance.packageType,
      'price': instance.price,
      'educationOrConsultancy': instance.educationOrConsultancy,
      'workDurationLimit': instance.workDurationLimit,
      'advertPackageChoice': instance.advertPackageChoice,
    };
