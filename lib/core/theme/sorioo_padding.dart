import 'package:flutter/material.dart';

final class SoriooPadding extends EdgeInsets {
  const SoriooPadding._() : super.all(0);

  /// [SoriooPadding.allSmall] is 8
  const SoriooPadding.allSmall() : super.all(8);

  /// [SoriooPadding.allRegular] is 20
  const SoriooPadding.allRegular() : super.all(20);

  /// [SoriooPadding.allBig] is 30
  const SoriooPadding.allBig() : super.all(30);

  /// [SoriooPadding.symmetricHorizontalSmall] is 8
  const SoriooPadding.symmetricHorizontalSmall() : super.symmetric(horizontal: 8);

  /// [SoriooPadding.symmetricHorizontalRegular] is 20
  const SoriooPadding.symmetricHorizontalRegular() : super.symmetric(horizontal: 20);

  /// [SoriooPadding.symmetricHorizontalBig] is 30
  const SoriooPadding.symmetricHorizontalBig() : super.symmetric(horizontal: 30);

  /// [SoriooPadding.symmetricVerticalSmall] is 8
  const SoriooPadding.symmetricVerticalSmall() : super.symmetric(vertical: 8);

  /// [SoriooPadding.symmetricVerticalSmall] is 20
  const SoriooPadding.symmetricVerticalRegular() : super.symmetric(vertical: 20);

  /// [SoriooPadding.symmetricVerticalSmall] is 30
  const SoriooPadding.symmetricVerticalBig() : super.symmetric(vertical: 30);
}
