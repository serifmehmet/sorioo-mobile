import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sorioo/core/constants/preferences_keys.dart';
import 'package:sorioo/core/init/cache_manager.dart';
import 'package:sorioo/features/auth/presentation/login_view.dart';
import 'package:sorioo/features/home/presentation/home.dart';
import 'package:sorioo/routing/app_routes.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final rootNavigatorKey = GlobalKey<NavigatorState>();
  final shellNavigatorKey = GlobalKey<NavigatorState>();
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: AppRoutes.home.path,
    routes: [
      GoRoute(
        name: AppRoutes.login.name,
        path: AppRoutes.login.path,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const LoginView(),
        ),
      ),
      GoRoute(
        name: AppRoutes.home.name,
        path: AppRoutes.home.path,
        pageBuilder: (context, state) => MaterialPage(
          key: state.pageKey,
          child: const HomeView(),
        ),
      )
    ],
    observers: [
      routeObserver,
    ],
    redirect: (context, state) {
      final isLoggedIn = CacheManager.instance.getBoolValue(PreferencesKeys.isLoggedIn);

      if (isLoggedIn) {
        return null;
      } else {
        return AppRoutes.login.path;
      }
    },
  );
});

final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();
