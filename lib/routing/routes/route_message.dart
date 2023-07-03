import 'package:go_router/go_router.dart';
import 'package:sorioo/core/constants/routing/routing_transitions.dart';
import 'package:sorioo/features/message/presentation/message_view.dart';
import 'package:sorioo/routing/app_routes.dart';

class RouteMessage {
  final GoRoute routeMessage = GoRoute(
    path: AppRoutes.message.path,
    name: AppRoutes.message.name,
    builder: (context, state) {
      return const MessageView();
    },
    pageBuilder: (context, state) {
      return BuildPageWithTransition.buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: const MessageView(),
      );
    },
  );
}
