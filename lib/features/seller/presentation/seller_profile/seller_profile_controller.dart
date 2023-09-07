import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/core/constants/preferences_keys.dart';
import 'package:sorioo/core/init/cache_manager.dart';
import 'package:sorioo/features/seller/data/seller_repository.dart';
import 'package:sorioo/features/seller/domain/seller.dart';

part 'seller_profile_controller.g.dart';

@riverpod
class SellerProfileController extends _$SellerProfileController {
  Future<Seller?> _getSellerInfo() async {
    final userId = CacheManager.instance.getStringValue(PreferencesKeys.userId);

    final repository = ref.watch(sellerRepositoryProvider);
    const AsyncValue<dynamic>.loading();
    final sellerTask = repository.getSingleSeller(userId);
    Seller? sellerResponse;
    (await sellerTask.run()).match(
      (error) => AsyncError<dynamic>(error, StackTrace.current),
      (seller) {
        AsyncValue.data(seller.data);
        sellerResponse = seller.data;
      },
    );
    return sellerResponse;
  }

  @override
  FutureOr<Seller?> build() {
    return _getSellerInfo();
  }
}
