// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buyer_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BuyerProfile _$$_BuyerProfileFromJson(Map<String, dynamic> json) =>
    _$_BuyerProfile(
      fullName: json['fullName'] as String,
      phoneNumber: json['phoneNumber'] as String? ?? '',
      about: json['about'] as String? ?? '',
      profilePictureUrl: json['profilePictureUrl'] as String? ?? '',
      userProfileImage: json['userProfileImage'] == null
          ? null
          : Image.fromJson(json['userProfileImage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_BuyerProfileToJson(_$_BuyerProfile instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'about': instance.about,
      'profilePictureUrl': instance.profilePictureUrl,
      'userProfileImage': instance.userProfileImage,
    };
