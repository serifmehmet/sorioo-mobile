import 'package:flutter/material.dart';
import 'package:sorioo/core/theme/widgets/button/app_button.dart';
import 'package:tap_builder/tap_builder.dart';

class AppSecondaryButton extends StatelessWidget {
  final Icon? icon;
  final String? title;
  final MainAxisSize mainAxisSize;
  final VoidCallback? onTap;
  final BoxShape? boxShape;

  const AppSecondaryButton({
    super.key,
    this.icon,
    this.title,
    this.mainAxisSize = MainAxisSize.min,
    this.onTap,
    this.boxShape,
  }) : assert(icon != null || title != null);

  @override
  Widget build(BuildContext context) {
    return TapBuilder(
      onTap: onTap,
      builder: (context, state, isFocused) {
        switch (state) {
          case TapState.pressed:
            return Semantics(
              enabled: true,
              selected: true,
              child: AppButtonLayout.active(
                title: title,
                mainAxisSize: mainAxisSize,
                icon: icon,
                boxShape: boxShape,
              ),
            );
          default:
            return Semantics(
              enabled: true,
              selected: true,
              child: AppButtonLayout.disabled(
                title: title,
                mainAxisSize: mainAxisSize,
                icon: icon,
                boxShape: boxShape,
              ),
            );
        }
      },
    );
  }
}
