import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

enum AppGapSize {
  none,
  small,
  semiSmall,
  regular,
  semiBig,
  big,
  extrabig,
}

extension AppGapSizeExtension on AppGapSize {
  double getSpacing() {
    switch (this) {
      case AppGapSize.none:
        return 0;
      case AppGapSize.small:
        return 4;
      case AppGapSize.semiSmall:
        return 8;
      case AppGapSize.regular:
        return 12;
      case AppGapSize.semiBig:
        return 20;
      case AppGapSize.big:
        return 32;
      case AppGapSize.extrabig:
        return 40;
    }
  }
}

class AppGap extends StatelessWidget {
  final AppGapSize size;

  const AppGap(
    this.size, {
    Key? key,
  }) : super(key: key);

  const AppGap.small({
    Key? key,
  })  : size = AppGapSize.small,
        super(key: key);

  const AppGap.semiSmall({
    Key? key,
  })  : size = AppGapSize.semiSmall,
        super(key: key);

  const AppGap.regular({
    Key? key,
  })  : size = AppGapSize.regular,
        super(key: key);

  const AppGap.semiBig({
    Key? key,
  })  : size = AppGapSize.semiBig,
        super(key: key);

  const AppGap.big({
    Key? key,
  })  : size = AppGapSize.big,
        super(key: key);

  const AppGap.extraBig({
    Key? key,
  })  : size = AppGapSize.extrabig,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Gap(size.getSpacing());
  }
}
