import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'image.freezed.dart';
part 'image.g.dart';

@freezed
class Image with _$Image {
  const factory Image({
    required String fileName,
    required String fileDescription,
    required String filePath,
    @JsonKey(
      includeToJson: false,
      includeFromJson: false,
    )
    XFile? image,
    String? id,
  }) = _Image;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}
