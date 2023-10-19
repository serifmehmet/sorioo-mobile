import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sorioo/features/advert/domain/advert.dart';

part 'create_advert_dto.freezed.dart';
part 'create_advert_dto.g.dart';

@freezed
class CreateAdvertDto with _$CreateAdvertDto {
  factory CreateAdvertDto({
    required Advert advert,
  }) = _CreateAdvertDto;

  factory CreateAdvertDto.fromJson(Map<String, dynamic> json) => _$CreateAdvertDtoFromJson(json);
}
