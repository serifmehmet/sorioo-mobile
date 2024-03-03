import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/core/constants/preferences_keys.dart';
import 'package:sorioo/core/http/api_exception.dart';
import 'package:sorioo/core/init/cache_manager.dart';

import 'package:sorioo/features/profile/data/user_profile_repository.dart';
import 'package:sorioo/features/profile/domain/buyer_profile.dart';
import 'package:sorioo/features/profile/domain/dtos/update_buyer_dto.dart';

part 'buyer_profile_controller.g.dart';

@riverpod
class BuyerProfileController extends _$BuyerProfileController {
  @override
  FutureOr<BuyerProfile> build() async {
    final userId = CacheManager.instance.getStringValue(
      PreferencesKeys.userId,
    );

    final buyerProfileTask = await ref
        .watch(
          userProfileRepositoryProvider,
        )
        .getUserProfile(
          userId,
        )
        .run();

    return buyerProfileTask.fold(
      (error) => throw ApiException(
        message: error.message,
      ),
      (buyerProfile) => buyerProfile.data!,
    );
  }

  Future<void> updateBuyerProfile(UpdateBuyerDto updateBuyerDto) async {
    state = const AsyncValue.loading();
    final buyerProfileTask = await ref
        .watch(userProfileRepositoryProvider)
        .updateUserProfile(
          updateBuyerDto,
        )
        .run();

    buyerProfileTask.fold(
      (failure) => state = AsyncValue.error(failure, StackTrace.current),
      (success) {
        state = AsyncValue.data(success.data!);
      },
    );
  }
}
