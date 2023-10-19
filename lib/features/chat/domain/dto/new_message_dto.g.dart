// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_NewMessageDto _$$_NewMessageDtoFromJson(Map<String, dynamic> json) =>
    _$_NewMessageDto(
      clientId: json['clientId'] as String?,
      textMessage: json['textMessage'] as String?,
      dateTime: json['dateTime'] as String?,
    );

Map<String, dynamic> _$$_NewMessageDtoToJson(_$_NewMessageDto instance) =>
    <String, dynamic>{
      'clientId': instance.clientId,
      'textMessage': instance.textMessage,
      'dateTime': instance.dateTime,
    };
