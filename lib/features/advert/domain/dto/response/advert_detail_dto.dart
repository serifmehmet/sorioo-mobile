import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sorioo/features/advert/domain/dto/response/advert_detail_packages_dto.dart';

part 'advert_detail_dto.freezed.dart';
part 'advert_detail_dto.g.dart';

@freezed
class AdvertDetailDto with _$AdvertDetailDto {
  factory AdvertDetailDto({
    required String id,
    required List<AdvertDetailPackagesDto> advertPackages,
    String? title,
    String? details,
    String? needsToStart,
    String? userName,
  }) = _AdvertDetailDto;

  factory AdvertDetailDto.fromJson(Map<String, dynamic> json) => _$AdvertDetailDtoFromJson(json);
}
