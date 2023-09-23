import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:sorioo/common/providers/local_user_provider.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/features/seller/presentation/seller_bank_info/route_args/seller_bank_info_list_page_args.dart';
import 'package:sorioo/routing/app_routes.dart';
import 'package:sorioo/routing/navigation_helpers.dart';

class SellerAccounInfoView extends ConsumerWidget {
  const SellerAccounInfoView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localUser = ref.watch(localUserServiceProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const AppText('Hesap Bilgileri'),
        ),
        body: Padding(
          padding: kBigPadding,
          child: Column(
            children: [
              ColoredBox(
                color: Colors.black12,
                child: ListTile(
                  leading: const Icon(
                    IconlyBold.call,
                  ),
                  trailing: const Icon(IconlyBold.arrow_right_2),
                  title: AppText(
                    'İletişim Bilgilerim',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ),
              ColoredBox(
                color: Colors.black12,
                child: ListTile(
                  leading: const Icon(
                    IconlyBold.wallet,
                  ),
                  trailing: const Icon(IconlyBold.arrow_right_2),
                  title: AppText(
                    'Banka Bilgilerim',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  onTap: () => context.navigator.pushSellerBankInfoList(
                    SellerBankInfoListPageArgs(sellerId: localUser.sellerId!),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
