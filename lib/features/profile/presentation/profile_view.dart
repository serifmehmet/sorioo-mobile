import 'package:flutter/material.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AppText("Profile"),
      ),
    );
  }
}
