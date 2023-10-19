import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/core/http/api_exception.dart';
import 'package:sorioo/core/http/api_provider.dart';
import 'package:sorioo/core/http/generic_response.dart';
import 'package:sorioo/features/seller/domain/seller_bank_info.dart';

part 'seller_bank_info_repository.g.dart';

class SellerBankInfoRepository {
  SellerBankInfoRepository({required Dio client}) : _client = client;
  final Dio _client;

  Future<GenericResponse<SellerBankInfo>?> getSellerBankInfo(String sellerId) async {
    final response = await _client.get(
      '/sellerbankinfo/get',
      queryParameters: {'sellerId': sellerId},
    );

    if (response.statusCode == 200) {
      final genericObject = GenericResponse<SellerBankInfo>.fromJson(
        response.data as Map<String, dynamic>,
        (Object? sellerBankInfo) => SellerBankInfo.fromJson(
          sellerBankInfo! as Map<String, dynamic>,
        ),
      );

      return genericObject;
    }

    return null;
  }

  TaskEither<ApiException, GenericResponse<SellerBankInfo>> getSellerBankInfoList(String sellerId) =>
      TaskEither<ApiException, Response<dynamic>>.tryCatch(
        () => _client.get(
          '/sellerbankinfo/get',
          queryParameters: {'sellerId': sellerId},
        ),
        (error, stackTrace) => ApiErrorHandler.handleError(error),
      )
          .chainEither(
            (response) => Either<ApiException, Response<dynamic>>.fromPredicate(
              response,
              (r) => r.statusCode == 200 && r.statusCode! < 300,
              (response) => ApiErrorHandler.handleError(response.statusMessage),
            ).map((a) => a.data),
          )
          .chainEither(
            (data) => Either<ApiException, Map<String, dynamic>>.safeCast(
              data,
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
                code: int.parse(error['error']['code'].toString()),
              ),
            ),
          )
          .chainEither(
            (dataObject) => Either<ApiException, GenericResponse<SellerBankInfo>>.tryCatch(
              () => GenericResponse<SellerBankInfo>.fromJson(
                dataObject,
                (Object? sellerBankInfoJson) => SellerBankInfo.fromJson(sellerBankInfoJson! as Map<String, dynamic>),
              ),
              (error, stackTrace) => InternalServerErrorException(
                message: error.toString(),
              ),
            ),
          );

  TaskEither<ApiException, GenericResponse<SellerBankInfo>> createSellerBankInfo(SellerBankInfo sellerBankInfo) =>
      TaskEither<ApiException, Response<dynamic>>.tryCatch(
        () => _client.post('/sellerbankinfo/new', data: sellerBankInfo.toJson()),
        (error, stackTrace) => ApiErrorHandler.handleError(error),
      )
          .chainEither(
            (response) => Either<ApiException, Response<dynamic>>.fromPredicate(
              response,
              (r) => r.statusCode == 200 && r.statusCode! < 300,
              (responseError) => ApiErrorHandler.handleError(responseError.statusMessage),
            ).map(
              (a) => a.data,
            ),
          )
          .chainEither(
            (data) => Either<ApiException, Map<String, dynamic>>.safeCast(
              data,
              (error) => InternalServerErrorException(
                message: error.toString(),
              ),
            ),
          )
          .chainEither(
            (castedResponse) => Either<ApiException, GenericResponse<SellerBankInfo>>.tryCatch(
              () => GenericResponse<SellerBankInfo>.fromJson(
                castedResponse,
                (Object? sellerBankInfoJson) => SellerBankInfo.fromJson(sellerBankInfoJson! as Map<String, dynamic>),
              ),
              (error, stackTrace) => InternalServerErrorException(
                message: error.toString(),
              ),
            ),
          );
}

@riverpod
SellerBankInfoRepository sellerBankInfoRepository(SellerBankInfoRepositoryRef ref) {
  return SellerBankInfoRepository(
    client: ref.watch(dioProvider),
  );
}
