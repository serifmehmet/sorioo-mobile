import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_token_result.freezed.dart';
part 'refresh_token_result.g.dart';

@freezed
class RefreshTokenResult with _$RefreshTokenResult {
  factory RefreshTokenResult({
    required String accessToken,
    required String refreshToken,
  }) = _RefreshTokenResult;

  factory RefreshTokenResult.fromJson(Map<String, dynamic> json) => _$RefreshTokenResultFromJson(
        json,
      );
}
