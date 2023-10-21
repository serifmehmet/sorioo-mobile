import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/features/advert/application/advert_service.dart';
import 'package:sorioo/features/category/presentation/widgets/category_list_grid_widget.dart';

class CategoryListView extends ConsumerWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: kSemiBigPadding,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppGap.regular(),
            AppText(
              'Kategoriler',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            AppText(
              'Aklına takılan bir soru varsa, aşağıdaki kategorilerde hizmet veren uzmanlardan destek alabilirsin.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const AppGap.big(),
            const CategoryListGridWidget(),
          ],
        ),
      ),
    );
  }
}
