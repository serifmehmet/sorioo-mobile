import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sorioo/common/providers/local_user_provider.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/features/advert/domain/advert.dart';
import 'package:sorioo/features/advert/domain/dto/response/basic_advert_item_dto.dart';
import 'package:sorioo/features/advert/presentation/route_args/advert_detail_args.dart';
import 'package:sorioo/routing/app_routes.dart';

class AdvertItemWidget extends ConsumerWidget {
  const AdvertItemWidget({
    required this.advertItem,
    super.key,
  });

  final BasicAdvertItemDto advertItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => GoRouter.of(context).pushNamed(
        AppRoutes.advertDetail.name,
        extra: AdvertDetailArgs(advertId: advertItem.id, advertUserName: advertItem.categoryName),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: kColorWhite,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: kSmallPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundImage: Image.network(
                    advertItem.userProfilePicture,
                  ).image,
                ),
                const AppGap.regular(),
                AppText(
                  advertItem.userName,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            const AppGap.regular(),
            AppText(
              advertItem.title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const AppGap.regular(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText('Paket Adı', style: Theme.of(context).textTheme.bodyMedium),
                AppText(
                  '${advertItem.price}TL',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: kPrimaryColor,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
