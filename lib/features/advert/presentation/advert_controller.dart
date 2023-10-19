import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/core/constants/preferences_keys.dart';
import 'package:sorioo/core/http/api_exception.dart';
import 'package:sorioo/core/http/generic_response.dart';
import 'package:sorioo/core/init/cache_manager.dart';
import 'package:sorioo/features/advert/data/advert_repository.dart';
import 'package:sorioo/features/advert/domain/dto/response/basic_advert_item_dto.dart';

part 'advert_controller.g.dart';

@riverpod
class AdvertController extends _$AdvertController {
  @override
  FutureOr<List<BasicAdvertItemDto>?> build() async {
    final repository = ref.watch(advertRepositoryProvider);
    final userId = CacheManager.instance.getStringValue(
      PreferencesKeys.userId,
    );

    final advertListTask = await repository.getAdverts(userId).run();

    advertListTask
      ..mapLeft((error) {
        if (error.code == 201) {
          throw ApiException(message: 'Henüz bir ilan oluşturmadınız.');
        }
      })
      ..map((list) => list.data);

    return null;
  }
}
