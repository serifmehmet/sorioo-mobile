import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/core/http/api_exception.dart';
import 'package:sorioo/core/http/api_provider.dart';
import 'package:sorioo/core/http/generic_response.dart';
import 'package:sorioo/features/seller/domain/seller.dart';

part 'seller_repository.g.dart';

class SellerRepository {
  SellerRepository({required Dio client}) : _client = client;

  final Dio _client;

  TaskEither<ApiException, GenericResponse<Seller>> getSingleSeller(String userId) => TaskEither<ApiException, Response<dynamic>>.tryCatch(
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
            (dataObject) => Either<ApiException, GenericResponse<Seller>>.tryCatch(
              () => GenericResponse<Seller>.fromJson(
                dataObject,
                (Object? sellerJson) => Seller.fromJson(
                  sellerJson! as Map<String, dynamic>,
                ),
              ),
              (error, stackTrace) => InternalServerErrorException(
                message: error.toString(),
              ),
            ),
          );
}

@riverpod
SellerRepository sellerRepository(SellerRepositoryRef ref) {
  return SellerRepository(client: ref.watch(dioProvider));
}
