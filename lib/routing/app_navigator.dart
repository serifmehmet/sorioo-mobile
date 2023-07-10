import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sorioo/features/auth/presentation/register/route_args/email_register_second_page_args.dart';
import 'package:sorioo/routing/app_routes.dart';

abstract class AppNavigator {
  void pushRegisterSecondStep(EmailRegisterSecondPageArgs args);
  void pushRegisterVerify(EmailVerifyPageArgs args);
}

class AppNavigatorImpl implements AppNavigator {
  final BuildContext context;

  AppNavigatorImpl(this.context);

  @override
  void pushRegisterSecondStep(EmailRegisterSecondPageArgs args) {
    context.pushNamed(AppRoutes.emailRegisterLastStep.name, extra: args);
  }

  @override
  void pushRegisterVerify(EmailVerifyPageArgs args) {
    context.pushNamed(AppRoutes.emailRegisterVerification.name, extra: args);
  }
}
