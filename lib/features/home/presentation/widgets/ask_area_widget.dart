import 'package:flutter/material.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/font.dart';
import 'package:sorioo/core/theme/widgets/button/app_button.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';

class AskAreaWidget extends StatelessWidget {
  const AskAreaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 35),
          child: Container(
            height: 230,
            decoration: BoxDecoration(
              color: kColorWhite,
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: Padding(
              padding: kSemiBigPadding,
              child: Column(
                children: [
                  AppText(
                    'Aklına takılanı hemen sor!',
                    style: Theme.of(context).textTheme.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                  AppText(
                    'Anında cevap al',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontFamily: TFonts.primaryRegular,
                        ),
                  ),
                  const Spacer(),
                  const AppPrimaryButton(
                    title: 'Hemen Başla',
                  ),
                ],
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.zero,
              width: 60,
              height: 60,
              child: CircleAvatar(
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Image.asset(
                  'assets/images/question-mark.png',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
