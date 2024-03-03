import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorioo/core/theme/colors.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/core/theme/widgets/text/app_text_form_field_widget.dart';
import 'package:sorioo/features/advert/domain/advert_package.dart';
import 'package:sorioo/features/advert/presentation/create_advert/create_advert_controller.dart';

class AdvertAskQuestionPackageWidget extends ConsumerWidget {
  AdvertAskQuestionPackageWidget({
    required TextEditingController priceController,
    super.key,
  }) : _priceController = priceController;

  final TextEditingController _priceController;

  final _key = GlobalKey<FormState>();

  ValueNotifier<bool> isSelected = ValueNotifier(false);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ValueListenableBuilder<bool>(
      valueListenable: isSelected,
      builder: (context, value, child) {
        return Container(
          width: MediaQuery.of(context).size.width,
          padding: kSemiSmallPadding,
          decoration: BoxDecoration(
            color: isSelected.value ? AppColors.trGreen : kColorWhite,
            border: Border.all(
              color: kTextColor,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                'Soru Cevap',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: kTextColor,
                    ),
              ),
              const AppGap.small(),
              AppText(
                'Kullanıcılara temel düzeyde hizmet sağlayabilirsin.',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: kTextColor,
                    ),
              ),
              const AppGap.regular(),
              AppText(
                'Fiyat',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: kTextColor,
                    ),
              ),
              const AppGap.semiSmall(),
              Form(
                key: _key,
                child: AppTextFormField(
                  enabled: !isSelected.value,
                  readOnly: isSelected.value,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  prefixText: kTryCurrencySymbol,
                  autofocus: false,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.number,
                  hintText: 'Soru-Cevap fiyatı',
                  controller: _priceController,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Fiyat alanı boş olamaz';
                    }

                    return null;
                  },
                  hasBorder: true,
                ),
              ),
              const AppGap.regular(),
              Row(
                mainAxisAlignment: isSelected.value ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
                children: [
                  if (isSelected.value) ...[
                    ElevatedButton(
                      onPressed: () {
                        ref.read(createAdvertControllerProvider.notifier).deleteAdvertPackage(
                              1,
                            );

                        isSelected.value = false;
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.error,
                      ),
                      child: const AppText(
                        'Seçimi Kaldır',
                      ),
                    ),
                  ],
                  ElevatedButton(
                    onPressed: !isSelected.value
                        ? () {
                            if (_key.currentState!.validate()) {
                              if (!isSelected.value) {
                                isSelected.value = true;
                              }

                              final ap = AdvertPackage(
                                packageType: 1,
                                price: double.parse(_priceController.text),
                              );

                              ref.read(createAdvertControllerProvider.notifier).addAdvertPackage(
                                    ap,
                                  );
                              ref.read(createAdvertControllerProvider.notifier).changeValidationState(
                                    true,
                                  );
                            }
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isSelected.value ? kAppGray : Theme.of(context).colorScheme.primary,
                    ),
                    child: AppText(isSelected.value ? 'Seçildi' : 'Onayla'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
