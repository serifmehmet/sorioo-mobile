// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advert_package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AdvertPackage _$$_AdvertPackageFromJson(Map<String, dynamic> json) =>
    _$_AdvertPackage(
      name: json['name'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$_AdvertPackageToJson(_$_AdvertPackage instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
    };
