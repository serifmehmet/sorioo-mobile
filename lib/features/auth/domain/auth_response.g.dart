// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthResponse _$$_AuthResponseFromJson(Map<String, dynamic> json) =>
    _$_AuthResponse(
      token: json['token'] as String,
      refreshToken: json['refreshToken'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      userRoles: $enumDecodeNullable(_$UserRolesEnumMap, json['userRole']),
    );

Map<String, dynamic> _$$_AuthResponseToJson(_$_AuthResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'user': instance.user,
      'userRole': _$UserRolesEnumMap[instance.userRoles],
    };

const _$UserRolesEnumMap = {
  UserRoles.buyer: 'BUYER',
  UserRoles.seller: 'SELLER',
};
