import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/core/http/api_exception.dart';
import 'package:sorioo/core/http/api_provider.dart';
import 'package:sorioo/core/http/generic_response.dart';
import 'package:sorioo/features/seller/domain/dto/update_seller_dto.dart';
import 'package:sorioo/features/seller/domain/response/single_seller_response_dto.dart';
import 'package:sorioo/features/seller/domain/seller.dart';

part 'seller_repository.g.dart';

class SellerRepository {
  SellerRepository({required Dio client}) : _client = client;

  final Dio _client;

  TaskEither<ApiException, GenericResponse<SingleSellerResponseDto>> getSingleSeller(String userId) =>
      TaskEither<ApiException, Response<dynamic>>.tryCatch(
        () => _client.post('/seller/single', data: {'userId': userId}),
        (error, stackTrace) => ApiErrorHandler.handleError(error),
      )
          .chainEither(
            (response) => Either<ApiException, Response<dynamic>>.fromPredicate(
              response,
              (r) => r.statusCode == 200 && r.statusCode! < 300,
              (response) => ApiErrorHandler.handleError(
                response.statusMessage,
              ),
            ).map(
              (a) => a.data,
            ),
          )
          .chainEither(
            (data) => Either<ApiException, Map<String, dynamic>>.safeCast(
              data,
              (value) => InternalServerErrorException(message: value.toString()),
            ),
          )
          .chainEither(
            (dataObject) => Either<ApiException, GenericResponse<SingleSellerResponseDto>>.tryCatch(
              () => GenericResponse<SingleSellerResponseDto>.fromJson(
                dataObject,
                (Object? sellerJson) => SingleSellerResponseDto.fromJson(
                  sellerJson! as Map<String, dynamic>,
                ),
              ),
              (error, stackTrace) => InternalServerErrorException(
                message: error.toString(),
              ),
            ),
          );

  TaskEither<ApiException, GenericResponse<SingleSellerResponseDto>> updateSingleSeller(UpdateSellerDto sellerDto) {
    return TaskEither<ApiException, Response<dynamic>>.tryCatch(
      () => _client.put<dynamic>(
        '/seller/update',
        data: sellerDto.toJson(),
      ),
      (error, stackTrace) => InternalServerErrorException(
        message: 'Update işlemi esnasında bir hata oluştu.',
      ),
    )
        .chainEither(
          (response) => Either<ApiException, Response<dynamic>>.fromPredicate(
            response,
            (r) => r.statusCode == 200 && r.statusCode! < 300,
            (errorResponse) => UnSuccessfulOperationException(),
          ).map(
            (a) => a.data,
          ),
        )
        .chainEither(
          (data) => Either<ApiException, Map<String, dynamic>>.safeCast(
            data,
            (value) => InternalServerErrorException(
              message: 'parse error',
            ),
          ),
        )
        .chainEither(
          (sellerObject) => Either<ApiException, GenericResponse<SingleSellerResponseDto>>.tryCatch(
            () => GenericResponse<SingleSellerResponseDto>.fromJson(
              sellerObject,
              (Object? sellerJson) => SingleSellerResponseDto.fromJson(
                sellerJson! as Map<String, dynamic>,
              ),
            ),
            (error, stackTrace) => InternalServerErrorException(
              message: 'from json error',
            ),
          ),
        );
  }
}

@riverpod
SellerRepository sellerRepository(SellerRepositoryRef ref) {
  return SellerRepository(client: ref.watch(dioProvider));
}
