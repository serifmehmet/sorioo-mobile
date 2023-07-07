import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/button/app_button.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/core/theme/widgets/text/app_text_form_field_widget.dart';
import 'package:sorioo/routing/app_routes.dart';

class EmailRegisterLastStepView extends StatelessWidget {
  const EmailRegisterLastStepView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: const IconThemeData(
          color: kTextColor,
        ),
      ),
      body: Padding(
        padding: kBigHorPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              "E-Posta ile Katıl",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const AppGap.extraBig(),
            const AppTextFormField(
              enabled: true,
              autofocus: false,
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.name,
              hintText: "Kullanıcı Adı",
            ),
            const AppGap.semiBig(),
            const AppTextFormField(
              enabled: true,
              autofocus: false,
              textInputAction: TextInputAction.next,
              textInputType: TextInputType.text,
              hintText: "Şifreniz",
              obscureText: true,
            ),
            const AppGap.semiBig(),
            const AppTextFormField(
              enabled: true,
              autofocus: false,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.text,
              hintText: "Şifre Tekrar",
              obscureText: true,
            ),
            const AppGap.extraBig(),
            AppPrimaryButton(
              onTap: () => context.pushNamed(AppRoutes.emailRegisterVerification.name),
              title: "Sonraki Adım",
            ),
          ],
        ),
      ),
    );
  }
}
