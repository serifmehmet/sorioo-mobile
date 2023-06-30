import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sorioo/core/constants/routing/routing_keys.dart';
import 'package:sorioo/features/home/presentation/navbar/scaffold_with_bottom_navbar.dart';
import 'package:sorioo/routing/app_routes.dart';
import 'package:sorioo/routing/routes/routers_list.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: RoutingKeys.rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: AppRoutes.home.path,
    routes: <RouteBase>[
      // GoRoute(
      //   name: AppRoutes.login.name,
      //   path: AppRoutes.login.path,
      //   pageBuilder: (context, state) => MaterialPage(
      //     key: state.pageKey,
      //     child: const LoginView(),
      //   ),
      // ),
      // GoRoute(
      //   name: AppRoutes.home.name,
      //   path: AppRoutes.home.path,
      //   pageBuilder: (context, state) => MaterialPage(
      //     key: state.pageKey,
      //     child: const HomeView(),
      //   ),
      // )
      ShellRoute(
        navigatorKey: RoutingKeys.shellNavigatorKey,
        builder: (context, state, child) {
          return ScaffoldWithNavBar(child: child);
        },
        routes: NavigationRouterList().routeList,
      )
    ],
    observers: [
      routeObserver,
    ],
    redirect: (context, state) {
      return null;

      // final isLoggedIn = CacheManager.instance.getBoolValue(PreferencesKeys.isLoggedIn);

      // if (isLoggedIn) {
      //   return null;
      // } else {
      //   return AppRoutes.login.path;
      // }
    },
  );
});

final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();
