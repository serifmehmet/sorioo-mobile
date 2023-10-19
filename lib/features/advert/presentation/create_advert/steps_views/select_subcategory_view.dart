import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/features/advert/application/advert_service.dart';
import 'package:sorioo/features/advert/presentation/advert_controller.dart';
import 'package:sorioo/features/advert/presentation/create_advert/create_advert_controller.dart';
import 'package:sorioo/features/advert/presentation/route_args/create_advert_args.dart';

class SelectSubCategoryView extends ConsumerStatefulWidget {
  const SelectSubCategoryView({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SelectSubCategoryViewState();
}

class _SelectSubCategoryViewState extends ConsumerState<SelectSubCategoryView> {
  bool _subCategorySelected = false;
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final subCategoriesFuture = ref.watch(
      getSubCategoriesProvider(
        mainCategoryId: ref.watch(
          createAdvertControllerProvider.select((c) => c.advertMainCategoryId),
        ),
      ),
    );

    void selectSubCategory(String subCategoryId, String subCategoryName, int index) {
      setState(() {
        _selectedIndex = index;
        _subCategorySelected = true;
      });

      ref.read(createAdvertControllerProvider.notifier).selectSubCategory(
            subCategoryId,
            subCategoryName,
          );
    }

    return subCategoriesFuture.when(
      data: (categoryList) {
        return Padding(
          padding: kSemiBigPadding,
          child: Column(
            children: [
              AppText(
                'Devam etmek için alt kategoriyi seçin!',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const AppGap.regular(),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const AppGap.regular(),
                  itemCount: categoryList!.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => selectSubCategory(
                        categoryList[index].id,
                        categoryList[index].name,
                        index,
                      ),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: (_selectedIndex == index && _subCategorySelected) ? kPrimaryColor : kColorWhite,
                        ),
                        padding: kSemiSmallPadding,
                        child: AppText(
                          categoryList[index].name,
                          color: (_selectedIndex == index && _subCategorySelected) ? kColorWhite : kTextColor,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) => const AppGap.regular(),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
