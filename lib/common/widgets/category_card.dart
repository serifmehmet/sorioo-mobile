import 'package:flutter/material.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/features/category/domain/models/category.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    final catColor = "0xFF${category.catColor != '' ? category.catColor : 000000}";
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Color(int.parse(catColor)),
        borderRadius: kRegularBorderRadius,
      ),
      child: Padding(
        padding: kSemiBigPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              category.name,
              color: Colors.white,
            ),
            const AppGap.semiBig(),
            AppText(
              category.description ?? "",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const AppGap.semiBig(),
          ],
        ),
      ),
    );
  }
}
