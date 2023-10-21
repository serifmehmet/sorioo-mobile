import 'package:go_router/go_router.dart';
import 'package:sorioo/core/constants/routing/routing_transitions.dart';
import 'package:sorioo/features/category/presentation/category_list_view.dart';
import 'package:sorioo/routing/app_routes.dart';

class RouteSorioo {
  final GoRoute routeSorioo = GoRoute(
    path: AppRoutes.sorioo.path,
    name: AppRoutes.sorioo.name,
    builder: (context, state) {
      return const CategoryListView();
    },
    pageBuilder: (context, state) {
      return BuildPageWithTransition.buildPageWithDefaultTransition<dynamic>(
        context: context,
        state: state,
        child: const CategoryListView(),
      );
    },
  );
}
