import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:sorioo/common/providers/nav_notifier.dart';
import 'package:sorioo/core/theme/widgets/bottomnav/fab_bottom_app_bar.dart';
import 'package:sorioo/features/home/presentation/navbar/navbar_screens.dart';

class ScaffoldWithNavBar extends ConsumerWidget {
  const ScaffoldWithNavBar({required this.child, super.key});

  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      extendBody: true,
      body: child,
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        clipBehavior: Clip.hardEdge,
        child: _bottomNavigationBar(context, ref),
      ),
      floatingActionButton: _floatingActionButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  FloatingActionButton _floatingActionButton(BuildContext context) {
    return FloatingActionButton.large(
      onPressed: () {},
      backgroundColor: Colors.black,
      tooltip: 'Hızlı Soru Sor',
      child: const Icon(IconlyLight.plus, color: Colors.white, size: 50),
    );
  }

  Widget _bottomNavigationBar(BuildContext context, WidgetRef ref) {
    return FABBottomAppBar(
      items: [
        FABBottomAppBarItem(iconData: IconlyLight.home, text: ''),
        FABBottomAppBarItem(iconData: IconlyLight.category, text: ''),
        FABBottomAppBarItem(iconData: IconlyLight.message, text: ''),
        FABBottomAppBarItem(iconData: IconlyLight.profile, text: ''),
      ],
      height: 60,
      iconSize: 30,
      backgroundColor: Colors.black,
      color: const Color(0xffffffff),
      selectedColor: Theme.of(context).colorScheme.primary,
      onTabSelected: (int index) => _onItemTapped(index, context, ref),
    );
  }

  // static int _calculateSelectedIndex(BuildContext context) {
  //   final location = GoRouterState.of(context).location;
  //   if (NavbarScreens.mapim.keys.contains(location)) {
  //     return NavbarScreens.mapim.keys.toList().indexOf(location);
  //   } else {
  //     return _baseRoute(location);
  //   }
  // }

  static int _baseRoute(String location) {
    var baseRoute = 0;

    for (var i = 0; i < NavbarScreens.mapim.keys.length; i++) {
      if (location.startsWith(NavbarScreens.mapim.keys.toList()[i])) {
        baseRoute = i;
      }
    }
    return baseRoute;
  }

  void _onItemTapped(int index, BuildContext context, WidgetRef ref) {
    ref.read(navProvider.notifier).onIndexChanged(index);
    GoRouter.of(context).go(NavbarScreens.mapim.keys.elementAt(index));
  }
}
