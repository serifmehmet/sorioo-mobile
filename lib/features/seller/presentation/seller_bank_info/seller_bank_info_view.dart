import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/features/seller/presentation/seller_bank_info/route_args/seller_bank_info_list_page_args.dart';
import 'package:sorioo/features/seller/presentation/seller_bank_info/seller_bank_info_controller.dart';

class SellerBankInfoView extends ConsumerWidget {
  const SellerBankInfoView({required this.args, super.key});

  final SellerBankInfoListPageArgs args;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sellerState = ref.watch(sellerBankInfoControllerProvider(args.sellerId));
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const AppText('Banka Bilgilerim'),
        ),
        body: sellerState.map(
          data: (data) => const Column(),
          error: (s) => const SizedBox(),
          loading: (s) => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
