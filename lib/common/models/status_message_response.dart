import 'package:freezed_annotation/freezed_annotation.dart';

part 'status_message_response.freezed.dart';

part 'status_message_response.g.dart';

@freezed
class StatusMessageResponse with _$StatusMessageResponse {
  factory StatusMessageResponse({
    required String message,
  }) = _StatusMessageResponse;

  factory StatusMessageResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$StatusMessageResponseFromJson(json);
}
