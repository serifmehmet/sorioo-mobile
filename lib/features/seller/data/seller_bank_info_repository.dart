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

  TaskEither<ApiException, GenericResponse<List<SellerBankInfo>>> getSellerBankInfoList(String sellerId) =>
      TaskEither<ApiException, Response<dynamic>>.tryCatch(
        () => _client.get(
          '/sellerbankinfo/all',
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
            (castedObject) => Either<ApiException, GenericResponse<List<SellerBankInfo>>>.tryCatch(
              () => GenericResponse<List<SellerBankInfo>>.fromJson(
                castedObject,
                (Object? sellerBankInfoList) => sellerBankInfoListFromJson(sellerBankInfoList! as List<dynamic>),
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
