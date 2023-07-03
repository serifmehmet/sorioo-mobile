import 'package:flutter/material.dart';

import '../../../../core/theme/constants.dart';
import '../../../../core/theme/font.dart';
import '../../../../core/theme/gap.dart';
import '../../../../core/theme/widgets/text/app_text.dart';

class CustomHeader extends SliverPersistentHeaderDelegate {
  CustomHeader({
    required double collapsedHeight,
    required double expandedHeight,
  })  : minExtent = collapsedHeight,
        maxExtent = expandedHeight;

  @override
  final double minExtent;

  @override
  final double maxExtent;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final backgroundColor = Theme.of(context).colorScheme.primary;
    final scale = 1 - shrinkOffset / maxExtent;
    final isReduced = shrinkOffset >= maxExtent * 0.12;

    double avatarRadius = 20.0 * scale;
    avatarRadius = avatarRadius > 16 ? avatarRadius : 16.0;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: isReduced
            ? null
            : const BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 30,
          left: 20,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(radius: avatarRadius, backgroundImage: Image.asset("assets/images/dummy-profile.png").image),
                    const AppGap.regular(),
                    SizedBox(
                      width: 200,
                      child: AppText(
                        "Mehmet Şerif, hoş geldin",
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
            ),
            if (!isReduced)
              AppText(
                "Nasıl yardımcı olabiliriz?",
                style: TextStyle(
                  fontFamily: TFonts.primaryBold,
                  fontSize: 40 * scale,
                  color: kTextColor,
                ),
              )
          ],
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(_) => true;
}
