import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorioo/common/providers/local_user_provider.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/features/seller/presentation/seller_profile/seller_profile_controller.dart';

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
    return SafeArea(
      child: Scaffold(
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
                            backgroundImage: Image.network(localUser.googleProfilePictureUrl!).image,
                          ),
                          const AppGap.regular(),
                          AppText(
                            localUser.fullName,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const AppGap.extraBig(),
                          AppText(
                            seller!.sellerBio != null ? seller.sellerBio! : 'Herhangi bir bilgi girilmemiş.',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
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
      ),
    );
  }
}
