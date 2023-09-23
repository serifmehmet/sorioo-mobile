import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sorioo/features/auth/presentation/register/route_args/email_register_second_page_args.dart';
import 'package:sorioo/features/seller/presentation/seller_bank_info/route_args/seller_bank_info_list_page_args.dart';
import 'package:sorioo/features/seller/presentation/seller_profile/route_args/seller_profile_edit_page_args.dart';
import 'package:sorioo/routing/app_routes.dart';

abstract class AppNavigator {
  void pushRegisterSecondStep(EmailRegisterSecondPageArgs args);
  void pushRegisterVerify(EmailVerifyPageArgs args);
  void pushSellerProfileEdit(SellerProfileEditPageArgs args);
  void pushSellerBankInfoList(SellerBankInfoListPageArgs args);
}

class AppNavigatorImpl implements AppNavigator {
  AppNavigatorImpl(this.context);
  final BuildContext context;

  @override
  void pushRegisterSecondStep(EmailRegisterSecondPageArgs args) {
    context.pushNamed(AppRoutes.emailRegisterLastStep.name, extra: args);
  }

  @override
  void pushRegisterVerify(EmailVerifyPageArgs args) {
    context.pushNamed(AppRoutes.emailRegisterVerification.name, extra: args);
  }

  @override
  void pushSellerProfileEdit(SellerProfileEditPageArgs args) {
    context.pushNamed(AppRoutes.editSellerProfile.name, extra: args);
  }

  @override
  void pushSellerBankInfoList(SellerBankInfoListPageArgs args) {
    context.pushNamed(AppRoutes.sellerBankInfo.name, extra: args);
  }
}
