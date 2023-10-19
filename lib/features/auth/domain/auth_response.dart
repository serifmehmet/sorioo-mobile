import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sorioo/core/constants/user_roles.dart';
import 'package:sorioo/features/auth/domain/user.dart';

part 'auth_response.freezed.dart';
part 'auth_response.g.dart';

@freezed
class AuthResponse with _$AuthResponse {
  factory AuthResponse({
    required String token,
    required String refreshToken,
    required User user,
    String? sellerId,
    @JsonKey(name: 'userRole') UserRoles? userRoles,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => _$AuthResponseFromJson(json);
}
