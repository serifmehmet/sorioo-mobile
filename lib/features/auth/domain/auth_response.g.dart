// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AuthResponse _$$_AuthResponseFromJson(Map<String, dynamic> json) =>
    _$_AuthResponse(
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      token: json['token'] as String,
      refreshToken: json['refreshToken'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      profilePictureUrl: json['profilePictureUrl'] as String? ?? '',
      sellerId: json['sellerId'] as String?,
      about: json['about'] as String? ?? '',
      userRoles: $enumDecodeNullable(_$UserRolesEnumMap, json['userRole']),
    );

Map<String, dynamic> _$$_AuthResponseToJson(_$_AuthResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'fullName': instance.fullName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'profilePictureUrl': instance.profilePictureUrl,
      'sellerId': instance.sellerId,
      'about': instance.about,
      'userRole': _$UserRolesEnumMap[instance.userRoles],
    };

const _$UserRolesEnumMap = {
  UserRoles.buyer: 'BUYER',
  UserRoles.seller: 'SELLER',
};
