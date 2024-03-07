import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sorioo/common/models/image.dart';

part 'update_seller_dto.freezed.dart';
part 'update_seller_dto.g.dart';

@freezed
class UpdateSellerDto with _$UpdateSellerDto {
  factory UpdateSellerDto({
    required String id,
    required String userId,
    String? fullName,
    String? graduation,
    String? industry,
    String? bio,
    String? mainCategoryId,
    Image? image,
  }) = _UpdateSellerDto;

  factory UpdateSellerDto.fromJson(Map<String, dynamic> json) => _$UpdateSellerDtoFromJson(json);
}
