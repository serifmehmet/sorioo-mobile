import 'package:go_router/go_router.dart';
import 'package:sorioo/core/constants/routing/routing_transitions.dart';

import 'package:sorioo/features/profile/presentation/profile_view.dart';
import 'package:sorioo/features/seller/presentation/seller_profile/seller_profile_edit_view.dart';
import 'package:sorioo/features/seller/presentation/seller_profile/seller_profile_view.dart';
import 'package:sorioo/routing/app_routes.dart';

class RouteProfile {
  final GoRoute routeProfile = GoRoute(
    path: AppRoutes.profile.path,
    name: AppRoutes.profile.name,
    builder: (context, state) {
      return const ProfileView();
    },
    pageBuilder: (context, state) {
      return BuildPageWithTransition.buildPageWithDefaultTransition<dynamic>(
        context: context,
        state: state,
        child: const ProfileView(),
      );
    },
    // routes: [
    //   GoRoute(
    //     path: AppRoutes.editProfile.path,
    //     name: AppRoutes.editProfile.name,
    //     builder: (context, state) {
    //       return const SellerProfileEditView();
    //     },
    //     pageBuilder: (context, state) {
    //       return BuildPageWithTransition.buildPageWithSlideFromBottom<dynamic>(
    //         context: context,
    //         state: state,
    //         child: const SellerProfileEditView(),
    //       );
    //     },
    //   ),
    // ],
  );
}
