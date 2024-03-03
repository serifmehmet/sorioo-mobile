import 'package:freezed_annotation/freezed_annotation.dart';

part 'basic_advert_item_dto.freezed.dart';
part 'basic_advert_item_dto.g.dart';

@freezed
class BasicAdvertItemDto with _$BasicAdvertItemDto {
  factory BasicAdvertItemDto({
    required String id,
    required String title,
    required String categoryName,
    required double price,
  }) = _BasicAdvertItemDto;

  factory BasicAdvertItemDto.fromJson(Map<String, dynamic> json) => _$BasicAdvertItemDtoFromJson(json);
}

List<BasicAdvertItemDto> basicAdvertListFromJson(List<dynamic> data) => List<BasicAdvertItemDto>.from(
      data.map(
        (s) => BasicAdvertItemDto.fromJson(s as Map<String, dynamic>),
      ),
    );
