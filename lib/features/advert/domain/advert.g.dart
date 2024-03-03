// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'advert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Advert _$$_AdvertFromJson(Map<String, dynamic> json) => _$_Advert(
      advertMainCategoryId: json['advertMainCategoryId'] as String,
      advertSubCategoryId: json['advertSubCategoryId'] as String,
      title: json['title'] as String,
      details: json['details'] as String,
      needsToStart: json['needsToStart'] as String,
      sellerId: json['sellerId'] as String,
      categoryName: json['categoryName'] as String?,
      subCategoryName: json['subCategoryName'] as String?,
      advertPackages: (json['advertPackages'] as List<dynamic>?)
          ?.map((e) => AdvertPackage.fromJson(e as Map<String, dynamic>))
          .toList(),
      isValidated: json['isValidated'] as bool?,
    );

Map<String, dynamic> _$$_AdvertToJson(_$_Advert instance) => <String, dynamic>{
      'advertMainCategoryId': instance.advertMainCategoryId,
      'advertSubCategoryId': instance.advertSubCategoryId,
      'title': instance.title,
      'details': instance.details,
      'needsToStart': instance.needsToStart,
      'sellerId': instance.sellerId,
      'categoryName': instance.categoryName,
      'subCategoryName': instance.subCategoryName,
      'advertPackages': instance.advertPackages,
      'isValidated': instance.isValidated,
    };
