import 'package:flutter/material.dart';

import '../../core/theme/constants.dart';
import '../../core/theme/font.dart';
import '../../core/theme/gap.dart';
import '../../core/theme/widgets/text/app_text.dart';

class LoggedInUserArea extends StatelessWidget {
  const LoggedInUserArea({super.key, required this.avatarRadius, required this.scale});

  final double avatarRadius;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
