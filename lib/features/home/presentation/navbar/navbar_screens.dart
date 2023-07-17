import 'package:iconly/iconly.dart';
import 'package:sorioo/features/category/presentation/category_view.dart';
import 'package:sorioo/features/home/presentation/home.dart';
import 'package:sorioo/features/message/presentation/message_view.dart';
import 'package:sorioo/features/profile/presentation/profile_view.dart';

class NavbarScreens {
  const NavbarScreens._();

  static const Map<String, dynamic> mapim = {
    '/home': {
      'label': '',
      'icon': IconlyLight.home,
      'screen': HomeView(),
    },
    '/category': {
      'label': '',
      'icon': IconlyLight.category,
      'screen': CategoryView(),
    },
    '/message': {
      'label': '',
      'icon': IconlyLight.message,
      'screen': MessageView(),
    },
    '/profile': {
      'label': '',
      'icon': IconlyLight.profile,
      'screen': ProfileView(),
    },
  };

  static final initialLocation = NavbarScreens.mapim.keys.elementAt(0);
  static final homePath = NavbarScreens.mapim.keys.elementAt(0);
}
