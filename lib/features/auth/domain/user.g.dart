// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as String?,
      userName: json['userName'] as String?,
      email: json['email'] as String?,
      fullName: json['fullName'] as String?,
      password: json['password'] as String?,
      userRole: json['userRole'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'userName': instance.userName,
      'email': instance.email,
      'fullName': instance.fullName,
      'password': instance.password,
      'userRole': instance.userRole,
    };
