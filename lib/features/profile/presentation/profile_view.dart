import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sorioo/common/providers/local_user_provider.dart';

import 'package:sorioo/features/profile/presentation/buyer_profile_view.dart';

import 'package:sorioo/features/seller/presentation/seller_view.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});

  @override
  ConsumerState<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final localUser = ref.watch(
      localUserServiceProvider,
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: localUser.isSeller! ? const SellerView() : const BuyerProfileView(),
      ),
    );
  }
}
