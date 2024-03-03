import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/features/advert/presentation/category_advert/get_advert_list_on_category_provider.dart';
import 'package:sorioo/features/advert/presentation/widgets/advert_item_widget.dart';

class AdvertListAsyncDataWidget extends ConsumerWidget {
  const AdvertListAsyncDataWidget({
    required this.categoryId,
    super.key,
  });
  final String categoryId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final advertListProvider = ref.watch(
      getAdvertListOnCategoryProvider(
        categoryId,
      ),
    );
    return advertListProvider.when(
      data: (advertList) => ListView.separated(
        shrinkWrap: true,
        itemCount: advertList.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return AdvertItemWidget(
            advertItem: advertList[index],
          );
        },
        separatorBuilder: (context, index) => const AppGap.regular(),
      ),
      error: (error, stackTrace) => Column(
        children: [
          Image.asset(
            'assets/images/no-data.png',
            width: 200,
          ),
          const AppGap.semiBig(),
          AppText(
            error.toString(),
            style: Theme.of(context).textTheme.displaySmall,
            textAlign: TextAlign.center,
          ),
          // Container(
          //   padding: kSemiBigPadding,
          //   width: MediaQuery.of(context).size.width,
          //   decoration: const BoxDecoration(
          //     color: kColorWhite,
          //   ),
          //   child: AppPrimaryButton(
          //     title: 'Yeni İlan Oluştur',
          //     onTap: () => GoRouter.of(context).pushNamed(
          //       AppRoutes.sellerAdvertsCreate.name,
          //     ),
          //   ),
          // ),
        ],
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
