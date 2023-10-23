import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sorioo/common/models/category_local_copy.dart';
import 'package:sorioo/common/widgets/category_card.dart';
import 'package:sorioo/features/category/presentation/route_args/sub_category_args.dart';
import 'package:sorioo/routing/app_routes.dart';

class CategoryListGridWidget extends ConsumerWidget {
  const CategoryListGridWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = CategoryLocalCopy.categoryList();

    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (item, index) {
        return InkWell(
          onTap: () {
            GoRouter.of(context).pushNamed(
              AppRoutes.subCategoryList.name,
              extra: SubCategoryArgs(
                mainCategoryId: categories[index].id,
                mainCategoryTitle: categories[index].name,
              ),
            );
          },
          child: CategoryCard(
            category: categories[index],
          ),
        );
      },
      itemCount: categories.length,
    );
  }
}
