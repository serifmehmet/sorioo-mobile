import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:sorioo/common/extensions/async_value_ui.dart';
import 'package:sorioo/common/providers/image_picker_notifier.dart';
import 'package:sorioo/common/widgets/alert_dialogs.dart';
import 'package:sorioo/core/constants/preferences_keys.dart';
import 'package:sorioo/core/init/cache_manager.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/sorioo_padding.dart';
import 'package:sorioo/core/theme/widgets/button/app_button.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/core/theme/widgets/text/app_text_form_field_widget.dart';
import 'package:sorioo/features/seller/domain/dto/update_seller_dto.dart';
import 'package:sorioo/features/seller/presentation/seller_profile/route_args/seller_profile_edit_page_args.dart';
import 'package:sorioo/features/seller/presentation/seller_profile/seller_profile_controller.dart';
import 'package:sorioo/features/seller/presentation/seller_profile/validators/update_seller_validators.dart';
import 'package:sorioo/features/seller/presentation/seller_profile/widgets/seller_category/categories_dropdown_widget.dart';
import 'package:sorioo/features/seller/presentation/seller_profile/widgets/seller_profile_picture_edit_widget.dart';

part 'mixins/seller_profile_edit_view_mixin.dart';

class SellerProfileEditView extends ConsumerStatefulWidget {
  const SellerProfileEditView({required this.args, super.key});

  final SellerProfileEditPageArgs args;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SellerProfileEditViewState();
}

class _SellerProfileEditViewState extends ConsumerState<SellerProfileEditView>
    with UpdateSellerValidators, _SellerProfileEditViewMixin {
  @override
  Widget build(BuildContext context) {
    // ref.listen(
    //   sellerProfileControllerProvider,
    //   (_, state) => state.showAlertDialogOnError(
    //     context,
    //   ),
    // );

    // ref.listen(
    //   sellerProfileControllerProvider,
    //   (_, state) {
    //     state.showAlertDialogOnError(context);
    //   },
    // );

    ref.listen(sellerProfileControllerProvider, (_, state) {
      if (!state.isLoading && !state.hasError) {
        Fluttertoast.showToast(
          msg: 'Profiliniz başarılı bir şekilde güncellenmeiştir.',
          toastLength: Toast.LENGTH_LONG,
          backgroundColor: Theme.of(context).colorScheme.primary,
          fontSize: 16,
        ).then(
          (value) => GoRouter.of(context).pop(),
        );
      }
    });

    final sellerState = ref.watch(sellerProfileControllerProvider);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const AppText(
            'Profili Güncelle',
          ),
        ),
        body: sellerState.when(
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stackTrace) => Center(
            child: AppText('Error: $error'),
          ),
          data: (data) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: FocusScope(
                      node: _node,
                      child: Form(
                        key: formKey,
                        child: Padding(
                          padding: const SoriooPadding.allRegular(),
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                decoration: const BoxDecoration(
                                  color: kColorWhite,
                                ),
                                padding: kSemiBigPadding,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SellerProfilePictureEditWidget(
                                      profilePictureUrl: widget.args.profilePictureUrl,
                                    ),
                                    const AppGap.semiBig(),
                                    AppText(
                                      'Ad-Soyad',
                                      style: Theme.of(context).textTheme.bodyMedium,
                                      textAlign: TextAlign.start,
                                    ),
                                    const AppGap.semiSmall(),
                                    AppTextFormField(
                                      controller: _fullNameController,
                                      enabled: true,
                                      autofocus: false,
                                      textInputAction: TextInputAction.next,
                                      textInputType: TextInputType.multiline,
                                      hintText: '',
                                      validator: (fullName) => !_submitted
                                          ? null
                                          : fullNameErrorText(
                                              fullName ?? '',
                                            ),
                                      onEditingComplete: () {
                                        if (canSubmitFullName(fullName)) {
                                          _node.nextFocus();
                                        }
                                      },
                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                    ),
                                    const AppGap.semiBig(),
                                    AppText(
                                      'Hakkımda',
                                      style: Theme.of(context).textTheme.bodyMedium,
                                    ),
                                    const AppGap.semiSmall(),
                                    AppTextFormField(
                                      enabled: true,
                                      autofocus: false,
                                      textInputAction: TextInputAction.done,
                                      textInputType: TextInputType.multiline,
                                      hintText: '',
                                      controller: _bioController,
                                      maxLines: 6,
                                    ),
                                  ],
                                ),
                              ),
                              const AppGap.semiBig(),
                              Container(
                                width: double.infinity,
                                padding: kSemiBigPadding,
                                decoration: const BoxDecoration(
                                  color: kColorWhite,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      'Ana Kategori',
                                      style: Theme.of(context).textTheme.bodyMedium,
                                    ),
                                    const AppGap.semiBig(),
                                    CategoriesDropdownWidget(
                                      selectedCategoryId: widget.args.sellerMainCategoryId != ''
                                          ? widget.args.sellerMainCategoryId
                                          : selectedCategoryId,
                                      onDropdownChanged: (value) {
                                        setState(() {
                                          selectedCategoryId = value;
                                          print(selectedCategoryId);
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const AppGap.semiBig(),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Color(
                                    0xFFFFFFFF,
                                  ),
                                ),
                                padding: kSemiBigPadding,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      'Endüstri',
                                      style: Theme.of(context).textTheme.bodyMedium,
                                    ),
                                    const AppGap.semiBig(),
                                    AppTextFormField(
                                      enabled: true,
                                      autofocus: false,
                                      textInputAction: TextInputAction.done,
                                      textInputType: TextInputType.text,
                                      hintText: '',
                                      controller: _industryController,
                                    ),
                                    const AppGap.semiBig(),
                                    AppText(
                                      'Mezuniyet',
                                      style: Theme.of(context).textTheme.bodyMedium,
                                    ),
                                    const AppGap.semiBig(),
                                    AppTextFormField(
                                      enabled: true,
                                      autofocus: false,
                                      textInputAction: TextInputAction.done,
                                      textInputType: TextInputType.text,
                                      hintText: '',
                                      controller: _graduationController,
                                    ),
                                  ],
                                ),
                              ),
                              const AppGap.semiBig(),
                              const AppGap.big(),
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
                    title: 'Güncelle',
                    onTap: _submit,
                    isLoading: isLoading,
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
