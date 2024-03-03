import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/button/app_button.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/features/advert/presentation/advert_controller.dart';
import 'package:sorioo/features/advert/presentation/widgets/advert_item_widget.dart';
import 'package:sorioo/routing/app_routes.dart';

class AdvertListView extends ConsumerWidget {
  const AdvertListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listController = ref.watch(advertControllerProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const AppText('İlan Listesi'),
        ),
        body: listController.when(
          data: (advertList) => Padding(
            padding: kSemiBigPadding,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      'İlanlarım',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    SizedBox(
                      width: 165,
                      child: AppPrimaryButton(
                        title: 'Yeni İlan Oluştur',
                        onTap: () => GoRouter.of(context).pushNamed(
                          AppRoutes.sellerAdvertsCreate.name,
                        ),
                      ),
                    ),
                  ],
                ),
                const AppGap.big(),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => const AppGap.regular(),
                    itemBuilder: (context, index) => AdvertItemWidget(advertItem: advertList[index]),
                    itemCount: advertList.length,
                  ),
                ),
              ],
            ),
          ),
          error: (error, stackTrace) => Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
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
                  ],
                ),
              ),
              Container(
                padding: kSemiBigPadding,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: kColorWhite,
                ),
                child: AppPrimaryButton(
                  title: 'Yeni İlan Oluştur',
                  onTap: () => GoRouter.of(context).pushNamed(
                    AppRoutes.sellerAdvertsCreate.name,
                  ),
                ),
              ),
            ],
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
