import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorioo/common/providers/local_user_provider.dart';
import 'package:sorioo/core/constants/preferences_keys.dart';
import 'package:sorioo/core/init/cache_manager.dart';

import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/font.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';

class LoggedInUserArea extends ConsumerWidget {
  const LoggedInUserArea({required this.avatarRadius, required this.scale, super.key});

  final double avatarRadius;
  final double scale;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localUser = ref.watch(
      localUserServiceProvider,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: avatarRadius,
              backgroundImage: Image.network(localUser.googleProfilePictureUrl!).image,
            ),
            const AppGap.regular(),
            SizedBox(
              width: 200,
              child: AppText(
                '${localUser.fullName}, hoş geldin',
                style: TextStyle(
                  fontFamily: TFonts.primaryBold,
                  fontSize: 20 * scale,
                  color: kTextColor,
                ),
                maxLines: 3,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
