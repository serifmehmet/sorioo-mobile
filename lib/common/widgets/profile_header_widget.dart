import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorioo/common/providers/local_user_provider.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';

class ProfileHeaderWidget extends ConsumerWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(
      localUserServiceProvider,
    );
    return Container(
      padding: kSemiBigPadding,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: user.googleProfilePictureUrl != null
                ? Image.network(user.googleProfilePictureUrl!).image
                : Image.asset(
                    'assets/images/default-avatar.png',
                  ).image,
          ),
          const AppGap.semiBig(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                user.fullName,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const AppGap.small(),
              AppText(
                user.email,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
