import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

import 'package:sorioo/common/providers/nav_notifier.dart';

import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';

import 'package:sorioo/features/auth/presentation/account/account_controller.dart';

import 'package:sorioo/features/profile/presentation/widgets/change_user_type_widget.dart';
import 'package:sorioo/features/profile/presentation/widgets/profile_header_widget.dart';
import 'package:sorioo/routing/app_routes.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  Future<void> _submitLogOut() async {
    final sub = ref.listenManual(accountControllerProvider.notifier, (_, __) {});

    final success = await sub.read().logOut();

    sub.close();

    if (success && context.mounted) {
      ref.read(navProvider.notifier).onIndexChanged(0);
      GoRouter.of(context).goNamed(AppRoutes.home.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: kBigPadding,
            child: Column(
              children: [
                const ProfileHeaderWidget(),
                const AppGap.semiBig(),
                const ChangeUserTypeWidget(),
                const AppGap.semiBig(),
                Container(
                  color: Colors.black12,
                  child: ListTile(
                    leading: const Icon(IconlyBold.edit),
                    trailing: const Icon(IconlyBold.arrow_right_2),
                    title: AppText(
                      'Profili Düzenle',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    onTap: () => GoRouter.of(context).pushNamed(
                      AppRoutes.editProfile.name,
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
      ),
    );
  }
}
