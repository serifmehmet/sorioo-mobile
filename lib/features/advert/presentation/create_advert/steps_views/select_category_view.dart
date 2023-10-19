import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/features/advert/application/advert_service.dart';
import 'package:sorioo/features/advert/presentation/create_advert/create_advert_controller.dart';
import 'package:sorioo/features/category/application/category_controller.dart';

class SelectCategoryView extends ConsumerStatefulWidget {
  const SelectCategoryView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SelectCategoryViewState();
}

class _SelectCategoryViewState extends ConsumerState<SelectCategoryView> {
  bool _categorySelected = false;
  int _selectedIndex = 0;
  void selectMainCategory(String mainCategoryId, String categoryName, int index) {
    ref.read(createAdvertControllerProvider.notifier).selectMainCategory(
          mainCategoryId,
          categoryName,
        );
    setState(() {
      _categorySelected = true;
      _selectedIndex = index;
    });

    // context.navigator.pushAdvertSubCategory(
    //   CreateAdvertArgs(
    //     mainCategoryId: mainCategoryId,
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    final categories = ref.watch(getCategoriesProvider);
    return categories.when(
      data: (data) {
        return Padding(
          padding: kSemiBigPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                'İlanınız için bir kategori seçin',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const AppGap.regular(),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => selectMainCategory(
                        data[index].id,
                        data[index].name,
                        index,
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 250,
                        decoration: BoxDecoration(
                          color: (_categorySelected && _selectedIndex == index) ? kPrimaryColor : kAppGray,
                        ),
                        padding: kSmallPadding,
                        child: AppText(data[index].name),
                      ),
                    );
                  },
                  itemCount: data!.length,
                ),
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) => const AppGap.big(),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
