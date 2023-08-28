import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sorioo/core/constants/preferences_keys.dart';
import 'package:sorioo/core/constants/routing/routing_keys.dart';
import 'package:sorioo/core/constants/routing/routing_transitions.dart';
import 'package:sorioo/core/init/cache_manager.dart';
import 'package:sorioo/features/auth/presentation/register/email_register_second_step_view.dart';
import 'package:sorioo/features/auth/presentation/register/email_register_view.dart';
import 'package:sorioo/features/auth/presentation/register/register_view.dart';
import 'package:sorioo/features/auth/presentation/register/route_args/email_register_second_page_args.dart';
import 'package:sorioo/features/auth/presentation/sign_in/login_view.dart';
import 'package:sorioo/features/auth/presentation/verify/email_verification_view.dart';
import 'package:sorioo/features/home/presentation/navbar/scaffold_with_bottom_navbar.dart';
import 'package:sorioo/routing/app_routes.dart';
import 'package:sorioo/routing/routes/routers_list.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: RoutingKeys.rootNavigatorKey,
    debugLogDiagnostics: true,
    initialLocation: AppRoutes.category.path,
    routes: <RouteBase>[
      GoRoute(
        name: AppRoutes.login.name,
        path: AppRoutes.login.path,
        pageBuilder: (context, state) {
          return BuildPageWithTransition.buildPageWithSlideFromBottom<dynamic>(
            context: context,
            state: state,
            child: const LoginView(),
          );
        },
        parentNavigatorKey: RoutingKeys.rootNavigatorKey,
      ),
      GoRoute(
        path: AppRoutes.register.path,
        name: AppRoutes.register.name,
        pageBuilder: (context, state) {
          return BuildPageWithTransition.buildPageWithSlideFromBottom<dynamic>(
            context: context,
            state: state,
            child: const RegisterView(),
          );
        },
        parentNavigatorKey: RoutingKeys.rootNavigatorKey,
      ),
      GoRoute(
        path: AppRoutes.emailRegister.path,
        name: AppRoutes.emailRegister.name,
        pageBuilder: (context, state) {
          return BuildPageWithTransition.buildPageWithSlideFromBottom<dynamic>(
            context: context,
            state: state,
            child: const EmailRegisterView(),
          );
        },
        parentNavigatorKey: RoutingKeys.rootNavigatorKey,
      ),
      GoRoute(
        path: AppRoutes.emailRegisterLastStep.path,
        name: AppRoutes.emailRegisterLastStep.name,
        pageBuilder: (context, state) {
          return BuildPageWithTransition.buildPageWithSlideFromBottom<dynamic>(
            context: context,
            state: state,
            child: EmailRegisterLastStepView(
              args: state.extra! as EmailRegisterSecondPageArgs,
            ),
          );
        },
        parentNavigatorKey: RoutingKeys.rootNavigatorKey,
      ),
      GoRoute(
        path: AppRoutes.emailRegisterVerification.path,
        name: AppRoutes.emailRegisterVerification.name,
        pageBuilder: (context, state) {
          return BuildPageWithTransition.buildPageWithSlideFromBottom<dynamic>(
            context: context,
            state: state,
            child: EmailVerificationView(
              args: state.extra! as EmailVerifyPageArgs,
            ),
          );
        },
        parentNavigatorKey: RoutingKeys.rootNavigatorKey,
      ),

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
      ),
    ],
    observers: [
      routeObserver,
    ],
    redirect: (context, state) {
      final isLoggedIn = CacheManager.instance.getBoolValue(
        PreferencesKeys.isLoggedIn,
      );
      if (state.location == AppRoutes.profile.path && !isLoggedIn) {
        return AppRoutes.login.path;
      } else {}
      return null;
      // if (isLoggedIn) {
      //   return null;
      // } else {
      //   return AppRoutes.login.path;
      // }
    },
  );
});

final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();
