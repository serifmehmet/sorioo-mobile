import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/common/models/status_message_response.dart';
import 'package:sorioo/core/constants/env.dart';
import 'package:sorioo/core/constants/preferences_keys.dart';
import 'package:sorioo/core/http/api_exception.dart';
import 'package:sorioo/core/http/api_provider.dart';
import 'package:sorioo/core/http/generic_response.dart';
import 'package:sorioo/core/init/cache_manager.dart';
import 'package:sorioo/features/profile/domain/buyer_profile.dart';
import 'package:sorioo/features/profile/domain/dtos/update_buyer_dto.dart';

part 'user_profile_repository.g.dart';

class UserProfileRepository {
  UserProfileRepository({required Dio apiClient}) : _apiClient = apiClient;

  final Dio _apiClient;

  TaskEither<ApiException, GenericResponse<StatusMessageResponse>> makeUserSeller(String userId) =>
      TaskEither<ApiException, Response>.tryCatch(
        () => _apiClient.post(
          '/auth/make-seller',
          data: {
            'userId': CacheManager.instance.getStringValue(
              PreferencesKeys.userId,
            ),
          },
        ),
        (error, stackTrace) => ApiErrorHandler.handleError(error),
      )
          .chainEither(
            (response) => Either<ApiException, Response<dynamic>>.fromPredicate(
              response,
              (r) => r.statusCode == 200 && r.statusCode! < 300,
              (response) => UnSuccessfulOperationException(message: response.statusMessage!),
            ).map(
              (a) => a.data,
            ),
          )
          .chainEither(
            (json) => Either<ApiException, Map<String, dynamic>>.safeCast(
              json,
              (e) => UnSuccessfulOperationException(message: e.toString()),
            ),
          )
          .chainEither(
            (dataObject) => Either.tryCatch(
              () => GenericResponse<StatusMessageResponse>.fromJson(
                dataObject,
                (Object? statusJson) => StatusMessageResponse.fromJson(
                  statusJson! as Map<String, dynamic>,
                ),
              ),
              (error, stackTrace) => InternalServerErrorException(
                message: error.toString(),
              ),
            ),
          );

  TaskEither<ApiException, GenericResponse<BuyerProfile>> getUserProfile(String userId) =>
      TaskEither<ApiException, Response<dynamic>>.tryCatch(
        () => _apiClient.get(
          '/buyer',
          queryParameters: {'buyerId': userId},
        ),
        (error, stackTrace) => ApiErrorHandler.handleError(error),
      )
          .chainEither(
            (response) => Either<ApiException, Response<dynamic>>.fromPredicate(
              response,
              (r) => r.statusCode == 200 || r.statusCode! < 300,
              (response) => UnSuccessfulOperationException(message: response.statusMessage!),
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
            (dataObject) => Either<ApiException, GenericResponse<BuyerProfile>>.tryCatch(
              () => GenericResponse<BuyerProfile>.fromJson(
                dataObject,
                (Object? buyerData) => BuyerProfile.fromJson(buyerData! as Map<String, dynamic>),
              ),
              (error, stackTrace) => InternalServerErrorException(
                message: error.toString(),
              ),
            ),
          );

  TaskEither<ApiException, GenericResponse<BuyerProfile>> updateUserProfile(UpdateBuyerDto updateBuyerDto) =>
      TaskEither<ApiException, Response<dynamic>>.tryCatch(
        () async {
          final formData = FormData();
          formData.fields.add(
            MapEntry('id', updateBuyerDto.id),
          );
          formData.fields.add(
            MapEntry('fullName', updateBuyerDto.fullName ?? ''),
          );
          formData.fields.add(
            MapEntry('phoneNumber', updateBuyerDto.phoneNumber ?? ''),
          );
          formData.fields.add(
            MapEntry('about', updateBuyerDto.about ?? ''),
          );

          if (updateBuyerDto.image != null) {
            formData.files.add(
              MapEntry(
                'imageFile',
                await MultipartFile.fromFile(
                  updateBuyerDto.image!.filePath,
                  filename: updateBuyerDto.image!.fileName,
                ),
              ),
            );
          }

          return await _apiClient.put(
            '/buyer/update',
            data: formData,
          );
        },
        (error, stackTrace) => ApiException(
          message: error.toString(),
        ),
      )
          .chainEither(
            (response) => Either<ApiException, Response<dynamic>>.fromPredicate(
              response,
              (r) => r.statusCode == 200 && r.statusCode! < 300,
              (error) => ApiException(
                message: error.statusMessage,
              ),
            ).map((a) => a.data),
          )
          .chainEither(
            (statusOkResponse) => Either<ApiException, Map<String, dynamic>>.safeCast(
              statusOkResponse,
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
            (dataObject) => Either<ApiException, GenericResponse<BuyerProfile>>.tryCatch(
              () => GenericResponse<BuyerProfile>.fromJson(
                dataObject,
                (Object? buyerData) => BuyerProfile.fromJson(buyerData! as Map<String, dynamic>),
              ),
              (error, stackTrace) => InternalServerErrorException(
                message: error.toString(),
              ),
            ),
          );
}

@riverpod
UserProfileRepository userProfileRepository(
  UserProfileRepositoryRef ref,
) {
  return UserProfileRepository(apiClient: ref.watch(dioProvider));
}
