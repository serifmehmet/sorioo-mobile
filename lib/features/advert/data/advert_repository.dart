import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/core/http/api_exception.dart';
import 'package:sorioo/core/http/api_provider.dart';
import 'package:sorioo/core/http/generic_response.dart';
import 'package:sorioo/features/advert/domain/advert.dart';
import 'package:sorioo/features/advert/domain/dto/response/advert_detail_dto.dart';
import 'package:sorioo/features/advert/domain/dto/response/basic_advert_item_dto.dart';

part 'advert_repository.g.dart';

class AdvertRepository {
  AdvertRepository({required Dio client}) : _client = client;
  final Dio _client;

  TaskEither<ApiException, GenericResponse<List<BasicAdvertItemDto>>> getAdverts(String sellerId) =>
      TaskEither<ApiException, Response<dynamic>>.tryCatch(
        () => _client.get('/advert', queryParameters: {'sellerId': sellerId}),
        (error, stackTrace) => ApiErrorHandler.handleError(
          error.toString(),
        ),
      )
          .chainEither(
            (response) => Either<ApiException, Response<dynamic>>.fromPredicate(
              response,
              (r) => r.statusCode == 200 && r.statusCode! <= 200,
              (response) => ApiException(
                message: response.statusMessage,
              ),
            ).map(
              (a) => a.data,
            ),
          )
          .chainEither(
            (predicatedResponse) => Either<ApiException, Map<String, dynamic>>.safeCast(
              predicatedResponse,
              (error) => InternalServerErrorException(
                message: error.toString(),
              ),
            ),
          )
          .chainEither(
            (castedObject) => Either<ApiException, Map<String, dynamic>>.fromPredicate(
              castedObject,
              (r) => r.containsKey('error') && r['error'] == null,
              (error) => NotFoundException(
                message: error['error']['message'].toString(),
                code: int.parse(
                  error['error']['code'].toString(),
                ),
              ),
            ),
          )
          .chainEither(
            (finalObject) => Either<ApiException, GenericResponse<List<BasicAdvertItemDto>>>.tryCatch(
              () => GenericResponse.fromJson(
                finalObject,
                (Object? basicAdvertList) => basicAdvertListFromJson(basicAdvertList! as List<dynamic>),
              ),
              (error, stackTrace) => InternalServerErrorException(
                message: error.toString(),
              ),
            ),
          );

  TaskEither<ApiException, GenericResponse<List<BasicAdvertItemDto>>> saveNewAdvert(Advert advert) {
    return TaskEither<ApiException, Response<dynamic>>.tryCatch(
      () => _client.post('/advert', data: advert.toJson()),
      (error, stackTrace) => ApiErrorHandler.handleError(error),
    )
        .chainEither(
          (response) => Either<ApiException, Response<dynamic>>.fromPredicate(
            response,
            (r) => r.statusCode == 200 || r.statusCode! <= 300,
            (response) => ApiException(
              message: response.statusMessage,
            ),
          ).map((a) => a.data),
        )
        .chainEither(
          (predicatedResponse) => Either<ApiException, Map<String, dynamic>>.safeCast(
            predicatedResponse,
            (error) => InternalServerErrorException(
              message: error.toString(),
            ),
          ),
        )
        .chainEither(
          (castedObject) => Either<ApiException, Map<String, dynamic>>.fromPredicate(
            castedObject,
            (r) => r.containsKey('error') && r['error'] == null,
            (error) => NotFoundException(
              message: error['error']['message'].toString(),
              code: int.parse(
                error['error']['code'].toString(),
              ),
            ),
          ),
        )
        .chainEither(
          (finalObject) => Either<ApiException, GenericResponse<List<BasicAdvertItemDto>>>.tryCatch(
            () => GenericResponse.fromJson(
              finalObject,
              (Object? basicAdvertList) => basicAdvertListFromJson(basicAdvertList! as List<dynamic>),
            ),
            (error, stackTrace) => InternalServerErrorException(
              message: error.toString(),
            ),
          ),
        );
  }

  TaskEither<ApiException, GenericResponse<List<BasicAdvertItemDto>>> getAdvertsOnCategory(String categoryId) {
    return TaskEither<ApiException, Response<dynamic>>.tryCatch(
      () => _client.get('/advert/get-adverts-on-category', queryParameters: {'categoryId': categoryId}),
      (error, stackTrace) => ApiErrorHandler.handleError(error),
    )
        .chainEither(
          (response) => Either<ApiException, Response<dynamic>>.fromPredicate(
            response,
            (r) => r.statusCode == 200 || r.statusCode! <= 200,
            (response) => ApiException(
              message: response.statusMessage,
            ),
          ).map((a) => a.data),
        )
        .chainEither(
          (predicatedResponse) => Either<ApiException, Map<String, dynamic>>.safeCast(
            predicatedResponse,
            (error) => InternalServerErrorException(
              message: error.toString(),
            ),
          ),
        )
        .chainEither(
          (castedObject) => Either<ApiException, Map<String, dynamic>>.fromPredicate(
            castedObject,
            (r) => r.containsKey('error') && r['error'] == null,
            (error) => NotFoundException(
              message: error['error']['message'].toString(),
              code: int.parse(
                error['error']['code'].toString(),
              ),
            ),
          ),
        )
        .chainEither(
          (finalObject) => Either<ApiException, GenericResponse<List<BasicAdvertItemDto>>>.tryCatch(
            () => GenericResponse.fromJson(
              finalObject,
              (Object? basicAdvertList) => basicAdvertListFromJson(basicAdvertList! as List<dynamic>),
            ),
            (error, stackTrace) => InternalServerErrorException(
              message: error.toString(),
            ),
          ),
        );
  }

  TaskEither<ApiException, GenericResponse<AdvertDetailDto>> getSingleAdvert(String advertId) {
    return TaskEither<ApiException, Response<dynamic>>.tryCatch(
      () => _client.get('/advert/get-single', queryParameters: {'advertId': advertId}),
      (error, stackTrace) => ApiErrorHandler.handleError(error),
    )
        .chainEither(
          (response) => Either<ApiException, Response<dynamic>>.fromPredicate(
            response,
            (r) => r.statusCode == 200 || r.statusCode! <= 200,
            (response) => ApiException(
              message: response.statusMessage,
            ),
          ).map((a) => a.data),
        )
        .chainEither(
          (predicatedResponse) => Either<ApiException, Map<String, dynamic>>.safeCast(
            predicatedResponse,
            (error) => InternalServerErrorException(
              message: error.toString(),
            ),
          ),
        )
        .chainEither(
          (castedObject) => Either<ApiException, Map<String, dynamic>>.fromPredicate(
            castedObject,
            (r) => r.containsKey('error') && r['error'] == null,
            (error) => NotFoundException(
              message: error['error']['message'].toString(),
              code: int.parse(
                error['error']['code'].toString(),
              ),
            ),
          ),
        )
        .chainEither(
          (finalObject) => Either<ApiException, GenericResponse<AdvertDetailDto>>.tryCatch(
            () => GenericResponse.fromJson(
              finalObject,
              (Object? advert) => AdvertDetailDto.fromJson(advert! as Map<String, dynamic>),
            ),
            (error, stackTrace) => InternalServerErrorException(
              message: error.toString(),
            ),
          ),
        );
  }
}

@riverpod
AdvertRepository advertRepository(AdvertRepositoryRef ref) {
  return AdvertRepository(client: ref.watch(dioProvider));
}
