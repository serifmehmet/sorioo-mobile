import 'package:freezed_annotation/freezed_annotation.dart';

part 'advert_detail_packages_dto.freezed.dart';
part 'advert_detail_packages_dto.g.dart';

@freezed
class AdvertDetailPackagesDto with _$AdvertDetailPackagesDto {
  factory AdvertDetailPackagesDto({
    required double price,
    int? packageType,
    int? educationOrConsultancy,
    int? workDurationLimit,
    int? advertPackageChoice,
  }) = _AdvertDetailPackagesDto;

  factory AdvertDetailPackagesDto.fromJson(Map<String, dynamic> json) => _$AdvertDetailPackagesDtoFromJson(json);
}
