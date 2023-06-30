import 'package:flutter/material.dart';
import 'package:sorioo/features/home/presentation/navbar/navbar_screens.dart';

class CreateNavBarItems {
  const CreateNavBarItems._();

  static List<BottomNavigationBarItem> createBottomNavItems() {
    List<BottomNavigationBarItem> bottomNavs = [];

    for (var i = 0; i < NavbarScreens.mapim.length; i++) {
      bottomNavs.add(
        BottomNavigationBarItem(
          icon: Icon(NavbarScreens.mapim.values.elementAt(i)["icon"]),
          label: NavbarScreens.mapim.values.elementAt(i)["label"],
        ),
      );
    }

    return bottomNavs;
  }
}
