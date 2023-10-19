// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_bank_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SellerBankInfo _$$_SellerBankInfoFromJson(Map<String, dynamic> json) =>
    _$_SellerBankInfo(
      id: json['id'] as String?,
      sellerId: json['sellerId'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      bankName: json['bankName'] as String?,
      iban: json['iban'] as String?,
      identityNumber: json['identityNumber'] as String?,
      billingAddress: json['billingAddress'] as String?,
    );

Map<String, dynamic> _$$_SellerBankInfoToJson(_$_SellerBankInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sellerId': instance.sellerId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'bankName': instance.bankName,
      'iban': instance.iban,
      'identityNumber': instance.identityNumber,
      'billingAddress': instance.billingAddress,
    };
