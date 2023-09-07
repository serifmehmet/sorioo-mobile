import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:sorioo/common/models/status_message_response.dart';
import 'package:sorioo/core/constants/env.dart';
import 'package:sorioo/core/http/api_exception.dart';
import 'package:sorioo/core/http/api_provider.dart';
import 'package:sorioo/core/http/generic_response.dart';
import 'package:sorioo/features/auth/domain/auth_response.dart';
import 'package:sorioo/features/auth/domain/refresh_token_result.dart';
import 'package:sorioo/features/auth/domain/user.dart';

part 'auth_repository.g.dart';

class AuthRepository {
  AuthRepository({required this.client, required GoogleSignIn googleSignIn}) : _googleSignIn = googleSignIn;
  final Dio client;

  final GoogleSignIn _googleSignIn;

  ///createUser: Creates a new user and sends confirmation code to users mail address.
  TaskEither<ApiException, GenericResponse<StatusMessageResponse>> createUser(User user) => TaskEither<ApiException, Response>.tryCatch(
        () => client.post(
          '/auth/register',
          data: user.toJson(),
        ),
        (error, stackTrace) => ApiErrorHandler.handleError(error),
      )
          .chainEither(
            (response) => Either<ApiException, Response<dynamic>>.fromPredicate(
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
              (e) => InternalServerErrorException(message: e.toString()),
            ),
          )
          // .flatMap(
          //   validateError,
          // )
          .chainEither(
            (dataObject) => Either.tryCatch(
              () => GenericResponse<StatusMessageResponse>.fromJson(
                dataObject,
                (Object? statusJson) => StatusMessageResponse.fromJson(
                  statusJson! as Map<String, dynamic>,
                ),
              ),
              (error, stackTrace) => InternalServerErrorException(message: error.toString()),
            ),
          );

  // TaskEither<ApiException, Map<String, dynamic>> validateError(Map<String, dynamic> json) => json['error'] != null
  //     ? TaskEither.left(ResponseHasErrorException(message: json['error'].toString()))
  //     : TaskEither.of(
  //         json['data'] as Map<String, dynamic>,
  //       );

  ///verifyUser: To send verify user code to api.
  TaskEither<ApiException, GenericResponse<StatusMessageResponse>> verifyUser(String email, String code) =>
      TaskEither<ApiException, Response>.tryCatch(
        () => client.post(
          '/auth/verify',
          data: {'email': email, 'code': code},
        ),
        (error, stackTrace) => ApiErrorHandler.handleError(error),
      )
          .chainEither(
            (response) => Either<ApiException, Response>.fromPredicate(
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
              (error, stackTrace) => InternalServerErrorException(message: error.toString()),
            ),
          );

  ///resendConfirmation: ToSend confirm code to User
  TaskEither<ApiException, GenericResponse<StatusMessageResponse>> resendConfirmation(String email) => TaskEither<ApiException, Response>.tryCatch(
        () => client.post(
          '/auth/resend-confirmation',
          data: {'email': email},
        ),
        (error, stackTrace) => ApiErrorHandler.handleError(error),
      )
          .chainEither(
            (response) => Either<ApiException, Response>.fromPredicate(
              response,
              (r) => r.statusCode == 200 && r.statusCode! < 300,
              (response) => UnSuccessfulOperationException(message: response.statusMessage!),
            ),
          )
          .map((a) => a.data)
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
              (error, stackTrace) => InternalServerErrorException(message: error.toString()),
            ),
          );

  ///loginUser: To log user in the system and get the token and the user info
  TaskEither<ApiException, GenericResponse<AuthResponse>> loginUser(String email, String password) => TaskEither<ApiException, Response>.tryCatch(
        () => client.post(
          '/auth/login',
          data: {'password': password, 'email': email},
        ),
        (error, stackTrace) => ApiErrorHandler.handleError(error),
      )
          .chainEither(
            (response) => Either<ApiException, Response<dynamic>>.fromPredicate(
              response,
              (r) => r.statusCode == 200 && r.statusCode! < 300,
              (response) => ApiErrorHandler.handleError(response.statusMessage),
            ),
          )
          .map(
            (a) => a.data,
          )
          .chainEither(
            (json) => Either<ApiException, Map<String, dynamic>>.safeCast(
              json,
              (error) => InternalServerErrorException(
                message: error.toString(),
              ),
            ),
          )
          .chainEither(
            (dataObject) => Either.tryCatch(
              () => GenericResponse<AuthResponse>.fromJson(
                dataObject,
                (Object? authResponseJson) => AuthResponse.fromJson(
                  authResponseJson! as Map<String, dynamic>,
                ),
              ),
              (error, stackTrace) => InternalServerErrorException(
                message: error.toString(),
              ),
            ),
          );

  TaskEither<ApiException, GenericResponse<AuthResponse>> signInWithGoogle(
    String idToken,
    String provider,
  ) =>
      TaskEither<ApiException, Response<dynamic>>.tryCatch(
        () => client.post(
          '/Auth/google-signin',
          data: {'idToken': idToken, 'provider': provider},
        ),
        (error, stackTrace) => ApiErrorHandler.handleError(error),
      )
          .chainEither(
            (response) => Either<ApiException, Response<dynamic>>.fromPredicate(
              response,
              (r) => r.statusCode == 200 && r.statusCode! < 300,
              (response) => ApiErrorHandler.handleError(response.statusMessage),
            ),
          )
          .map(
            (g) => g.data,
          )
          .chainEither(
            (json) => Either<ApiException, Map<String, dynamic>>.safeCast(
              json,
              (error) => InternalServerErrorException(message: error.toString()),
            ),
          )
          .chainEither(
            (dataObject) => Either.tryCatch(
              () => GenericResponse<AuthResponse>.fromJson(
                dataObject,
                (Object? authResponseJson) => AuthResponse.fromJson(
                  authResponseJson! as Map<String, dynamic>,
                ),
              ),
              (error, stackTrace) => InternalServerErrorException(
                message: error.toString(),
              ),
            ),
          );

  TaskEither<ApiException, GenericResponse<RefreshTokenResult>> refreshToken(
    String accessToken,
    String refreshToken,
  ) =>
      TaskEither<ApiException, Response<dynamic>>.tryCatch(
        () => client.post(
          '/Auth/refresh-token',
          data: {
            'accessToken': accessToken,
            'refreshToken': refreshToken,
          },
        ),
        (error, stackTrace) => ApiErrorHandler.handleError(
          error.toString(),
        ),
      )
          .chainEither(
            (response) => Either<ApiException, Response<dynamic>>.fromPredicate(
              response,
              (r) => r.statusCode == 200 && r.statusCode! < 300,
              (response) => ApiErrorHandler.handleError(response.statusMessage),
            ).map(
              (a) => a.data,
            ),
          )
          .chainEither(
            (json) => Either<ApiException, Map<String, dynamic>>.safeCast(
              json,
              (value) => ApiErrorHandler.handleError(
                value.toString(),
              ),
            ),
          )
          .chainEither(
            (dataObject) => Either.tryCatch(
              () => GenericResponse<RefreshTokenResult>.fromJson(
                dataObject,
                (Object? refreshTokenResult) => RefreshTokenResult.fromJson(
                  refreshTokenResult! as Map<String, dynamic>,
                ),
              ),
              (error, stackTrace) => ApiErrorHandler.handleError(error),
            ),
          );
}

@riverpod
AuthRepository authRepositoryProvider(AuthRepositoryProviderRef ref) {
  return AuthRepository(
    client: ref.watch(dioProvider),
    googleSignIn: GoogleSignIn(),
  );
}
