import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/core/http/api_exception.dart';
import 'package:sorioo/features/advert/data/advert_repository.dart';
import 'package:sorioo/features/advert/domain/dto/response/basic_advert_item_dto.dart';

part 'get_advert_list_on_category_provider.g.dart';

@riverpod
class GetAdvertListOnCategory extends _$GetAdvertListOnCategory {
  @override
  FutureOr<List<BasicAdvertItemDto>> build(String categoryId) async {
    final repository = ref.watch(advertRepositoryProvider);

    final advertListTask = await repository.getAdvertsOnCategory(categoryId).run();

    return advertListTask.fold(
      (failure) {
        if (failure.code == 201) {
          throw ApiException(message: 'Bu kategoriye ait bir ilan bulunmamaktadır.');
        }

        throw ApiException(message: failure.message);
      },
      (advertList) => advertList.data!,
    );
  }
}
