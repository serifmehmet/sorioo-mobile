import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:sorioo/core/theme/constants.dart';

class PreferredAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const PreferredAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(MediaQuery.of(context).size.width, 70),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 100,
            ),
            const Icon(
              IconlyLight.notification,
              size: 30,
              color: kTextColor,
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(
        70,
      );
}
