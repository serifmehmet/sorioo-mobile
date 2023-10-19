import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/widgets/button/app_button.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/features/advert/presentation/advert_controller.dart';
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
          data: (advertList) => const SizedBox(),
          error: (error, stackTrace) => Column(
            children: [
              Expanded(
                child: Center(
                  child: AppText(
                    error.toString(),
                    style: const TextStyle(
                      color: kTextColor,
                    ),
                  ),
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
