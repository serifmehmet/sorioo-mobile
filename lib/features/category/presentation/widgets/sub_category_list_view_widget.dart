import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sorioo/common/models/sub_category_list_local.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/features/advert/presentation/route_args/advert_list_args.dart';
import 'package:sorioo/routing/app_routes.dart';

class SubCategoryListViewWidget extends StatelessWidget {
  const SubCategoryListViewWidget({
    required this.mainCategoryName,
    super.key,
  });

  final String mainCategoryName;

  @override
  Widget build(BuildContext context) {
    final subCategories = getSubCategoryList(mainCategoryName);
    return ListView.separated(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ListTile(
          trailing: const Icon(Icons.arrow_right, color: kTextColor),
          title: AppText(
            subCategories[index].name,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          tileColor: kColorWhite,
          splashColor: Theme.of(context).colorScheme.primary,
          onTap: () {
            GoRouter.of(context).pushNamed(
              AppRoutes.advertListOnCategory.name,
              extra: AdvertListArgs(
                advertCategoryId: subCategories[index].id,
                categoryName: subCategories[index].name,
              ),
            );
          },
        );
      },
      separatorBuilder: (context, index) => const Divider(
        height: 1,
        color: kTextColor,
      ),
      itemCount: subCategories!.length,
    );
  }

  List<SubCategoryListLocal>? getSubCategoryList(String mainCategoryName) {
    switch (mainCategoryName) {
      case 'İş ve Kariyer':
        return SubCategoryListLocal.subCategoryBusinessList();
      case 'Mühendislik':
        return SubCategoryListLocal.subCategoryEngineerList();
      case 'Ofis':
        return SubCategoryListLocal.subCategoryOfficeList();
      case 'Tasarım':
        return SubCategoryListLocal.subCategoryDesignList();
      case 'Yazılım':
        return SubCategoryListLocal.subCategoryDevelopmentList();
    }
    return null;
  }
}
