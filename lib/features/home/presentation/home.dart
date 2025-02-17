import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:sorioo/common/models/category_local_copy.dart';

import 'package:sorioo/common/widgets/category_card.dart';
import 'package:sorioo/common/widgets/preferred_app_bar_widget.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';

import 'package:sorioo/features/home/presentation/widgets/ask_area_widget.dart';
import 'package:sorioo/features/home/presentation/widgets/header_area_widget.dart';
import 'package:sorioo/routing/app_routes.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double top = 0;
  @override
  Widget build(BuildContext context) {
    final categories = CategoryLocalCopy.categoryList();
    return Scaffold(
      appBar: const PreferredAppBarWidget(),
      body: SingleChildScrollView(
        child: Padding(
          padding: kSemiBigPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderAreaWidget(),
              const AppGap.semiBig(),
              const AskAreaWidget(),
              const AppGap.big(),
              AppText(
                'Kategoriler',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
              ),
              const AppGap.semiBig(),
              GridView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (item, index) {
                  return InkWell(
                    onTap: () => GoRouter.of(context).pushNamed(
                      AppRoutes.subCategoryList.name,
                    ),
                    child: CategoryCard(
                      category: categories[index],
                    ),
                  );
                },
                itemCount: categories.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
