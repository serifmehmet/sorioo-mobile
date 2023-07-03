// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Category _$$_CategoryFromJson(Map<String, dynamic> json) => _$_Category(
      id: json['id'] as String,
      name: json['name'] as String,
      status: json['status'] as int,
      catColor: json['catColor'] as String?,
      categoryImage: json['categoryImage'] == null
          ? null
          : Image.fromJson(json['categoryImage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_CategoryToJson(_$_Category instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'catColor': instance.catColor,
      'categoryImage': instance.categoryImage,
    };
