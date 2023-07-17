import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/button/app_button.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/core/theme/widgets/text/app_text_form_field_widget.dart';
import 'package:sorioo/core/validation/string_validators.dart';
import 'package:sorioo/features/auth/presentation/register/email_register_validators.dart';
import 'package:sorioo/features/auth/presentation/register/route_args/email_register_second_page_args.dart';
import 'package:sorioo/routing/navigation_helpers.dart';

class EmailRegisterView extends ConsumerStatefulWidget {
  const EmailRegisterView({super.key});

  @override
  ConsumerState<EmailRegisterView> createState() => _EmailRegisterViewState();
}

class _EmailRegisterViewState extends ConsumerState<EmailRegisterView> with RegisterValidators {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();

  final _node = FocusScopeNode();

  String get email => emailController.text;
  String get name => nameController.text;
  String get lastName => lastNameController.text;

  var _submitted = false;

  @override
  void dispose() {
    _node.dispose();
    emailController.dispose();
    nameController.dispose();
    lastNameController.dispose();

    super.dispose();
  }

  Future<void> _submit() async {
    setState(() {
      _submitted = true;
    });

    if (formKey.currentState!.validate()) {
      //Set user info and then move to next step

      context.navigator.pushRegisterSecondStep(
        EmailRegisterSecondPageArgs(
          email: email,
          name: name,
          lastName: lastName,
        ),
      );
    }
  }

  void _nameEditingComplete() {
    if (canSubmitName(name)) {
      _node.nextFocus();
    }
  }

  void _lastNameEditingComplete() {
    if (canSubmitLastName(lastName)) {
      _node.nextFocus();
    }
  }

  void _emailEditingComplete() {
    if (canSubmitEmail(email)) {
      _submit();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconTheme: const IconThemeData(color: kTextColor),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: kBigHorPadding,
          child: FocusScope(
            node: _node,
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    'E-Posta ile Katıl',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const AppGap.extraBig(),
                  AppTextFormField(
                    enabled: true,
                    autofocus: false,
                    controller: nameController,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    hintText: 'Adınız',
                    validator: (name) => !_submitted ? null : nameErrorText(name ?? ''),
                    onEditingComplete: _nameEditingComplete,
                  ),
                  const AppGap.semiBig(),
                  AppTextFormField(
                    enabled: true,
                    autofocus: false,
                    controller: lastNameController,
                    textInputAction: TextInputAction.next,
                    textInputType: TextInputType.name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    hintText: 'Soyadınız',
                    validator: (lastName) => !_submitted ? null : lastNameErrorText(lastName ?? ''),
                    onEditingComplete: _lastNameEditingComplete,
                  ),
                  const AppGap.semiBig(),
                  AppTextFormField(
                    enabled: true,
                    autofocus: false,
                    controller: emailController,
                    textInputAction: TextInputAction.done,
                    textInputType: TextInputType.emailAddress,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    hintText: 'E-Posta Adresiniz',
                    validator: (email) => !_submitted ? null : emailErrorText(email ?? ''),
                    onEditingComplete: _emailEditingComplete,
                    inputFormatters: <TextInputFormatter>[
                      ValidatorInputFormatter(
                        editingValidator: EmailEditingRegexValidator(),
                      ),
                    ],
                  ),
                  const AppGap.extraBig(),
                  AppPrimaryButton(
                    title: 'Sonraki Adım',
                    onTap: _submit,
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
