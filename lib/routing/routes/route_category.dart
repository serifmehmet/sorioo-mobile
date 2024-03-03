import 'package:go_router/go_router.dart';
import 'package:sorioo/core/constants/routing/routing_transitions.dart';
import 'package:sorioo/features/advert/presentation/advert_detail/advert_detail_view.dart';
import 'package:sorioo/features/advert/presentation/category_advert/advert_list_on_category.dart';
import 'package:sorioo/features/advert/presentation/route_args/advert_detail_args.dart';
import 'package:sorioo/features/advert/presentation/route_args/advert_list_args.dart';
import 'package:sorioo/features/category/presentation/category_list_view.dart';
import 'package:sorioo/features/category/presentation/route_args/sub_category_args.dart';
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
            child: SubCategoryListView(
              args: state.extra! as SubCategoryArgs,
            ),
          );
        },
      ),
      GoRoute(
        path: AppRoutes.advertListOnCategory.path,
        name: AppRoutes.advertListOnCategory.name,
        pageBuilder: (context, state) {
          return BuildPageWithTransition.buildPageWithSlideFromBottom<dynamic>(
            context: context,
            state: state,
            child: AdvertListOnCategory(
              args: state.extra! as AdvertListArgs,
            ),
          );
        },
        routes: [
          GoRoute(
            path: AppRoutes.advertDetail.path,
            name: AppRoutes.advertDetail.name,
            pageBuilder: (context, state) {
              return BuildPageWithTransition.buildPageWithSlideFromBottom<dynamic>(
                context: context,
                state: state,
                child: AdvertDetailView(
                  args: state.extra! as AdvertDetailArgs,
                ),
              );
            },
          ),
        ],
      ),
    ],
  );
}
