import 'package:freezed_annotation/freezed_annotation.dart';

part 'single_chat_response_dto.freezed.dart';
part 'single_chat_response_dto.g.dart';

@freezed
class SingleChatResponseDto with _$SingleChatResponseDto {
  factory SingleChatResponseDto({
    required String id,
    required String senderFullName,
    required DateTime addedDate,
  }) = _SingleChatResponseDto;

  factory SingleChatResponseDto.fromJson(Map<String, dynamic> json) => _$SingleChatResponseDtoFromJson(json);
}

List<SingleChatResponseDto> singleChatResponseListFromJson(List<dynamic> data) => List<SingleChatResponseDto>.from(
      data.map(
        (s) => SingleChatResponseDto.fromJson(s as Map<String, dynamic>),
      ),
    );
