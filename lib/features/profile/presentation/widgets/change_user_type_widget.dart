import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorioo/common/providers/local_user_provider.dart';
import 'package:sorioo/common/widgets/alert_dialogs.dart';
import 'package:sorioo/core/constants/preferences_keys.dart';
import 'package:sorioo/core/constants/user_roles.dart';
import 'package:sorioo/core/init/cache_manager.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/features/profile/application/user_type_controller.dart';

class ChangeUserTypeWidget extends ConsumerStatefulWidget {
  const ChangeUserTypeWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChangeUserTypeWidgetState();
}

class _ChangeUserTypeWidgetState extends ConsumerState<ChangeUserTypeWidget> {
  UserRoles userType = UserRoles.buyer;

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
    return Consumer(
      builder: (context, ref, child) {
        final user = ref.watch(
          localUserServiceProvider,
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
                onTap: makeSeller,
                child: Container(
                  padding: kSemiSmallPadding,
                  decoration: BoxDecoration(
                    color: user.isSeller! ? Theme.of(context).colorScheme.secondary : const Color(0xFFE7EFF2),
                  ),
                  child: Center(
                    child: AppText(
                      user.isSeller! ? 'Hizmet Verensin' : 'Hizmet Veren Ol',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
