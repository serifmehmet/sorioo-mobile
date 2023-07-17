import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:sorioo/common/extensions/async_value_ui.dart';

import 'package:sorioo/core/theme/colors.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/button/app_button.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/core/theme/widgets/text/app_text_form_field_widget.dart';
import 'package:sorioo/core/validation/string_validators.dart';
import 'package:sorioo/features/auth/presentation/sign_in/sign_in_controller.dart';
import 'package:sorioo/features/auth/presentation/sign_in/sign_in_validators.dart';
import 'package:sorioo/routing/app_routes.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> with SignInValidators {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String get email => emailController.text;
  String get password => passwordController.text;

  final _node = FocusScopeNode();

  bool _submitted = false;

  @override
  void dispose() {
    _node.dispose();
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  void emailEditingCompleted() {
    if (canSubmitEmail(email)) {
      _node.nextFocus();
    }
  }

  void passwordEditingComplete() {
    if (canSubmitPassword(password)) {
      _submit();
    }
  }

  Future<void> _submit() async {
    setState(() {
      _submitted = true;
    });

    if (_formKey.currentState!.validate()) {
      FocusScope.of(context).requestFocus(FocusNode());
      final controller = ref.read(singInControllerProvider.notifier);
      final success = await controller.login(email, password);

      if (success && context.mounted) {
        GoRouter.of(context).goNamed(AppRoutes.home.name);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(singInControllerProvider);

    ref.listen<AsyncValue<dynamic>>(
      singInControllerProvider,
      (_, state) => state.showToastMessageOnError(context),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: kTextColor),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: kDefaultHorPadding,
          child: FocusScope(
            node: _node,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const AppGap.extraBig(),
                  Center(
                    child: Image.asset(
                      'assets/images/sorioo-logo.png',
                      width: 200,
                    ),
                  ),
                  const AppGap.big(),
                  Text(
                    'Hesabınıza Giriş Yapın',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const AppGap.extraBig(),
                  AppTextFormField(
                    enabled: true,
                    autofocus: false,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.emailAddress,
                    hintText: 'E-Posta Adresiniz',
                    prefixIcon: const Icon(
                      IconlyLight.user,
                      color: AppColors.greySC700,
                    ),
                    controller: emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) => !_submitted
                        ? null
                        : emailErrorText(
                            email!,
                          ),
                    onEditingComplete: emailEditingCompleted,
                    inputFormatters: <TextInputFormatter>[
                      ValidatorInputFormatter(
                        editingValidator: EmailEditingRegexValidator(),
                      )
                    ],
                  ),
                  const AppGap.regular(),
                  AppTextFormField(
                    enabled: true,
                    autofocus: false,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.text,
                    obscureText: true,
                    hintText: 'Şifreniz',
                    prefixIcon: const Icon(
                      IconlyLight.user,
                      color: AppColors.greySC700,
                    ),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: passwordController,
                    validator: (password) => !_submitted
                        ? null
                        : passwordErrorText(
                            password!,
                          ),
                    onEditingComplete: passwordEditingComplete,
                  ),
                  const AppGap.regular(),
                  AppPrimaryButton(
                    title: 'Giriş Yap',
                    onTap: _submit,
                    isLoading: state.isLoading,
                  ),
                  const AppGap.extraBig(),
                  AppText(
                    'Google ile Giriş Yap',
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  const AppGap.extraBig(),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const AppText(
                          'Hesabın yok mu?',
                          color: AppColors.greySC500,
                        ),
                        TextButton(
                          onPressed: () {
                            context.pushNamed(AppRoutes.register.name);
                          },
                          child: AppText(
                            'Kayıt ol',
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
