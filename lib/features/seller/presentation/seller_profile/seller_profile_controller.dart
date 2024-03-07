import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/core/constants/preferences_keys.dart';
import 'package:sorioo/core/http/generic_response.dart';
import 'package:sorioo/core/init/cache_manager.dart';
import 'package:sorioo/features/seller/data/seller_repository.dart';
import 'package:sorioo/features/seller/domain/dto/update_seller_dto.dart';
import 'package:sorioo/features/seller/domain/response/single_seller_response_dto.dart';
import 'package:sorioo/features/seller/domain/seller.dart';

part 'seller_profile_controller.g.dart';

@riverpod
class SellerProfileController extends _$SellerProfileController {
  Future<SingleSellerResponseDto?> _getSellerInfo() async {
    final userId = CacheManager.instance.getStringValue(PreferencesKeys.userId);

    final repository = ref.watch(sellerRepositoryProvider);

    final sellerTask = repository.getSingleSeller(userId);
    SingleSellerResponseDto? sellerResponse;
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
  FutureOr<SingleSellerResponseDto?> build() {
    return _getSellerInfo();
  }

  Future<void> updateSellerInfo(UpdateSellerDto updateSellerDto) async {
    state = const AsyncValue.loading();
    final repository = ref.watch(sellerRepositoryProvider);
    final updateSellerTask = await repository.updateSingleSeller(updateSellerDto).run();
    updateSellerTask
      ..mapLeft((error) {
        state = AsyncError(error, StackTrace.current);
      })
      ..map((seller) {
        state = AsyncValue.data(seller.data);
      });
    // state = (await updateSellerTask.run()).match(
    //   (l) => AsyncValue.error(l, StackTrace.current),
    //   (seller) {
    //     return _getSellerInfo();
    //   },
    // );
    // SingleSellerResponseDto? updatedSeller;

    // state = (await updateSellerTask.run()).match(
    //   (error) {
    //     return AsyncError(error, StackTrace.current);
    //   },
    //   (s) => AsyncValue.data(s.data),
    // );
  }
}
