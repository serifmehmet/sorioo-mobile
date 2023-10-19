import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/features/advert/application/selected_categories_provider.dart';
import 'package:sorioo/features/advert/presentation/create_advert/create_advert_controller.dart';

class SelectedValuesWidget extends ConsumerWidget {
  const SelectedValuesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedValues = ref.watch(createAdvertControllerProvider);

    return Container(
      height: 70,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: kColorWhite,
        boxShadow: [
          BoxShadow(
            color: kTextColor,
            blurRadius: 10,
            spreadRadius: -10,
            offset: Offset(
              0,
              3,
            ),
          ),
        ],
      ),
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
        bottom: 10,
      ),
      child: Row(
        children: [
          // ...selectedValues.map(
          //   (categoryName) {
          //     return AnimatedContainer(
          //       duration: const Duration(
          //         milliseconds: 1000,
          //       ),
          //       curve: Curves.slowMiddle,
          //       decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(10),
          //         color: Theme.of(context).colorScheme.secondary,
          //       ),
          //       padding: kSmallPadding,
          //       child: Center(
          //         child: AppText(
          //           categoryName,
          //           style: Theme.of(context).textTheme.bodyMedium!.copyWith(
          //                 color: kColorWhite,
          //               ),
          //         ),
          //       ),
          //     );
          //   },
          // ),
          if (selectedValues.categoryName != '')
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.secondary,
              ),
              padding: kSmallPadding,
              child: Center(
                child: AppText(
                  selectedValues.categoryName!,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: kColorWhite,
                      ),
                ),
              ),
            ),
          const AppGap.regular(),
          if (selectedValues.subCategoryName != '')
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.secondary,
              ),
              padding: kSmallPadding,
              child: Center(
                child: AppText(
                  selectedValues.subCategoryName!,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: kColorWhite,
                      ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
