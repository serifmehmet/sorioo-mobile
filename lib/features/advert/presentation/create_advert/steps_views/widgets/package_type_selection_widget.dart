import 'package:flutter/material.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';

class PackageTypeSelectionWidget extends StatelessWidget {
  PackageTypeSelectionWidget({
    required this.firstButtonTitle,
    required this.secondButtonTitle,
    this.secondButtonicon,
    this.firstButtonicon,
    this.isParentSelected = false,
    super.key,
  });

  final String firstButtonTitle;
  final String secondButtonTitle;
  final IconData? firstButtonicon;
  final IconData? secondButtonicon;
  bool? isParentSelected;

  final ValueNotifier<int> selectedPackageTypeIndex = ValueNotifier(
    0,
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            if (!isParentSelected!) {
              selectedPackageTypeIndex.value == 0 ? null : selectedPackageTypeIndex.value = 0;
            }
          },
          child: ValueListenableBuilder(
            valueListenable: selectedPackageTypeIndex,
            builder: (context, value, child) => Container(
              decoration: BoxDecoration(
                color: value == 0 ? Theme.of(context).colorScheme.primary : kColorWhite,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(),
              ),
              padding: kSemiSmallPadding,
              child: Center(
                child: Row(
                  children: [
                    if (firstButtonicon != null) ...[
                      Icon(
                        firstButtonicon,
                        color: value == 0 ? kColorWhite : kTextColor,
                      ),
                      const AppGap.semiSmall(),
                    ] else
                      const SizedBox(),
                    AppText(
                      firstButtonTitle,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: value == 0 ? kColorWhite : kTextColor,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const AppGap.regular(),
        InkWell(
          onTap: () {
            if (!isParentSelected!) {
              selectedPackageTypeIndex.value == 1 ? null : selectedPackageTypeIndex.value = 1;
            }
          },
          child: ValueListenableBuilder(
            valueListenable: selectedPackageTypeIndex,
            builder: (context, value, child) => Container(
              decoration: BoxDecoration(
                color: value == 1 ? Theme.of(context).colorScheme.primary : kColorWhite,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(),
              ),
              padding: kSemiSmallPadding,
              child: Center(
                child: Row(
                  children: [
                    if (secondButtonicon != null) ...[
                      Icon(
                        secondButtonicon,
                        color: value == 1 ? kColorWhite : kTextColor,
                      ),
                      const AppGap.semiSmall(),
                    ] else
                      const SizedBox(),
                    AppText(
                      secondButtonTitle,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: value == 1 ? kColorWhite : kTextColor,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
