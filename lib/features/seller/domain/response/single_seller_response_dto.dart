import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sorioo/features/category/domain/models/category.dart';

part 'single_seller_response_dto.freezed.dart';
part 'single_seller_response_dto.g.dart';

@freezed
class SingleSellerResponseDto with _$SingleSellerResponseDto {
  factory SingleSellerResponseDto({
    String? id,
    @Default('') String sellerGoogleImageUrl,
    @Default('') String sellerFullName,
    @Default('') String speciality,
    @Default('') String industry,
    @Default('') String graduation,
    @Default('') String sellerImagePath,
    // String? sellerMainCategoryId,
    Category? sellerMainCategory,
    @Default('') String sellerBio,
  }) = _SingleSellerResponseDto;

  factory SingleSellerResponseDto.fromJson(Map<String, dynamic> json) => _$SingleSellerResponseDtoFromJson(json);
}
