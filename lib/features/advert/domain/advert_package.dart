import 'package:freezed_annotation/freezed_annotation.dart';

part 'advert_package.freezed.dart';
part 'advert_package.g.dart';

@freezed
class AdvertPackage with _$AdvertPackage {
  factory AdvertPackage({
    required int packageType,
    required double price,
    @JsonKey(includeToJson: false) String? advertId,
    int? educationOrConsultancy,
    int? workDurationLimit,
    int? advertPackageChoice,
  }) = _AdvertPackage;

  factory AdvertPackage.fromJson(Map<String, dynamic> json) => _$AdvertPackageFromJson(json);
}
