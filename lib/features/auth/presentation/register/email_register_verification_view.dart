import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';

class EmailRegisterVerificationView extends StatefulWidget {
  const EmailRegisterVerificationView({super.key});

  @override
  State<EmailRegisterVerificationView> createState() => _EmailRegisterVerificationViewState();
}

class _EmailRegisterVerificationViewState extends State<EmailRegisterVerificationView> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              "Son bir adım kaldı",
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const AppGap.small(),
            AppText(
              "E-Posta adresinize gönderdiğimiz aktivasyon kodunu aşağıya girerek hesabınızı onaylayabilirsiniz.",
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
              )),
              autofocus: true,
              crossAxisAlignment: CrossAxisAlignment.center,
              length: 6,
            )
          ],
        ),
      ),
    );
  }
}
