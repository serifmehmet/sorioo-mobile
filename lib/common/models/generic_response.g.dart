// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GenericResponse _$$_GenericResponseFromJson(Map<String, dynamic> json) =>
    _$_GenericResponse(
      code: json['code'] as int,
      status: json['status'] as bool,
      message: json['message'] as String,
      data: json['data'],
    );

Map<String, dynamic> _$$_GenericResponseToJson(_$_GenericResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
