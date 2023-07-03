import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:sorioo/core/theme/widgets/bottomnav/fab_bottom_app_bar.dart';
import 'package:sorioo/features/home/presentation/navbar/navbar_screens.dart';

import 'navbar_items.dart';

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({Key? key, required this.child}) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: child,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        clipBehavior: Clip.hardEdge,
        child: _bottomNavigationBar(context),
      ),
      floatingActionButton: _floatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  FloatingActionButton _floatingActionButton(BuildContext context) {
    return FloatingActionButton.large(
      onPressed: () {},
      backgroundColor: Colors.black,
      tooltip: "Hızlı Soru Sor",
      child: const Icon(IconlyLight.plus, color: Colors.white, size: 50),
    );
  }

  Widget _bottomNavigationBar(BuildContext context) {
    return FABBottomAppBar(
      items: [
        FABBottomAppBarItem(iconData: IconlyLight.home, text: ""),
        FABBottomAppBarItem(iconData: IconlyLight.category, text: ""),
        FABBottomAppBarItem(iconData: IconlyLight.message, text: ""),
        FABBottomAppBarItem(iconData: IconlyLight.profile, text: ""),
      ],
      height: 60,
      iconSize: 30,
      backgroundColor: Colors.black,
      color: const Color(0xfffffffff),
      selectedColor: Theme.of(context).colorScheme.primary,
      onTabSelected: (int index) => _onItemTapped(index, context),
    );
  }

  // BottomAppBar _bottomNavigationBar(BuildContext context) {
  //   return BottomAppBar(
  //     color: Colors.black,
  //     elevation: 0,
  //     child: Padding(
  //       padding: kSemiSmallPadding,
  //       child: Row(
  //         mainAxisSize: MainAxisSize.max,
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           IconButton(
  //             onPressed: () {},
  //             icon: Icon(
  //               IconlyLight.home,
  //               color: Theme.of(context).colorScheme.primary,
  //             ),
  //           ),
  //           IconButton(
  //             onPressed: () {},
  //             icon: Icon(
  //               IconlyLight.category,
  //               color: Theme.of(context).colorScheme.primary,
  //             ),
  //           ),
  //           const AppGap.extraBig(),
  //           IconButton(
  //             onPressed: () {},
  //             icon: Icon(
  //               IconlyLight.message,
  //               color: Theme.of(context).colorScheme.primary,
  //             ),
  //           ),
  //           IconButton(
  //             onPressed: () {},
  //             icon: Icon(
  //               IconlyLight.profile,
  //               color: Theme.of(context).colorScheme.primary,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (NavbarScreens.mapim.keys.contains(location)) {
      return NavbarScreens.mapim.keys.toList().indexOf(location);
    } else {
      return _baseRoute(location);
    }
  }

  static int _baseRoute(String location) {
    int baseRoute = 0;

    for (var i = 0; i < NavbarScreens.mapim.keys.length; i++) {
      if (location.startsWith(NavbarScreens.mapim.keys.toList()[i])) {
        baseRoute = i;
      }
    }
    return baseRoute;
  }

  void _onItemTapped(int index, BuildContext context) {
    GoRouter.of(context).go(NavbarScreens.mapim.keys.elementAt(index));
  }
}
