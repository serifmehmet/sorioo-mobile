import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:pinput/pinput.dart';
import 'package:sorioo/core/theme/constants.dart';

import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/features/chat/presentation/chat_list_controller.dart';
import 'package:sorioo/features/chat/presentation/widgets/single_chat_item.dart';
import 'package:sorioo/routing/app_routes.dart';

class ChatView extends ConsumerWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatController = ref.watch(chatListControllerProvider);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 70),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 100,
              ),
              const Icon(
                IconlyLight.notification,
                size: 30,
                color: kTextColor,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: kSemiBigPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              'Mesajlaşma',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const AppGap.semiBig(),
            Expanded(
              child: chatController.when(
                data: (chatList) {
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () => GoRouter.of(context).pushNamed(
                          AppRoutes.chatDetail.name,
                        ),
                        child: const SingleChatItem(),
                      );
                    },
                    itemCount: chatList!.length,
                    separatorBuilder: (context, index) => const AppGap.semiBig(),
                  );
                },
                error: (error, stackTrace) => Center(
                  child: AppText(
                    error.toString(),
                    style: const TextStyle(
                      color: kTextColor,
                    ),
                  ),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
