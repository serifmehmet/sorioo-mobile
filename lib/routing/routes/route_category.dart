import 'package:go_router/go_router.dart';
import 'package:sorioo/core/constants/routing/routing_transitions.dart';
import 'package:sorioo/features/category/presentation/category_list_view.dart';
import 'package:sorioo/features/category/presentation/sub_category_list_view.dart';

import 'package:sorioo/routing/app_routes.dart';

class RouteCategory {
  final GoRoute routeCategory = GoRoute(
    path: AppRoutes.category.path,
    name: AppRoutes.category.name,
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
    routes: [
      GoRoute(
        path: AppRoutes.subCategoryList.path,
        name: AppRoutes.subCategoryList.name,
        pageBuilder: (context, state) {
          return BuildPageWithTransition.buildPageWithSlideFromBottom<dynamic>(
            context: context,
            state: state,
            child: const SubCategoryListView(),
          );
        },
      ),
    ],
  );
}
