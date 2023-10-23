import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:sorioo/common/providers/nav_notifier.dart';
import 'package:sorioo/core/theme/constants.dart';

class ScaffoldWithNavBar extends ConsumerWidget {
  const ScaffoldWithNavBar({
    // required this.child,
    required this.navigationShell,
    super.key,
  });

  // final Widget child;
  final StatefulNavigationShell navigationShell;

  // static int _baseRoute(String location) {
  //   var baseRoute = 0;

  //   for (var i = 0; i < NavbarScreens.mapim.keys.length; i++) {
  //     if (location.startsWith(NavbarScreens.mapim.keys.toList()[i])) {
  //       baseRoute = i;
  //     }
  //   }
  //   return baseRoute;
  // }

  void _onItemTapped(int index, BuildContext context, WidgetRef ref) {
    ref.read(navProvider.notifier).onIndexChanged(index);
    // GoRouter.of(context).go(NavbarScreens.mapim.keys.elementAt(index));
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: navigationShell,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (value) => _onItemTapped(value, context, ref),
          currentIndex: navigationShell.currentIndex,
          selectedItemColor: Theme.of(context).colorScheme.primary,
          selectedFontSize: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          iconSize: 28,
          unselectedItemColor: kTextColor,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                IconlyLight.home,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                IconlyLight.category,
              ),
              label: 'kategoriler',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                IconlyLight.plus,
              ),
              label: 'kategoriler',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                IconlyLight.message,
              ),
              label: 'kategoriler',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                IconlyLight.profile,
              ),
              label: 'kategoriler',
            ),
          ],
        ),
        // floatingActionButton: _floatingActionButton(context),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
