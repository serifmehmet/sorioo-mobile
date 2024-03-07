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

  TaskEither<ApiException, GenericResponse<SingleSellerResponseDto>> getSingleSeller({required String sellerId}) =>
      TaskEither<ApiException, Response<dynamic>>.tryCatch(
        () => _client.post('/seller/single', data: {'sellerId': sellerId}),
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
      () async {
        final formData = FormData();

        formData.fields.add(
          MapEntry('id', sellerDto.id),
        );

        formData.fields.add(
          MapEntry('userId', sellerDto.userId),
        );

        formData.fields.add(
          MapEntry('fullName', sellerDto.fullName!),
        );

        formData.fields.add(
          MapEntry('graduation', sellerDto.graduation!),
        );

        formData.fields.add(
          MapEntry('industry', sellerDto.industry!),
        );

        formData.fields.add(
          MapEntry('bio', sellerDto.bio!),
        );

        formData.fields.add(
          MapEntry('mainCategoryId', sellerDto.mainCategoryId!),
        );

        if (sellerDto.image != null) {
          formData.files.add(
            MapEntry(
              'imageFile',
              await MultipartFile.fromFile(
                sellerDto.image!.filePath,
                filename: sellerDto.image!.fileName,
              ),
            ),
          );
        }

        return _client.put(
          '/seller/update',
          data: formData,
        );
      },
      (error, stackTrace) => InternalServerErrorException(
        message: error.toString(),
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
