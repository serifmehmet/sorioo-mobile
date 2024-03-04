part of '../seller_profile_picture_edit_widget.dart';

mixin _SellerProfilePictureEditWidgetMixin
    on ConsumerState<SellerProfilePictureEditWidget>, MountedMixin<SellerProfilePictureEditWidget> {
  Future<void> pickImageFromGallery() async {
    final imageNotifier = ref.read(imagePickerNotifierProvider.notifier);

    final returnImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (returnImage == null) return;

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
