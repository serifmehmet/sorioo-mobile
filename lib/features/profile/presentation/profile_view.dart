import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:sorioo/common/providers/local_user_provider.dart';
import 'package:sorioo/core/constants/preferences_keys.dart';
import 'package:sorioo/core/init/cache_manager.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/features/auth/presentation/account/account_controller.dart';
import 'package:sorioo/routing/app_routes.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  Future<void> _submitLogOut() async {
    final accountController = ref.read(accountControllerProvider.notifier);

    final success = await accountController.logOut();

    if (success && context.mounted) {
      await context.pushNamed(AppRoutes.home.name);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(
      localUserProviderProvider(
        userId: CacheManager.instance.getStringValue(
          PreferencesKeys.userId,
        ),
      ),
    );
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
                Container(
                  padding: kSemiBigPadding,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        user.fullName,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const AppGap.small(),
                      AppText(
                        user.email,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
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
