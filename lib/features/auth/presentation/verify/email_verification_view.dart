import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:sorioo/common/extensions/async_value_ui.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/features/auth/presentation/register/route_args/email_register_second_page_args.dart';
import 'package:sorioo/features/auth/presentation/verify/email_verify_controller.dart';
import 'package:sorioo/routing/app_routes.dart';

class EmailVerificationView extends ConsumerStatefulWidget {
  const EmailVerificationView({required this.args, super.key});

  final EmailVerifyPageArgs args;

  @override
  ConsumerState<EmailVerificationView> createState() => _EmailVerificationViewState();
}

class _EmailVerificationViewState extends ConsumerState<EmailVerificationView> {
  final defaultPinTheme = PinTheme(
    width: 50,
    height: 50,
    textStyle: const TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(30, 60, 87, 1),
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      color: const Color.fromRGBO(222, 231, 240, .57),
      border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: kSmallBorderRadius,
    ),
  );

  final codeController = TextEditingController();

  String get code => codeController.text;

  Future<void> _submitVerify() async {
    if (code.isNotEmpty) {
      final controller = ref.read(emailVerifyControllerProvider.notifier);
      final response = await controller.verifySubmit(widget.args.email, code);

      if (response && context.mounted) {
        GoRouter.of(context).goNamed(AppRoutes.home.name);
      }
    }
  }

  Future<void> _resendVerify() async {
    final controller = ref.read(emailVerifyControllerProvider.notifier);
    final response = await controller.resendConfirmation(widget.args.email);

    if (response) {
      codeController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(emailVerifyControllerProvider, (_, state) {
      state.showToastMessageOnError(context);
    });

    final state = ref.watch(emailVerifyControllerProvider);

    return state.isLoading
        ? Center(
            child: CircularProgressIndicator(color: Theme.of(context).colorScheme.primary),
          )
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              iconTheme: const IconThemeData(color: kTextColor),
            ),
            body: Padding(
              padding: kBigHorPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    'Son bir adım kaldı',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const AppGap.small(),
                  AppText(
                    '${widget.args.email} adresinize gönderdiğimiz aktivasyon kodunu aşağıya girerek hesabınızı onaylayabilirsiniz.',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const AppGap.extraBig(),
                  Pinput(
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: defaultPinTheme.copyWith(
                      decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).colorScheme.primary),
                        borderRadius: kSmallBorderRadius,
                      ),
                    ),
                    submittedPinTheme: defaultPinTheme.copyWith(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    autofocus: true,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    length: 6,
                    controller: codeController,
                    onCompleted: (value) => _submitVerify(),
                  ),
                  const AppGap.extraBig(),
                  TextButton(
                    onPressed: _resendVerify,
                    child: AppText(
                      'Yeniden Gönder',
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
