import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

import 'package:sorioo/common/providers/nav_notifier.dart';
import 'package:sorioo/common/widgets/alert_dialogs.dart';
import 'package:sorioo/common/widgets/profile_header_widget.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/features/auth/presentation/account/account_controller.dart';
import 'package:sorioo/features/profile/application/user_type_controller.dart';
import 'package:sorioo/routing/app_routes.dart';

class BuyerView extends ConsumerStatefulWidget {
  const BuyerView({super.key});

  @override
  ConsumerState<BuyerView> createState() => _BuyerViewState();
}

class _BuyerViewState extends ConsumerState<BuyerView> {
  Future<void> _submitLogOut() async {
    final sub = ref.listenManual(accountControllerProvider.notifier, (_, __) {});

    final success = await sub.read().logOut();

    sub.close();

    if (success && context.mounted) {
      ref.read(navProvider.notifier).onIndexChanged(0);
      GoRouter.of(context).goNamed(AppRoutes.home.name);
    }
  }

  Future<void> makeSeller() async {
    await showAlertDialog(
      context: context,
      title: 'Emin misin',
      defaultActionText: 'Devam Et',
      cancelActionText: 'İptal Et',
      content: 'Hizmet veren olmak istediğinden emin misin?',
    ).then((value) async {
      if (value!) {
        //User wants to be seller
        final sub = ref.listenManual(userTypeControllerProvider.notifier, (_, __) {});

        await sub.read().makeSeller();
        sub.close();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: kBigPadding,
          child: Column(
            children: [
              const ProfileHeaderWidget(),
              // const AppGap.semiBig(),
              // const ChangeUserTypeWidget(),
              // const AppGap.semiBig(),

              ColoredBox(
                color: Colors.black12,
                child: ListTile(
                  leading: const Icon(IconlyBold.star),
                  trailing: const Icon(IconlyBold.arrow_right_2),
                  title: AppText(
                    'Hizmet Veren Ol',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  onTap: makeSeller,
                ),
              ),

              ColoredBox(
                color: Colors.black12,
                child: ListTile(
                  leading: const Icon(IconlyBold.edit),
                  trailing: const Icon(IconlyBold.arrow_right_2),
                  title: AppText(
                    'Profilim',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  onTap: () => GoRouter.of(context).pushNamed(
                    AppRoutes.buyerProfile.name,
                  ),
                ),
              ),
              Container(
                color: Colors.black12,
                child: ListTile(
                  leading: const Icon(IconlyBold.logout),
                  trailing: const Icon(IconlyBold.arrow_right_2),
                  title: AppText(
                    'Oturumu Kapat',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  onTap: _submitLogOut,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
