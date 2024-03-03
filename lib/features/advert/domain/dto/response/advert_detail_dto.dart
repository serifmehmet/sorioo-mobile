import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sorioo/features/advert/domain/dto/response/advert_detail_packages_dto.dart';

part 'advert_detail_dto.freezed.dart';
part 'advert_detail_dto.g.dart';

@freezed
class AdvertDetailDto with _$AdvertDetailDto {
  factory AdvertDetailDto({
    required String id,
    required String userName,
    required String title,
    required String details,
    required String needsToStart,
    required List<AdvertDetailPackagesDto> advertPackages,
  }) = _AdvertDetailDto;

  factory AdvertDetailDto.fromJson(Map<String, dynamic> json) => _$AdvertDetailDtoFromJson(json);
}
