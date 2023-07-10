import 'package:flutter/material.dart';
import 'package:sorioo/routing/app_navigator.dart';

extension NavigationHelpersExt on BuildContext {
  AppNavigator get navigator => AppNavigatorImpl(this);
}
