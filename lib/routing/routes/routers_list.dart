import 'package:go_router/go_router.dart';
import 'package:sorioo/routing/routes/route_category.dart';
import 'package:sorioo/routing/routes/route_message.dart';
import 'package:sorioo/routing/routes/route_profile.dart';
import 'package:sorioo/routing/routes/router_home.dart';

class NavigationRouterList {
  final List<RouteBase> routeList = <RouteBase>[
    RouterHome().routeHome,
    RouteCategory().routeCategory,
    RouteMessage().routeMessage,
    RouteProfile().routeProfile,
  ];
}
