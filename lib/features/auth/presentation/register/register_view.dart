import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/button/app_button.dart';
import 'package:sorioo/core/theme/widgets/button/app_secondary_button.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/routing/app_routes.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: const IconThemeData(color: kTextColor),
      ),
      body: SafeArea(
        child: Padding(
          padding: kSemiBigPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                "assets/images/sorioo-logo.png",
                width: 100,
              ),
              const AppGap.regular(),
              AppText(
                "Sorioo'ya katıl",
                color: kTextColor,
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const AppGap.semiBig(),
              AppText(
                "Soroo'ya katılın ve işinin uzmanı kişilere sorun. Sorioo",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const AppGap.big(),
              AppPrimaryButton(
                title: "E-Posta ile Katıl",
                onTap: () => context.pushNamed(AppRoutes.emailRegister.name),
              ),
              const AppGap.regular(),
              const Divider(
                color: kTextColor,
                thickness: 0.4,
                height: 50,
              ),
              const AppSecondaryButton(title: "Google ile Katıl")
            ],
          ),
        ),
      ),
    );
  }
}
