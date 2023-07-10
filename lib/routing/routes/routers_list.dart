import 'package:go_router/go_router.dart';
import 'route_category.dart';
import 'route_message.dart';
import 'route_profile.dart';
import 'router_home.dart';

class NavigationRouterList {
  final List<RouteBase> routeList = <RouteBase>[
    RouterHome().routeHome,
    RouteCategory().routeCategory,
    RouteMessage().routeMessage,
    RouteProfile().routeProfile,
  ];
}
