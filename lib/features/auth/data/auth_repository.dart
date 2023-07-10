import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/common/models/generic_response.dart';
import 'package:sorioo/core/http/api_exception.dart';
import 'package:sorioo/core/http/api_provider.dart';
import 'package:sorioo/features/auth/domain/user.dart';

import '../../../core/constants/env.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  final Dio client;

  AuthRepository({required this.client});

  TaskEither<ApiException, GenericResponse> createUser(User user) => TaskEither<ApiException, Response>.tryCatch(
        () => client.post(
          "${Env.apiLocalDevUrl}/auth/register",
          data: user.toJson(),
        ),
        (error, stackTrace) => ApiErrorHandler.handleError(error),
      )
          .chainEither(
            (response) => Either<ApiException, Response>.fromPredicate(
              response,
              (r) => r.statusCode == 200 && r.statusCode! < 300,
              (response) => ApiErrorHandler.handleError(response.data),
            ).map(
              (a) => a.data,
            ),
          )
          .chainEither(
            (json) => Either<ApiException, Map<String, dynamic>>.safeCast(
              json,
              (e) => InternalServerErrorException(message: e),
            ),
          )
          .chainEither(
            (dataObject) => Either.tryCatch(
              () => GenericResponse.fromJson(dataObject),
              (error, stackTrace) => InternalServerErrorException(message: error.toString()),
            ),
          );

  TaskEither<ApiException, GenericResponse> verifyUser(String email, String code) => TaskEither<ApiException, Response>.tryCatch(
        () => client.post(
          "${Env.apiLocalDevUrl}/auth/verify",
          data: {"email": email, "code": code},
        ),
        (error, stackTrace) => ApiErrorHandler.handleError(error),
      )
          .chainEither(
            (response) => Either<ApiException, Response>.fromPredicate(
              response,
              (r) => r.statusCode == 200 && r.statusCode! < 300,
              (response) => ApiErrorHandler.handleError(response.data),
            ).map((a) => a.data),
          )
          .chainEither(
            (json) => Either<ApiException, Map<String, dynamic>>.safeCast(
              json,
              (e) => UnSuccessfulOperationException(message: e.toString()),
            ),
          )
          .chainEither(
            (dataObject) => Either.tryCatch(
              () => GenericResponse.fromJson(dataObject),
              (error, stackTrace) => InternalServerErrorException(
                message: error.toString(),
              ),
            ),
          );

  TaskEither<ApiException, GenericResponse> resendConfirmation(String email) => TaskEither<ApiException, Response>.tryCatch(
        () => client.post(
          "${Env.apiLocalDevUrl}/auth/resend-confirmation",
          data: {"email": email},
        ),
        (error, stackTrace) => ApiErrorHandler.handleError(error),
      )
          .chainEither(
            (response) => Either<ApiException, Response>.fromPredicate(
              response,
              (r) => r.statusCode == 200 && r.statusCode! < 300,
              (response) => ApiErrorHandler.handleError(response.data),
            ),
          )
          .chainEither(
            (json) => Either<ApiException, Map<String, dynamic>>.safeCast(
              json,
              (e) => InternalServerErrorException(message: e),
            ),
          )
          .chainEither(
            (data) => Either.tryCatch(
              () => GenericResponse.fromJson(data),
              (error, stackTrace) => InternalServerErrorException(
                message: error.toString(),
              ),
            ),
          );
}

@riverpod
AuthRepository authRepositoryProvider(AuthRepositoryProviderRef ref) {
  return AuthRepository(client: ref.watch(dioProvider));
}
