import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sorioo/common/models/image.dart';
import 'package:sorioo/features/auth/domain/user.dart';

part 'seller.freezed.dart';
part 'seller.g.dart';

@freezed
class Seller with _$Seller {
  factory Seller({
    String? id,
    User? user,
    String? speciality,
    String? industry,
    String? graduation,
    String? sellerBio,
    Image? sellerImage,
  }) = _Seller;

  factory Seller.fromJson(Map<String, dynamic> json) => _$SellerFromJson(json);
}
