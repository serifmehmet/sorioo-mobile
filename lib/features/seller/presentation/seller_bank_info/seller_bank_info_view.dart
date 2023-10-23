import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/widgets/button/app_button.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/features/seller/presentation/seller_bank_info/route_args/seller_bank_info_list_page_args.dart';
import 'package:sorioo/features/seller/presentation/seller_bank_info/seller_bank_info_controller.dart';
import 'package:sorioo/routing/app_routes.dart';

class SellerBankInfoView extends ConsumerWidget {
  const SellerBankInfoView({required this.args, super.key});

  final SellerBankInfoListPageArgs args;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sellerBankInfoState = ref.watch(
      fetchSellerBankInfoProvider,
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const AppText('Banka Bilgilerim'),
        ),
        body: sellerBankInfoState.when(
          error: (error, stackTrace) => Column(
            children: [
              Image.asset('assets/images/no-data-found.png'),
              Center(
                child: AppText(
                  'Henüz banka bilgilerinizi girmemişsiniz, lütfen banka bilgisi giriniz!',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const Spacer(),
              AppPrimaryButton(
                title: 'Yeni Ekle',
                onTap: () => GoRouter.of(context).pushNamed(
                  AppRoutes.createSellerBankInfo.name,
                ),
              ),
            ],
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          data: (sellerBankInfo) => Column(
            children: [
              Expanded(
                child: Padding(
                  padding: kSemiBigPadding,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFFFFF),
                    ),
                    padding: kBigPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText(
                              'Ad & Soyad',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            AppText(
                              '${sellerBankInfo!.firstName!} ${sellerBankInfo.lastName!}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding: kSemiBigPadding,
                decoration: const BoxDecoration(color: Color(0xFFFFFFFF)),
                child: const AppPrimaryButton(
                  title: 'Düzenle',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
