import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconly/iconly.dart';

import 'package:sorioo/common/providers/local_user_provider.dart';
import 'package:sorioo/common/widgets/preferred_app_bar_widget.dart';
import 'package:sorioo/core/theme/constants.dart';

import 'package:sorioo/features/profile/presentation/buyer_view.dart';

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

    return Scaffold(
      appBar: const PreferredAppBarWidget(),
      body: localUser.isSeller! ? const SellerView() : const BuyerView(),
    );
  }
}
