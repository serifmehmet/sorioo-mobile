import 'package:freezed_annotation/freezed_annotation.dart';

part 'seller_bank_info.freezed.dart';
part 'seller_bank_info.g.dart';

@freezed
class SellerBankInfo with _$SellerBankInfo {
  factory SellerBankInfo({
    String? id,
    String? sellerId,
    String? name,
    String? bankName,
    String? iban,
  }) = _SellerBankInfo;

  factory SellerBankInfo.fromJson(Map<String, dynamic> json) => _$SellerBankInfoFromJson(json);
}

List<SellerBankInfo> sellerBankInfoListFromJson(List<dynamic> data) => List<SellerBankInfo>.from(
      data.map(
        (sb) => SellerBankInfo.fromJson(sb as Map<String, dynamic>),
      ),
    );
