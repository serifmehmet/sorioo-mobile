import 'package:flutter/material.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: kRegularBorderRadius,
      ),
      child: Padding(
        padding: kSemiSmallPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppText(
              "Ofis",
              color: Colors.white,
            ),
            const AppGap.semiBig(),
            AppText(
              "Ofis programları hakkında destek alın.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
