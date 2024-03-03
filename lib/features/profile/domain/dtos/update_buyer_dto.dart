import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sorioo/common/models/image.dart';

part 'update_buyer_dto.freezed.dart';
part 'update_buyer_dto.g.dart';

@freezed
class UpdateBuyerDto with _$UpdateBuyerDto {
  factory UpdateBuyerDto({
    required String id,
    String? fullName,
    String? phoneNumber,
    String? about,
    Image? image,
  }) = _UpdateBuyerDto;

  factory UpdateBuyerDto.fromJson(Map<String, dynamic> json) => _$UpdateBuyerDtoFromJson(json);
}
