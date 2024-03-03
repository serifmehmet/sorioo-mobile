import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sorioo/common/providers/image_picker_notifier.dart';
import 'package:sorioo/core/utility/mounted_mixin.dart';
import 'package:sorioo/features/profile/presentation/widgets/buyer_profile_photo_edit_widget.dart';

mixin BuyerProfilePhotoEditMixin on ConsumerState<BuyerProfilePhotoEdit>, MountedMixin<BuyerProfilePhotoEdit> {
  Future<void> pickImageFromGallery() async {
    final imageNotifier = ref.read(imagePickerNotifierProvider.notifier);
    final returnImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (returnImage == null) return;
    // setState(() {
    //   _selectedImage = File(returnImage.path);
    //   _image = File(returnImage.path).readAsBytesSync();
    // });
    imageNotifier.addImage(returnImage);

    await safeOperation(() async {
      Navigator.of(context).pop();
    });
  }

  Future<void> pickImageFromCamera() async {
    final imageNotifier = ref.read(imagePickerNotifierProvider.notifier);
    final returnImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );
    if (returnImage == null) return;
    imageNotifier.addImage(returnImage);

    await safeOperation(() async {
      Navigator.of(context).pop();
    });
  }
}
