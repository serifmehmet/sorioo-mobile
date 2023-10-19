import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_message_dto.freezed.dart';
part 'new_message_dto.g.dart';

@freezed
class NewMessageDto with _$NewMessageDto {
  factory NewMessageDto({
    String? clientId,
    String? textMessage,
    String? dateTime,
  }) = _NewMessageDto;

  factory NewMessageDto.fromJson(Map<String, dynamic> json) => _$NewMessageDtoFromJson(json);
}
