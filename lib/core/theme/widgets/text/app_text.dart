import 'package:flutter/material.dart';
import 'package:sorioo/core/theme/font.dart';

enum AppTextLevel {
  bodyXLarge,
  bodyLarge,
  bodyMedium,
  bodySmall,
  bodyXSmall,
}

enum AppTextWeight {
  regular,
  bold,
}

class AppText extends StatelessWidget {
  final String data;
  final AppTextLevel level;
  final AppTextWeight? weight;
  final Color? color;
  final double? fontSize;
  final int? maxLines;
  final String fontFamily;
  final TextStyle? style;
  final TextAlign? textAlign;

  const AppText(
    this.data, {
    Key? key,
    this.level = AppTextLevel.bodyMedium,
    this.weight,
    this.color,
    this.fontSize,
    this.maxLines,
    this.style,
    this.textAlign,
  })  : fontFamily = TFonts.primaryBold,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: TextStyle(
        color: color ?? const Color(0xffFFFFFF),
        fontFamily: fontFamily,
        fontSize: 16,
      ),
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}
