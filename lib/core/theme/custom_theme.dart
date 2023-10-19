import 'package:flutter/material.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/font.dart';

class CustomTheme {
  static ThemeData get appTheme {
    return ThemeData(
      primaryColor: kPrimaryColor,
      scaffoldBackgroundColor: const Color(0xffF5F5F5),
      colorScheme: const ColorScheme.light(
        primary: kPrimaryColor,
        secondary: kSecondaryColor,
        error: Color(0xffF75555),
      ),
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontFamily: TFonts.primaryBold,
          fontSize: 48,
          color: kTextColor,
        ),
        displayMedium: TextStyle(
          fontFamily: TFonts.primaryBold,
          fontSize: 40,
          color: kTextColor,
        ),
        displaySmall: TextStyle(
          fontFamily: TFonts.primaryBold,
          fontSize: 32,
          color: kTextColor,
        ),
        bodyMedium: TextStyle(
          fontFamily: TFonts.primaryRegular,
          fontSize: 14,
          color: kTextColor,
        ),
        bodyLarge: TextStyle(
          fontFamily: TFonts.primaryBold,
          fontSize: 20,
          color: kTextColor,
        ),
      ),
    );
  }
}
