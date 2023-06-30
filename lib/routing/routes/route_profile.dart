import 'package:go_router/go_router.dart';
import 'package:sorioo/core/constants/routing/routing_transitions.dart';
import 'package:sorioo/features/profile/presentation/profile_view.dart';
import 'package:sorioo/routing/app_routes.dart';

class RouteProfile {
  final GoRoute routeProfile = GoRoute(
    path: AppRoutes.profile.path,
    name: AppRoutes.profile.name,
    builder: (context, state) {
      return const ProfileView();
    },
    pageBuilder: (context, state) {
      return BuildPageWithTransition.buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const ProfileView(),
      );
    },
  );
}
