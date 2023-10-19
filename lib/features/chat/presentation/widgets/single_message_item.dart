import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/font.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';

class SingleMessageItem extends ConsumerWidget {
  const SingleMessageItem({required this.userId, super.key});
  final int userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final aligment = (userId == 1) ? Alignment.centerRight : Alignment.centerLeft;
    return Container(
      alignment: aligment,
      child: Padding(
        padding: kSemiSmallPadding,
        child: Column(
          crossAxisAlignment: (userId == 1) ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          mainAxisAlignment: (userId == 1) ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            const AppText(
              'username',
              style: TextStyle(
                fontFamily: TFonts.primaryRegular,
                color: kTextColor,
              ),
            ),
            const AppGap.regular(),
            Container(
              decoration: BoxDecoration(
                color: userId == 1 ? Theme.of(context).colorScheme.primary : kGuestChatBubbleColor,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: kSemiSmallPadding,
              child: const AppText(
                'asdadada adas ada asad ',
                style: TextStyle(
                  fontFamily: TFonts.primaryRegular,
                  fontSize: 16,
                  color: kColorWhite,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
