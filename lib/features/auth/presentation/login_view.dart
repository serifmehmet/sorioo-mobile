import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';
import 'package:sorioo/core/theme/colors.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/button/app_button.dart';
import 'package:sorioo/core/theme/widgets/text/app_text_form_field_widget.dart';

import '../../../core/theme/widgets/text/app_text.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kDefaultHorPadding,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const AppGap.extraBig(),
                Center(
                  child: Image.asset(
                    "assets/images/sorioo-logo.png",
                    width: 200,
                  ),
                ),
                const AppGap.big(),
                Text(
                  "Hesabınıza Giriş Yapın",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const AppGap.extraBig(),
                const AppTextFormField(
                  enabled: true,
                  autofocus: false,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.emailAddress,
                  hintText: "E-Posta Adresiniz",
                  prefixIcon: Icon(
                    IconlyLight.user,
                    color: AppColors.greySC700,
                  ),
                ),
                const AppGap.regular(),
                const AppTextFormField(
                  enabled: true,
                  autofocus: false,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.text,
                  obscureText: true,
                  hintText: "Şifreniz",
                  prefixIcon: Icon(
                    IconlyLight.user,
                    color: AppColors.greySC700,
                  ),
                ),
                const AppGap.regular(),
                AppPrimaryButton(
                  title: "Giriş Yap",
                  onTap: () {},
                ),
                const AppGap.extraBig(),
                AppText("Google ile Giriş Yap", color: Theme.of(context).colorScheme.secondary),
                const AppGap.extraBig(),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const AppText(
                          "Hesabın yok mu?",
                          color: AppColors.greySC500,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: AppText(
                            "Kayıt ol",
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
