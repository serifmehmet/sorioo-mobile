import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sorioo/common/models/image.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    required String id,
    required String name,
    required int status,
    String? catColor,
    Image? categoryImage,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}
