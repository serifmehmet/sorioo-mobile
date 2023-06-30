import 'package:flutter/material.dart';
import 'package:sorioo/core/theme/constants.dart';

import '../../../core/theme/widgets/text/app_text.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: AppText(
        "Category",
        style: Theme.of(context).textTheme.displayMedium,
        color: kTextColor,
      ),
    ));
  }
}
