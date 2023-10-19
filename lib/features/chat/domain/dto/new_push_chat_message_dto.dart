import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_push_chat_message_dto.freezed.dart';
part 'new_push_chat_message_dto.g.dart';

@freezed
class NewPushChatMessageDto with _$NewPushChatMessageDto {
  factory NewPushChatMessageDto({
    required String message,
    String? clientId,
  }) = _NewPushChatMessageDto;

  factory NewPushChatMessageDto.fromJson(Map<String, dynamic> json) => _$NewPushChatMessageDtoFromJson(json);
}
