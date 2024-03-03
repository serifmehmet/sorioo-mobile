import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sorioo/core/constants/user_roles.dart';

part 'auth_response.freezed.dart';
part 'auth_response.g.dart';

@freezed
class AuthResponse with _$AuthResponse {
  factory AuthResponse({
    required String userId,
    required String userName,
    required String token,
    required String refreshToken,
    required String fullName,
    required String email,
    String? phoneNumber,
    @Default('') String profilePictureUrl,
    String? sellerId,
    @Default('') String about,
    @JsonKey(name: 'userRole') UserRoles? userRoles,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);
}
