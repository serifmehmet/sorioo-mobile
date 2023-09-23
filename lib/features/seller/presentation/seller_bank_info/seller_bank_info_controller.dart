import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/features/seller/data/seller_bank_info_repository.dart';
import 'package:sorioo/features/seller/domain/seller_bank_info.dart';

part 'seller_bank_info_controller.g.dart';

@riverpod
class SellerBankInfoController extends _$SellerBankInfoController {
  Future<List<SellerBankInfo>> _getAll(String sellerId) async {
    final repository = ref.watch(sellerBankInfoRepositoryProvider);

    final sellerBankInfoTask = await repository.getSellerBankInfoList(sellerId).run();
    List<SellerBankInfo>? sellerBankInfoList;
    sellerBankInfoTask
      ..mapLeft((error) => null)
      ..map(
        (sellerList) {
          sellerBankInfoList = sellerList.data;
        },
      );

    return sellerBankInfoList!;
  }

  @override
  FutureOr<List<SellerBankInfo>> build(String sellerId) {
    return _getAll(sellerId);
  }
}
