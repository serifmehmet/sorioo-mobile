import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sorioo/common/providers/image_picker_notifier.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/core/utility/mounted_mixin.dart';
import 'package:sorioo/features/profile/presentation/mixins/buyer_profile_edit_mixin.dart';
import 'package:sorioo/features/profile/presentation/mixins/buyer_profile_photo_edit_mixin.dart';

class BuyerProfilePhotoEdit extends ConsumerStatefulWidget {
  const BuyerProfilePhotoEdit({
    required this.profilePictureUrl,
    super.key,
  });

  final String profilePictureUrl;

  @override
  ConsumerState<BuyerProfilePhotoEdit> createState() => _BuyerProfilePhotoEditState();
}

class _BuyerProfilePhotoEditState extends ConsumerState<BuyerProfilePhotoEdit>
    with MountedMixin<BuyerProfilePhotoEdit>, BuyerProfilePhotoEditMixin {
  @override
  Widget build(BuildContext context) {
    final imageNotifier = ref.watch(imagePickerNotifierProvider);
    return Container(
      color: kColorWhite,
      width: MediaQuery.of(context).size.width,
      padding: kSemiBigPadding,
      child: Center(
        child: Stack(
          children: [
            if (imageNotifier.image != null)
              CircleAvatar(
                radius: 40,
                backgroundImage: MemoryImage(
                  File(imageNotifier.image!.path).readAsBytesSync(),
                ),
              )
            else
              CircleAvatar(
                radius: 40,
                backgroundImage: widget.profilePictureUrl.isNotEmpty
                    ? Image.network(
                        widget.profilePictureUrl,
                      ).image
                    : Image.asset(
                        'assets/images/default-avatar.png',
                      ).image,
              ),
            Positioned(
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Theme.of(context).colorScheme.primary,
                ),
                width: 30,
                height: 30,
                child: Center(
                  child: IconButton(
                    icon: const Icon(
                      IconlyBold.edit,
                      size: 17,
                      color: kColorWhite,
                    ),
                    onPressed: () {
                      showImagePickerOption(context);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet<dynamic>(
      backgroundColor: kColorWhite,
      context: context,
      builder: (context) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 4,
          child: ListView(
            children: [
              InkWell(
                onTap: pickImageFromGallery,
                child: ListTile(
                  leading: Icon(
                    IconlyBold.image,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  titleAlignment: ListTileTitleAlignment.center,
                  title: AppText(
                    'Galeriden Seç',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              InkWell(
                onTap: pickImageFromCamera,
                child: ListTile(
                  leading: Icon(
                    IconlyBold.camera,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  title: AppText(
                    'Fotoğraf Çek',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: ListTile(
                  leading: Icon(
                    Icons.cancel,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  title: AppText(
                    'Vazgeç',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
