import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:sorioo/common/providers/nav_notifier.dart';
import 'package:sorioo/common/widgets/profile_header_widget.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/features/auth/presentation/account/account_controller.dart';
import 'package:sorioo/routing/app_routes.dart';

class SellerView extends ConsumerStatefulWidget {
  const SellerView({super.key});

  @override
  ConsumerState<SellerView> createState() => _SellerViewState();
}

class _SellerViewState extends ConsumerState<SellerView> {
  Future<void> _submitLogOut() async {
    final sub = ref.listenManual(accountControllerProvider.notifier, (_, __) {});

    final success = await sub.read().logOut();

    sub.close();

    if (success && context.mounted) {
      // ref.read(navProvider.notifier).onIndexChanged(0);
      GoRouter.of(context).goNamed(AppRoutes.home.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: kBigPadding,
        child: Column(
          children: [
            const ProfileHeaderWidget(),
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
                  AppRoutes.sellerProfile.name,
                ),
              ),
            ),
            ColoredBox(
              color: Colors.black12,
              child: ListTile(
                leading: const Icon(IconlyBold.setting),
                trailing: const Icon(IconlyBold.arrow_right_2),
                title: AppText(
                  'Hesap Bilgilerim',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                onTap: () => GoRouter.of(context).pushNamed(
                  AppRoutes.sellerAccountInfo.name,
                ),
              ),
            ),
            ColoredBox(
              color: Colors.black12,
              child: ListTile(
                leading: const Icon(IconlyBold.document),
                trailing: const Icon(IconlyBold.arrow_right_2),
                title: AppText(
                  'İlanlarım',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                onTap: () => GoRouter.of(context).pushNamed(
                  AppRoutes.sellerAdverts.name,
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
    );
  }
}
