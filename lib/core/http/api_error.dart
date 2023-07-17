import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error.freezed.dart';

part 'api_error.g.dart';

@freezed
class ApiError with _$ApiError {
  factory ApiError({
    required int? code,
    required String message,
  }) = _ApiError;

  factory ApiError.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$ApiErrorFromJson(json);

  factory ApiError.empty() => ApiError(code: 0, message: '');
}
