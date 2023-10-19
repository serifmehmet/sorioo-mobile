import 'package:go_router/go_router.dart';
import 'package:sorioo/core/constants/routing/routing_transitions.dart';
import 'package:sorioo/features/chat/presentation/chat_view.dart';
import 'package:sorioo/features/message/presentation/message_view.dart';
import 'package:sorioo/routing/app_routes.dart';

class RouteMessage {
  final GoRoute routeMessage = GoRoute(
    path: AppRoutes.chat.path,
    name: AppRoutes.chat.name,
    builder: (context, state) {
      return const MessageView();
    },
    pageBuilder: (context, state) {
      return BuildPageWithTransition.buildPageWithDefaultTransition<dynamic>(
        context: context,
        state: state,
        child: const ChatView(),
      );
    },
  );
}
