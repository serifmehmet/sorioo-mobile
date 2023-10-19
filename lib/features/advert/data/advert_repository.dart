import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/core/http/api_exception.dart';
import 'package:sorioo/core/http/api_provider.dart';
import 'package:sorioo/core/http/generic_response.dart';
import 'package:sorioo/features/advert/domain/dto/response/basic_advert_item_dto.dart';

part 'advert_repository.g.dart';

class AdvertRepository {
  AdvertRepository({required Dio client}) : _client = client;
  final Dio _client;

  TaskEither<ApiException, GenericResponse<List<BasicAdvertItemDto>>> getAdverts(String userId) =>
      TaskEither<ApiException, Response<dynamic>>.tryCatch(
        () => _client.get('/advert', queryParameters: {'userId': userId}),
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
                (Object? basicAdvertList) => basicAdvertListFromJson(basicAdvertList! as List<Map<String, dynamic>>),
              ),
              (error, stackTrace) => InternalServerErrorException(
                message: error.toString(),
              ),
            ),
          );
}

@riverpod
AdvertRepository advertRepository(AdvertRepositoryRef ref) {
  return AdvertRepository(client: ref.watch(dioProvider));
}
