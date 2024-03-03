import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:sorioo/core/theme/colors.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/core/theme/widgets/text/app_text_form_field_widget.dart';
import 'package:sorioo/features/advert/domain/advert_package.dart';
import 'package:sorioo/features/advert/presentation/create_advert/create_advert_controller.dart';
import 'package:sorioo/features/advert/presentation/create_advert/steps_views/widgets/package_type_selection_widget.dart';
import 'package:sorioo/features/advert/presentation/create_advert/steps_views/widgets/service_length_selection_widget.dart';

class AdvertSupportPackageWidget extends ConsumerWidget {
  AdvertSupportPackageWidget({super.key});

  ValueNotifier<bool> isSelected = ValueNotifier(false);

  final _priceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final ValueNotifier<int> _selectedSupportType = ValueNotifier(0);

  String get price => _priceController.text;

  late WorkDuration serviceLength;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ValueListenableBuilder(
      valueListenable: isSelected,
      builder: (context, value, child) => Container(
        width: MediaQuery.of(context).size.width,
        padding: kSemiSmallPadding,
        decoration: BoxDecoration(
          color: isSelected.value ? AppColors.trGreen : kColorWhite,
          border: Border.all(
            color: isSelected.value ? kColorWhite : kTextColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              'Destek',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const AppGap.regular(),
            AppText(
              'Kullanıcılara uzman olduğun konularda ileri seviye destek verebilirsin.',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: isSelected.value ? kColorWhite : kTextColor,
                  ),
            ),
            const AppGap.regular(),
            AppText(
              'Tercih',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const AppGap.regular(),
            ValueListenableBuilder(
              valueListenable: _selectedSupportType,
              builder: (context, selectedSupportTypeValue, child) => SegmentedButton(
                segments: const [
                  ButtonSegment(
                    value: 0,
                    label: Text('Mesaj'),
                    icon: Icon(IconlyLight.message),
                  ),
                  ButtonSegment(
                    value: 1,
                    label: Text('Online Görüşme'),
                    icon: Icon(IconlyLight.camera),
                  ),
                ],
                selected: <int>{
                  selectedSupportTypeValue,
                },
                onSelectionChanged: (selectedValue) {
                  if (value) {
                    return;
                  }
                  _selectedSupportType.value = selectedValue.first;
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                    (states) {
                      return states.contains(MaterialState.selected) ? kPrimaryColor : kColorWhite;
                    },
                  ),
                  foregroundColor: MaterialStateColor.resolveWith(
                    (states) {
                      return states.contains(MaterialState.selected) ? kColorWhite : kPrimaryColor;
                    },
                  ),
                ),
              ),
            ),
            const AppGap.regular(),
            AppText('Fiyat', style: Theme.of(context).textTheme.headlineSmall),
            const AppGap.regular(),
            ServiceLengthSelectionWidget(
              onValueChanged: (value) {
                serviceLength = value!;
              },
              enabled: value,
            ),
            const AppGap.semiSmall(),
            Form(
              key: _formKey,
              child: AppTextFormField(
                controller: _priceController,
                enabled: !isSelected.value,
                readOnly: isSelected.value,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                prefixText: kTryCurrencySymbol,
                autofocus: false,
                textInputAction: TextInputAction.done,
                textInputType: TextInputType.number,
                hintText: 'Lütfen talep ettiğiniz süre/fiyatı belirtin.',
                hasBorder: true,
                validator: (priceValue) {
                  if (priceValue!.isEmpty) {
                    return 'Fiyat alanı boş bırakılamaz.';
                  }

                  return null;
                },
              ),
            ),
            const AppGap.regular(),
            Row(
              mainAxisAlignment: isSelected.value ? MainAxisAlignment.spaceBetween : MainAxisAlignment.end,
              children: [
                if (isSelected.value) ...[
                  ElevatedButton(
                    onPressed: () {
                      isSelected.value = false;
                      ref.read(createAdvertControllerProvider.notifier).deleteAdvertPackage(
                            3,
                          );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.error,
                    ),
                    child: const AppText('Seçimi Kaldır'),
                  ),
                ],
                ElevatedButton(
                  onPressed: isSelected.value
                      ? null
                      : () {
                          if (_formKey.currentState!.validate()) {
                            if (!isSelected.value) {
                              isSelected.value = true;
                            }

                            final ap = AdvertPackage(
                              packageType: 3,
                              price: double.parse(price),
                              workDurationLimit: serviceLength.id,
                            );

                            ref.read(createAdvertControllerProvider.notifier).addAdvertPackage(
                                  ap,
                                );

                            ref.read(createAdvertControllerProvider.notifier).changeValidationState(
                                  true,
                                );
                          }
                        },
                  child: const AppText('Onayla'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
