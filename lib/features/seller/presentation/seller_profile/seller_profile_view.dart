import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sorioo/common/providers/local_user_provider.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/button/app_button.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/features/seller/presentation/seller_profile/route_args/seller_profile_edit_page_args.dart';
import 'package:sorioo/features/seller/presentation/seller_profile/seller_profile_controller.dart';
import 'package:sorioo/routing/app_routes.dart';
import 'package:sorioo/routing/navigation_helpers.dart';

class SellerProfileView extends ConsumerStatefulWidget {
  const SellerProfileView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SellerProfileViewState();
}

class _SellerProfileViewState extends ConsumerState<SellerProfileView> {
  @override
  Widget build(BuildContext context) {
    final localUser = ref.watch(localUserServiceProvider);
    final sellerState = ref.watch(sellerProfileControllerProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const AppText(
          'Profil',
        ),
      ),
      body: Padding(
        padding: kBigPadding,
        child: sellerState.when(
          data: (seller) {
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: kBigPadding,
                  decoration: const BoxDecoration(color: Color(0xffFFFFFF)),
                  child: Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: localUser.profilePictureUrl!.isNotEmpty
                              ? Image.network(
                                  localUser.profilePictureUrl!,
                                ).image
                              : Image.asset(
                                  'assets/images/default-avatar.png',
                                ).image,
                        ),
                        const AppGap.regular(),
                        AppText(
                          localUser.fullName,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const AppGap.big(),
                        AppText(
                          seller!.sellerBio != '' ? seller.sellerBio : 'Herhangi bir bilgi girilmemiş.',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
                const AppGap.big(),
                Container(
                  width: double.infinity,
                  padding: kBigPadding,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFFFFF),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        'Uzmanlık Alanı',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const AppGap.semiBig(),
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: kDisabledContainerColor,
                        ),
                        child: Padding(
                          padding: kSemiBigPadding,
                          child: AppText(
                            seller.sellerMainCategory != null
                                ? seller.sellerMainCategory!.name
                                : 'Bir uzmanlık alanı seçilmemiş',
                            color: kTextColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                AppPrimaryButton(
                  title: 'Bilgilerimi Güncelle',
                  onTap: () => context.navigator.pushSellerProfileEdit(
                    SellerProfileEditPageArgs(
                      id: seller.id!,
                      fullName: localUser.fullName,
                      profilePictureUrl: seller.sellerImagePath,
                      profileBio: seller.sellerBio,
                      sellerMainCategoryId: seller.sellerMainCategory != null ? seller.sellerMainCategory!.id : '',
                      sellerGraduation: seller.graduation,
                      sellerIndustry: seller.industry,
                    ),
                  ),
                ),
              ],
            );
          },
          error: (o, st) => const SizedBox(),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
