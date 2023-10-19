import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/common/providers/local_user_provider.dart';
import 'package:sorioo/core/http/api_exception.dart';
import 'package:sorioo/features/auth/data/local_user_repository.dart';
import 'package:sorioo/features/seller/data/seller_bank_info_repository.dart';
import 'package:sorioo/features/seller/domain/seller_bank_info.dart';

part 'seller_bank_info_controller.g.dart';

@riverpod
class SellerBankInfoController extends _$SellerBankInfoController {
  @override
  FutureOr<void> build() {
    // return getSellerBankInfo();
  }

  Future<void> createSellerBankInfo(SellerBankInfo sellerBankInfo) async {
    final repository = ref.watch(sellerBankInfoRepositoryProvider);

    state = const AsyncValue.loading();

    final sellerBankInfoTask = await repository.createSellerBankInfo(sellerBankInfo).run();

    sellerBankInfoTask
      ..mapLeft((exception) {
        state = AsyncValue.error(exception, StackTrace.current);
      })
      ..map((sellerBankInfo) {
        state = AsyncValue.data(sellerBankInfo.data);
      });
  }
}

@riverpod
FutureOr<SellerBankInfo?> fetchSellerBankInfo(FetchSellerBankInfoRef ref) async {
  final localUser = ref.watch(localUserServiceProvider);
  final repository = ref.watch(sellerBankInfoRepositoryProvider);

  final sellerBankInfoTask = await repository
      .getSellerBankInfoList(
        localUser.sellerId!,
      )
      .run();
  // var sellerBankInfo = SellerBankInfo.empty();
  sellerBankInfoTask
    ..mapLeft((error) {
      if (error.code == 201) {
        throw ApiException(
          message: 'Hesabınıza ait banka bilgisi bulunamadı!',
        );
      } else {
        return null;
      }
    })
    ..map(
      (sBankInfo) {
        // AsyncValue.data(sBankInfo.data);

        return sBankInfo.data!;
      },
    );
  // final response = await repository.getSellerBankInfo(localUser.sellerId!);
  // if (response!.data != null) {
  //   return response.data;
  // }
  return null;
}
