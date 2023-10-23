import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorioo/common/providers/local_user_provider.dart';
import 'package:sorioo/core/constants/preferences_keys.dart';
import 'package:sorioo/core/init/cache_manager.dart';
import 'package:sorioo/core/theme/font.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';

class HeaderAreaWidget extends ConsumerWidget {
  const HeaderAreaWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loggedIn = CacheManager.instance.getBoolValue(PreferencesKeys.isLoggedIn);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (loggedIn) ...[
          AppText(
            'Merhaba, ${ref.watch(
              localUserServiceProvider.select(
                (value) => value.fullName,
              ),
            )}',
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontStyle: FontStyle.italic,
                  fontSize: 28,
                ),
          ),
        ] else ...[
          AppText(
            'Merhaba',
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontStyle: FontStyle.italic,
                ),
          ),
        ],
        const AppGap.small(),
        AppText(
          "Sorioo'ya hoş geldin!",
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontFamily: TFonts.primaryRegular,
              ),
        ),
      ],
    );
  }
}
