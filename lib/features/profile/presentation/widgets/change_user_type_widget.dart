import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorioo/common/providers/local_user_provider.dart';
import 'package:sorioo/core/constants/preferences_keys.dart';
import 'package:sorioo/core/constants/user_roles.dart';
import 'package:sorioo/core/init/cache_manager.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';

class ChangeUserTypeWidget extends ConsumerStatefulWidget {
  const ChangeUserTypeWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChangeUserTypeWidgetState();
}

class _ChangeUserTypeWidgetState extends ConsumerState<ChangeUserTypeWidget> {
  UserRoles userType = UserRoles.buyer;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(
      localUserProvider(
        userId: CacheManager.instance.getStringValue(PreferencesKeys.userId),
      ),
    );
    return Padding(
      padding: kSemiBigVertPadding,
      child: Row(
        children: [
          GestureDetector(
            onTap: () => setState(() {
              // user.userRole == UserRoles.buyer;
            }),
            child: Container(
              padding: kSemiSmallPadding,
              decoration: BoxDecoration(
                color: !user.isSeller! ? Theme.of(context).colorScheme.secondary : const Color(0xFFE7EFF2),
              ),
              child: Center(
                child: AppText(
                  !user.isSeller! ? 'Alıcısın' : 'Alıcı Ol',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () => setState(() {
              userType = UserRoles.seller;
            }),
            child: Container(
              padding: kSemiSmallPadding,
              decoration: BoxDecoration(
                color: user.isSeller! ? Theme.of(context).colorScheme.secondary : const Color(0xFFE7EFF2),
              ),
              child: Center(
                child: AppText(
                  user.isSeller! ? 'Hizmet Veren Ol' : 'Hizmet Verensin',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
