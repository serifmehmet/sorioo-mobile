import 'package:go_router/go_router.dart';
import 'package:sorioo/core/constants/routing/routing_transitions.dart';

import 'package:sorioo/features/category/presentation/category_view.dart';
import 'package:sorioo/routing/app_routes.dart';

class RouteCategory {
  final GoRoute routeCategory = GoRoute(
    path: AppRoutes.category.path,
    name: AppRoutes.category.name,
    builder: (context, state) {
      return const CategoryView();
    },
    pageBuilder: (context, state) {
      return BuildPageWithTransition.buildPageWithDefaultTransition<dynamic>(
        context: context,
        state: state,
        child: const CategoryView(),
      );
    },
  );
}
