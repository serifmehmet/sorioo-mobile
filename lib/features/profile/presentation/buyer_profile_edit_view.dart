import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:sorioo/common/providers/local_user_provider.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/sorioo_padding.dart';
import 'package:sorioo/core/theme/widgets/button/app_button.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/core/theme/widgets/text/app_text_form_field_widget.dart';
import 'package:sorioo/core/utility/mounted_mixin.dart';
import 'package:sorioo/features/profile/presentation/buyer_profile_controller.dart';
import 'package:sorioo/features/profile/presentation/mixins/buyer_profile_edit_mixin.dart';
import 'package:sorioo/features/profile/presentation/route_args/buyer_profile_edit_args.dart';
import 'package:sorioo/features/profile/presentation/widgets/buyer_profile_photo_edit_widget.dart';

class BuyerProfileEditView extends ConsumerStatefulWidget {
  const BuyerProfileEditView({
    required this.args,
    super.key,
  });

  final BuyerProfileEditArgs args;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BuyerProfileEditViewState();
}

class _BuyerProfileEditViewState extends ConsumerState<BuyerProfileEditView>
    with BuyerProfileEditMixin, MountedMixin<BuyerProfileEditView> {
  @override
  Widget build(BuildContext context) {
    final controllerState = ref.watch(buyerProfileControllerProvider);

    ref.listen(buyerProfileControllerProvider, (_, state) {
      if (!state.isLoading && !state.hasError) {
        Fluttertoast.showToast(
          msg: 'Profiliniz başarılı bir şekilde güncellenmiştir',
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Theme.of(context).colorScheme.primary,
          fontSize: 16,
        ).then(
          (value) => GoRouter.of(context).pop(),
        );
      }
    });
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const AppText('Profili Düzenle'),
        ),
        body: controllerState.maybeWhen(
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          orElse: () {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: FocusScope(
                      node: node,
                      child: Form(
                        key: formKey,
                        child: Padding(
                          padding: const SoriooPadding.allRegular(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BuyerProfilePhotoEdit(
                                profilePictureUrl: widget.args.profilePictureUrl,
                              ),
                              const AppGap.big(),
                              Container(
                                color: kColorWhite,
                                padding: kSemiBigPadding,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      'Ad-Soyad',
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    const AppGap.regular(),
                                    AppTextFormField(
                                      controller: fullNameController,
                                      enabled: true,
                                      autofocus: false,
                                      textInputAction: TextInputAction.next,
                                      textInputType: TextInputType.text,
                                      hintText: '',
                                    ),
                                    const AppGap.semiBig(),
                                    AppText(
                                      'Telefon Numarası',
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    const AppGap.regular(),
                                    AppTextFormField(
                                      controller: phoneNumberController,
                                      enabled: true,
                                      autofocus: false,
                                      textInputAction: TextInputAction.next,
                                      textInputType: TextInputType.number,
                                      hintText: widget.args.phoneNumber.isEmpty ? 'Telefon numarası girmediniz.' : '',
                                    ),
                                    const AppGap.semiBig(),
                                    AppText(
                                      'Hakkımda',
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                    const AppGap.regular(),
                                    AppTextFormField(
                                      controller: aboutController,
                                      enabled: true,
                                      autofocus: false,
                                      textInputAction: TextInputAction.done,
                                      textInputType: TextInputType.text,
                                      maxLines: 4,
                                      hintText: widget.args.about.isEmpty ? 'Hakkınızda bir yazı girmediniz.' : '',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  color: kColorWhite,
                  padding: kSemiBigPadding,
                  child: AppPrimaryButton(
                    title: 'Kaydet',
                    onTap: updateBuyerProfile,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
