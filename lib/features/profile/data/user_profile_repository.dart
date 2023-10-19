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

part 'user_profile_repository.g.dart';

class UserProfileRepository {
  UserProfileRepository({required Dio apiClient}) : _apiClient = apiClient;

  final Dio _apiClient;

  TaskEither<ApiException, GenericResponse<StatusMessageResponse>> makeUserSeller(String userId) => TaskEither<ApiException, Response>.tryCatch(
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
}

@riverpod
UserProfileRepository userProfileRepositoryProvider(
  UserProfileRepositoryProviderRef ref,
) {
  return UserProfileRepository(apiClient: ref.watch(dioProvider));
}
