import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:sorioo/common/providers/nav_notifier.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/bottomnav/fab_bottom_app_bar.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/features/home/presentation/navbar/navbar_screens.dart';

class ScaffoldWithNavBar extends ConsumerWidget {
  const ScaffoldWithNavBar({
    required this.child,
    super.key,
  });

  final Widget child;

  // FloatingActionButton _floatingActionButton(BuildContext context) {
  //   return FloatingActionButton.large(
  //     onPressed: () {},
  //     backgroundColor: Colors.black,
  //     tooltip: 'Hızlı Soru Sor',
  //     child: const Icon(IconlyLight.plus, color: Colors.white, size: 50),
  //   );
  // }

  // Widget _bottomNavigationBar(BuildContext context, WidgetRef ref) {
  //   return FABBottomAppBar(
  //     items: [
  //       FABBottomAppBarItem(iconData: IconlyLight.home, text: ''),
  //       FABBottomAppBarItem(iconData: IconlyLight.category, text: ''),
  //       FABBottomAppBarItem(iconData: IconlyLight.plus, text: ''),
  //       FABBottomAppBarItem(iconData: IconlyLight.message, text: ''),
  //       FABBottomAppBarItem(iconData: IconlyLight.profile, text: ''),
  //     ],
  //     height: 60,
  //     iconSize: 30,
  //     backgroundColor: Theme.of(context).scaffoldBackgroundColor,
  //     color: kTextColor,
  //     selectedColor: Theme.of(context).colorScheme.primary,
  //     onTabSelected: (int index) => _onItemTapped(index, context, ref),
  //   );
  // }

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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navIndex = ref.watch(navProvider.select((value) => value.index));
    return SafeArea(
      child: Scaffold(
        // appBar: PreferredSize(
        //   preferredSize: Size(MediaQuery.of(context).size.width, 70),
        //   child: Padding(
        //     padding: const EdgeInsets.only(
        //       left: 20,
        //       right: 20,
        //       top: 20,
        //       bottom: 20,
        //     ),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         if (hasAppBar) ...[
        //           IconButton(
        //             onPressed: () {
        //               GoRouter.of(context).pop();
        //             },
        //             icon: const Icon(
        //               Icons.arrow_back,
        //             ),
        //           ),
        //           AppText(
        //             title ?? '',
        //             style: Theme.of(context).textTheme.bodyMedium,
        //           ),
        //         ] else ...[
        //           Image.asset(
        //             'assets/images/logo.png',
        //             width: 100,
        //           ),
        //         ],
        //         const Icon(
        //           IconlyLight.notification,
        //           size: 30,
        //           color: kTextColor,
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        extendBody: true,
        body: child,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (value) => _onItemTapped(value, context, ref),
          currentIndex: navIndex,
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
