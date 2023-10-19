import 'package:go_router/go_router.dart';
import 'package:sorioo/core/constants/routing/routing_transitions.dart';
import 'package:sorioo/features/home/presentation/home.dart';
import 'package:sorioo/routing/app_routes.dart';

class RouterHome {
  final GoRoute routeHome = GoRoute(
    path: AppRoutes.home.path,
    name: AppRoutes.home.name,
    builder: (context, state) {
      return const HomeView();
    },
    pageBuilder: (context, state) {
      return BuildPageWithTransition.buildPageWithDefaultTransition<dynamic>(
        context: context,
        state: state,
        child: const HomeView(),
      );
    },
  );
}
