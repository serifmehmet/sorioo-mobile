// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_chat_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SingleChatResponseDto _$$_SingleChatResponseDtoFromJson(
        Map<String, dynamic> json) =>
    _$_SingleChatResponseDto(
      id: json['id'] as String,
      senderFullName: json['senderFullName'] as String,
      addedDate: DateTime.parse(json['addedDate'] as String),
    );

Map<String, dynamic> _$$_SingleChatResponseDtoToJson(
        _$_SingleChatResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderFullName': instance.senderFullName,
      'addedDate': instance.addedDate.toIso8601String(),
    };
