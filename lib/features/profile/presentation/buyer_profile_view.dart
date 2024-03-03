import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/button/app_button.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/features/profile/presentation/buyer_profile_controller.dart';
import 'package:sorioo/features/profile/presentation/route_args/buyer_profile_edit_args.dart';

import 'package:sorioo/routing/navigation_helpers.dart';

class BuyerProfileView extends ConsumerWidget {
  const BuyerProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final buyerProfile = ref.watch(buyerProfileControllerProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const AppText('Profilim'),
        ),
        body: buyerProfile.when(
          data: (profile) {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: kSemiBigPadding,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        color: kColorWhite,
                        padding: kSemiBigPadding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: CircleAvatar(
                                radius: 40,
                                backgroundImage: profile.userProfileImage != null
                                    ? Image.network(
                                        profile.userProfileImage!.filePath,
                                      ).image
                                    : Image.asset(
                                        'assets/images/default-avatar.png',
                                      ).image,
                              ),
                            ),
                            const AppGap.big(),
                            AppText(
                              'Ad-Soyad',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const AppGap.regular(),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              color: kDisabledContainerColor,
                              padding: kSemiBigPadding,
                              child: AppText(
                                profile.fullName,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            const AppGap.semiBig(),
                            AppText(
                              'Telefon Numarası',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const AppGap.regular(),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              color: kDisabledContainerColor,
                              padding: kSemiBigPadding,
                              child: AppText(
                                profile.phoneNumber.isEmpty ? 'Belirtilmemiş' : profile.phoneNumber,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                            const AppGap.semiBig(),
                            AppText(
                              'Hakkımda',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const AppGap.regular(),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              color: kDisabledContainerColor,
                              padding: kSemiBigPadding,
                              child: AppText(
                                profile.about.isEmpty
                                    ? 'Hizmet verenlerle sağlıklı bir iletişim kurmak amaçlı kendin hakkında ufak bir bilgi verebilirsin.'
                                    : profile.about,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: kColorWhite,
                  ),
                  padding: kSemiBigPadding,
                  child: AppPrimaryButton(
                    title: 'Güncelle',
                    onTap: () => context.navigator.pushBuyerProfileEdit(
                      BuyerProfileEditArgs(
                        fullName: profile.fullName,
                        phoneNumber: profile.phoneNumber,
                        profilePictureUrl: profile.profilePictureUrl,
                        about: profile.about,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          error: (error, stackTrace) => const SizedBox(),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
