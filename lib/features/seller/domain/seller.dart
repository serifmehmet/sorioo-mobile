import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sorioo/common/models/image.dart';
import 'package:sorioo/features/auth/domain/user.dart';
import 'package:sorioo/features/category/domain/models/category.dart';

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
    Category? sellerMainCategory,
  }) = _Seller;

  factory Seller.fromJson(Map<String, dynamic> json) => _$SellerFromJson(json);
}
