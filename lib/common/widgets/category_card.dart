import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sorioo/common/models/category_local_copy.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/features/category/domain/models/category.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({required this.category, super.key});

  final CategoryLocalCopy category;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: kRegularBorderRadius,
      ),
      child: Padding(
        padding: kSemiBigPadding,
        child: Column(
          children: [
            AppText(
              category.name,
              color: Colors.white,
            ),
            const AppGap.semiBig(),
            // AppText(
            //   category.description ?? "",
            //   style: Theme.of(context).textTheme.bodyMedium,
            // ),
            Image.asset(
              category.localImageUrl,
              width: 100,
              height: 60,
            ),
            // SvgPicture.asset(category.localImageUrl),
            const AppGap.semiBig(),
          ],
        ),
      ),
    );
  }
}
