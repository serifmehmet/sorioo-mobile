import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorioo/common/extensions/async_value_ui.dart';
import 'package:sorioo/features/auth/domain/user.dart';
import 'package:sorioo/features/auth/presentation/register/email_register_controller.dart';
import 'package:sorioo/features/auth/presentation/register/email_register_validators.dart';
import 'package:sorioo/features/auth/presentation/register/route_args/email_register_second_page_args.dart';
import 'package:sorioo/routing/navigation_helpers.dart';
import '../../../../core/theme/constants.dart';
import '../../../../core/theme/gap.dart';
import '../../../../core/theme/widgets/button/app_button.dart';
import '../../../../core/theme/widgets/text/app_text.dart';
import '../../../../core/theme/widgets/text/app_text_form_field_widget.dart';

class EmailRegisterLastStepView extends ConsumerStatefulWidget {
  const EmailRegisterLastStepView({super.key, required this.args});

  final EmailRegisterSecondPageArgs args;

  @override
  ConsumerState<EmailRegisterLastStepView> createState() => _EmailRegisterLastStepViewState();
}

class _EmailRegisterLastStepViewState extends ConsumerState<EmailRegisterLastStepView> with RegisterValidators {
  final formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final passwordRetryController = TextEditingController();
  final userNameController = TextEditingController();

  final _node = FocusScopeNode();
  var _submitted = false;

  @override
  void dispose() {
    _node.dispose();
    userNameController.dispose();
    passwordController.dispose();
    passwordRetryController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    userNameController.text = widget.args.email.split("@").first;
    super.initState();
  }

  String get userName => userNameController.text;

  String get password => passwordController.text;

  String get passwordRetry => passwordRetryController.text;

  Future<void> _submit() async {
    setState(() {
      _submitted = true;
    });

    //Validate and send
    if (formKey.currentState!.validate()) {
      final controller = ref.read(emailRegisterControllerProvider.notifier);
      final user = User(
        userName: userName,
        password: password,
        email: widget.args.email,
        firstName: widget.args.name,
        lastName: widget.args.lastName,
      );
      final success = await controller.submit(user);
      if (success) {
        context.navigator.pushRegisterVerify(EmailVerifyPageArgs(email: widget.args.email));
      }
    }
  }

  void _userNameEditingComplete() {
    if (canSubmitUserName(userName)) {
      _node.nextFocus();
    }
  }

  void _passwordEditingComplete() {
    if (canSubmitFirstPassword(password)) {
      _node.nextFocus();
    }
  }

  void _passwordRetryEditingComplete() {
    if (canSubmitPasswordAll(password, passwordRetry)) {
      _submit();
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(
      emailRegisterControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: const IconThemeData(
          color: kTextColor,
        ),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: kBigHorPadding,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  "E-Posta ile Katıl",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const AppGap.extraBig(),
                AppText("Kullanıcı adı:", style: Theme.of(context).textTheme.bodyMedium),
                const AppGap.regular(),
                AppTextFormField(
                  enabled: true,
                  autofocus: false,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.name,
                  hintText: "Kullanıcı Adı",
                  controller: userNameController,
                  validator: (userName) => !_submitted ? null : userNameErrorText(userName ?? ''),
                  onEditingComplete: () => _userNameEditingComplete(),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const AppGap.semiBig(),
                AppTextFormField(
                  enabled: true,
                  autofocus: false,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.text,
                  hintText: "Şifreniz",
                  obscureText: true,
                  validator: (password) => !_submitted ? null : passwordErrorText(password ?? ''),
                  controller: passwordController,
                  onEditingComplete: () => _passwordEditingComplete(),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const AppGap.semiBig(),
                AppTextFormField(
                  enabled: true,
                  autofocus: false,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.text,
                  hintText: "Şifre Tekrar",
                  obscureText: true,
                  validator: (passwordRetry) => !_submitted ? null : passwordAllErrorText(password, passwordRetry ?? ''),
                  controller: passwordRetryController,
                  onEditingComplete: () => _passwordRetryEditingComplete(),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const AppGap.extraBig(),
                AppPrimaryButton(
                  onTap: () => _submit(),
                  title: "Sonraki Adım",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
