import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sorioo/features/advert/domain/advert_package.dart';

part 'advert.freezed.dart';
part 'advert.g.dart';

@freezed
class Advert with _$Advert {
  factory Advert({
    required String advertMainCategoryId,
    required String advertSubCategoryId,
    required String title,
    required String details,
    required String needsToStart,
    required String userId,
    String? categoryName,
    String? subCategoryName,
    List<AdvertPackage>? advertPackages,
    bool? isValidated,
  }) = _Advert;

  factory Advert.fromJson(Map<String, dynamic> json) => _$AdvertFromJson(json);
}
