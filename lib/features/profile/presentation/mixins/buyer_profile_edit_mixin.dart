import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorioo/common/providers/image_picker_notifier.dart';
import 'package:sorioo/core/constants/preferences_keys.dart';
import 'package:sorioo/core/init/cache_manager.dart';
import 'package:sorioo/features/profile/domain/buyer_profile.dart';
import 'package:sorioo/features/profile/domain/dtos/update_buyer_dto.dart';
import 'package:sorioo/features/profile/presentation/buyer_profile_controller.dart';
import 'package:sorioo/features/profile/presentation/buyer_profile_edit_view.dart';

mixin BuyerProfileEditMixin on ConsumerState<BuyerProfileEditView> {
  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final aboutController = TextEditingController();

  final node = FocusScopeNode();
  final formKey = GlobalKey<FormState>();

  String get fullname => fullNameController.text;
  String get phoneNumber => phoneNumberController.text;
  String get about => aboutController.text;

  @override
  void initState() {
    fullNameController.text = widget.args.fullName;
    phoneNumberController.text = widget.args.phoneNumber;
    aboutController.text = widget.args.about;
    super.initState();
  }

  @override
  void dispose() {
    fullNameController.dispose();
    phoneNumberController.dispose();
    aboutController.dispose();

    node.dispose();
    super.dispose();
  }

  Future<void> updateBuyerProfile() async {
    final buyerProfile = BuyerProfile(
      fullName: fullname,
      phoneNumber: phoneNumber,
      about: about,
    );

    final controller = ref.read(buyerProfileControllerProvider.notifier);
    final imageNotifier = ref.watch(imagePickerNotifierProvider);
    if (formKey.currentState!.validate()) {
      final updateBuyerDto = UpdateBuyerDto(
        id: CacheManager.instance.getStringValue(
          PreferencesKeys.userId,
        ),
        fullName: fullname,
        phoneNumber: phoneNumber,
        about: about,
        image: imageNotifier,
      );
      await controller.updateBuyerProfile(updateBuyerDto);
    }
  }
}
