import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sorioo/common/providers/image_picker_notifier.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/core/utility/mounted_mixin.dart';

part 'mixins/seller_profile_picture_edit_widget_mixin.dart';

class SellerProfilePictureEditWidget extends ConsumerStatefulWidget {
  const SellerProfilePictureEditWidget({
    required this.profilePictureUrl,
    super.key,
  });

  final String profilePictureUrl;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SellerProfilePictureEditWidgetState();
}

class _SellerProfilePictureEditWidgetState extends ConsumerState<SellerProfilePictureEditWidget>
    with MountedMixin<SellerProfilePictureEditWidget>, _SellerProfilePictureEditWidgetMixin {
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
                    ? Image.network(widget.profilePictureUrl).image
                    : Image.asset(
                        'assets/images/default-avatar.png',
                      ).image,
              ),
            Positioned(
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
