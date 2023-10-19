import 'package:freezed_annotation/freezed_annotation.dart';

part 'advert_package.freezed.dart';
part 'advert_package.g.dart';

@freezed
class AdvertPackage with _$AdvertPackage {
  factory AdvertPackage({
    required String name,
    required String description,
    required double price,
  }) = _AdvertPackage;

  factory AdvertPackage.fromJson(Map<String, dynamic> json) => _$AdvertPackageFromJson(json);
}
