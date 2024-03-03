import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/common/providers/local_user_provider.dart';
import 'package:sorioo/core/constants/preferences_keys.dart';
import 'package:sorioo/core/http/api_exception.dart';
import 'package:sorioo/core/http/generic_response.dart';
import 'package:sorioo/core/init/cache_manager.dart';
import 'package:sorioo/features/advert/data/advert_repository.dart';
import 'package:sorioo/features/advert/domain/advert.dart';
import 'package:sorioo/features/advert/domain/dto/response/basic_advert_item_dto.dart';

part 'advert_controller.g.dart';

@riverpod
class AdvertController extends _$AdvertController {
  @override
  FutureOr<List<BasicAdvertItemDto>> build() async {
    final repository = ref.watch(advertRepositoryProvider);
    final sellerId = ref.watch(
      localUserServiceProvider.select((value) => value.sellerId),
    );

    final advertListTask = await repository.getAdverts(sellerId ?? '0').run();

    return advertListTask.fold(
      (error) {
        if (error.code == 201) {
          throw ApiException(message: 'Henüz bir ilan oluşturmadınız.');
        }

        throw ApiException(message: error.message);
      },
      (advertList) => advertList.data!,
    );
  }

  Future<List<BasicAdvertItemDto>> saveNewAdvert(Advert advert) async {
    final repository = ref.watch(advertRepositoryProvider);

    final saveAdvertTask = await repository.saveNewAdvert(advert).run();

    return saveAdvertTask.fold(
      (error) => throw ApiException(message: error.message),
      (advertList) => advertList.data!,
    );
  }
}
