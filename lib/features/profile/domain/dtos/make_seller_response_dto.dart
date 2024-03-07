import 'package:freezed_annotation/freezed_annotation.dart';

part 'make_seller_response_dto.freezed.dart';
part 'make_seller_response_dto.g.dart';

@freezed
class MakeSellerResponseDto with _$MakeSellerResponseDto {
  factory MakeSellerResponseDto({
    required String id,
    required String fullName,
    required bool isSeller,
  }) = _MakeSellerResponseDto;

  factory MakeSellerResponseDto.fromJson(Map<String, dynamic> json) => _$MakeSellerResponseDtoFromJson(
        json,
      );
}
