import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/core/http/api_exception.dart';
import 'package:sorioo/features/advert/data/advert_repository.dart';
import 'package:sorioo/features/advert/domain/advert.dart';
import 'package:sorioo/features/advert/domain/dto/response/advert_detail_dto.dart';

part 'get_single_advert_provider.g.dart';

@riverpod
class GetSingleAdvert extends _$GetSingleAdvert {
  @override
  FutureOr<AdvertDetailDto> build({required String advertId}) async {
    final advertRepository = ref.watch(advertRepositoryProvider);
    final getSingleAdvertTask = await advertRepository.getSingleAdvert(advertId).run();

    return getSingleAdvertTask.fold(
      (error) {
        if (error.code == 201) {
          throw ApiException(message: 'Aradığınız ilan bulunamadı');
        }

        throw ApiException(message: error.message);
      },
      (advertItemData) => advertItemData.data!,
    );
  }
}
