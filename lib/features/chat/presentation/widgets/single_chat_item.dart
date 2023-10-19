import 'package:flutter/material.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/font.dart';

import 'package:sorioo/core/theme/widgets/text/app_text.dart';

class SingleChatItem extends StatelessWidget {
  const SingleChatItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      contentPadding: kSemiSmallPadding,
      leading: CircleAvatar(
        child: Image.asset('assets/images/default-avatar.png'),
      ),
      title: const AppText(
        'mustafauymaz',
        style: TextStyle(
          fontFamily: TFonts.primaryRegular,
          fontSize: 20,
          color: kLightTextColor,
        ),
      ),
      trailing: const AppText(
        '1 saat önce',
        style: TextStyle(
          fontFamily: TFonts.primaryRegular,
          fontSize: 15,
          color: kLightTextColor,
        ),
      ),
    );
  }
}
