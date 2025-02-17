import 'package:flutter/material.dart';
import 'package:sorioo/core/theme/colors.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:tap_builder/tap_builder.dart';

import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    super.key,
    this.icon,
    this.title,
    this.onTap,
    this.boxShape,
    this.mainAxisSize = MainAxisSize.min,
    this.isLoading = false,
  }) : assert(
          icon != null || title != null,
        );
  final Icon? icon;
  final String? title;
  final MainAxisSize mainAxisSize;
  final VoidCallback? onTap;
  final BoxShape? boxShape;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return TapBuilder(
      onTap: onTap,
      builder: (context, state, hasFocus) {
        switch (state) {
          case TapState.pressed:
            return Semantics(
              enabled: true,
              selected: true,
              child: AppButtonLayout.disabled(
                title: title,
                mainAxisSize: mainAxisSize,
                icon: icon,
                boxShape: boxShape,
                disabledBackgroundColor: kTextColor,
                isLoading: isLoading,
              ),
            );
          default:
            return Semantics(
              enabled: true,
              selected: true,
              child: AppButtonLayout.active(
                title: title,
                mainAxisSize: mainAxisSize,
                icon: icon,
                boxShape: boxShape,
                isLoading: isLoading,
              ),
            );
        }
      },
    );
  }
}

enum AppButtonState {
  active,
  disabled,
}

class AppButtonLayout extends StatelessWidget {
  const AppButtonLayout.active({
    super.key,
    this.icon,
    this.title,
    this.mainAxisSize = MainAxisSize.min,
    this.disabledBackgroundColor,
    this.activeBackgroundColor,
    this.foregroundColor,
    this.fontColor,
    this.boxShape,
    this.hasImage = false,
    this.image,
    this.hasBorder = false,
    this.level,
    this.style,
    this.isLoading = false,
  })  : _state = AppButtonState.active,
        assert(icon != null || title != null, boxShape != null);

  const AppButtonLayout.disabled({
    super.key,
    this.icon,
    this.title,
    this.mainAxisSize = MainAxisSize.min,
    this.disabledBackgroundColor,
    this.activeBackgroundColor,
    this.foregroundColor,
    this.boxShape,
    this.fontColor,
    this.hasImage = false,
    this.image,
    this.hasBorder = false,
    this.level,
    this.style,
    this.isLoading = false,
  })  : _state = AppButtonState.disabled,
        assert(
          icon != null || title != null,
        );
  final Icon? icon;
  final String? title;
  final MainAxisSize mainAxisSize;
  final AppButtonState _state;
  final Color? activeBackgroundColor;
  final Color? disabledBackgroundColor;
  final Color? foregroundColor;
  final Color? fontColor;

  final BoxShape? boxShape;
  final bool hasBorder;
  final bool hasImage;
  final Widget? image;
  final AppTextLevel? level;
  final TextStyle? style;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final title = this.title;
    final icon = this.icon;
    final hasBoth = title != null && icon != null;
    final backgroundColor = () {
      switch (_state) {
        case AppButtonState.active:
          return activeBackgroundColor ?? kButtonColor;
        case AppButtonState.disabled:
          return disabledBackgroundColor ?? kTextColor;
      }
    }();

    return AnimatedContainer(
      duration: const Duration(microseconds: 100),
      width: 380,
      height: 58,
      decoration: BoxDecoration(
        borderRadius: boxShape != null ? null : kRegularBorderRadius,
        border: hasBorder ? Border.all(color: AppColors.greySC200) : null,
        shape: boxShape != null ? boxShape! : BoxShape.rectangle,
        color: backgroundColor,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: title != null ? 20 : 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (image != null) image!,
          if (image != null) const AppGap.regular(),
          if (title != null)
            isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : AppText(
                    color: fontColor ?? const Color(0xffFFFFFF),
                    level: level ?? AppTextLevel.bodyLarge,
                    title,
                  ),
          if (hasBoth) const AppGap.semiSmall(),
          if (icon != null) icon,
        ],
      ),
    );
  }
}
