import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/common/models/image.dart';
part 'image_picker_notifier.g.dart';

@riverpod
class ImagePickerNotifier extends _$ImagePickerNotifier {
  @override
  Image build() {
    return const Image(fileName: '', fileDescription: '', filePath: '');
  }

  void addImage(XFile file) {
    state = state.copyWith(
      fileDescription: '',
      fileName: file.name,
      filePath: file.path,
      image: file,
    );
  }
}
