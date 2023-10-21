import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/common/models/status_message_response.dart';
import 'package:sorioo/common/providers/local_user_provider.dart';
import 'package:sorioo/core/constants/env.dart';
import 'package:sorioo/core/constants/preferences_keys.dart';
import 'package:sorioo/core/http/generic_response.dart';
import 'package:sorioo/core/init/cache_manager.dart';
import 'package:sorioo/features/auth/data/auth_repository.dart';
import 'package:sorioo/features/auth/domain/refresh_token_result.dart';

part 'api_provider.g.dart';

enum ContentType { urlEncoded, json }

@riverpod
Dio dio(DioRef ref) {
  late final dio = Dio();
  dio.options.baseUrl = Env.apiRemoteUrl;
  dio.options.sendTimeout = const Duration(seconds: 45);
  // dio.options.connectTimeout = const Duration(seconds: 5);
  dio.options.receiveTimeout = const Duration(seconds: 45);
  dio.interceptors.add(
    PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      compact: false,
    ),
  );
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        final isLoggedIn = CacheManager.instance.getBoolValue(
          PreferencesKeys.isLoggedIn,
        );

        if (isLoggedIn) {
          final loggedInuser = ref.watch(
            localUserServiceProvider,
          );

          if (loggedInuser.token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer ${loggedInuser.token}';
          }
        }

        options.headers['Content-Type'] = 'application/json';
        return handler.next(options);
      },
      onError: (e, handler) async {
        if (e.response?.statusCode == 401) {
          final loggedInuser = ref.watch(
            localUserServiceProvider,
          );

          final localUserService = ref.read(localUserServiceProvider.notifier);

          try {
            final result = await dio.post(
              '/Auth/refresh-token',
              data: {
                'accessToken': loggedInuser.token,
                'refreshToken': loggedInuser.refreshToken,
              },
            );

            if (result.statusCode == 200) {
              final refreshTokenObject = result.data as Map<String, dynamic>;

              final genericObject = GenericResponse<RefreshTokenResult>.fromJson(
                refreshTokenObject,
                (Object? tokenObject) => RefreshTokenResult.fromJson(
                  tokenObject! as Map<String, dynamic>,
                ),
              );

              dio.options.headers['Authorization'] = 'Bearer ${genericObject.data!.accessToken}';

              localUserService.updateLocalUserTokens(
                loggedInuser.id,
                genericObject.data!.accessToken,
                genericObject.data!.refreshToken,
              );

              return handler.resolve(
                await dio.fetch(e.requestOptions),
              );
            }
          } catch (e) {}
        }

        return handler.next(e);
      },
    ),
  );

  return dio;
}



// class ApiProvider {
//   ApiProvider(this._ref) {
//     _dio = Dio();
//     _dio.options.sendTimeout = const Duration(seconds: 5);
//     _dio.options.connectTimeout = const Duration(seconds: 5);
//     _dio.options.receiveTimeout = const Duration(seconds: 5);
//     _dio.interceptors.add(
//       InterceptorsWrapper(
//         onRequest: (options, handler) {
//           final jwtToken = CacheManager.instance.getStringValue(PreferencesKeys.accessToken);

//           if (jwtToken.isNotEmpty) options.headers["Authorization"] = 'Bearer $jwtToken';
//         },
//         onError: (e, handler) {
//           if (e.response?.statusCode == HttpStatus.unauthorized) {
//             //refresh token mechanism
//           }

//           handler.next(e);
//         },
//       ),
//     );

//     if (kDebugMode) {
//       _dio.interceptors.add(PrettyDioLogger(requestBody: true, error: true));
//     }

//     _baseUrl = Env.apiUrl;
//   }

//   final Ref _ref;

//   late Dio _dio;

//   late String _baseUrl;

  // Future<ApiResponse> post(
  //   String path,
  //   dynamic body, {
  //   String? newBaseUrl,
  //   String? token,
  //   Map<String, String?>? query,
  //   ContentType contentType = ContentType.json,
  // }) async {
  //   String url;
  //   if (newBaseUrl != null) {
  //     url = newBaseUrl + path;
  //   } else {
  //     url = _baseUrl + path;
  //   }

  //   var content = 'application/x-www-form-urlencoded';

  //   if (contentType == ContentType.json) {
  //     content = 'application/json';
  //   }

  //   try {
  //     final headers = {
  //       'accept': '*/*',
  //       'Content-Type': content,
  //     };

  //     final response = await _dio.post(
  //       url,
  //       data: body,
  //       queryParameters: query,
  //       options: Options(validateStatus: (status) => true, headers: headers),
  //     );

  //     if (response.statusCode == null) {
  //       return const ApiResponse.error(AppException.connectivity());
  //     }

  //     if (response.statusCode! < 300) {
  //       if (response.data['data'] != null) {
  //         return ApiResponse.success(response.data['data']);
  //       } else {
  //         return ApiResponse.success(response.data);
  //       }
  //     } else {
  //       if (response.statusCode == 401) {
  //         return const ApiResponse.error(AppException.unauthorized());
  //       } else if (response.statusCode == 502) {
  //         return const ApiResponse.error(AppException.error());
  //       } else {
  //         if (response.data['message'] != null) {
  //           return ApiResponse.error(
  //             AppException.errorWithMessage(response.data['message'] as String ?? ''),
  //           );
  //         } else {
  //           return const ApiResponse.error(AppException.error());
  //         }
  //       }
  //     }
  //   } on DioException catch (e) {
  //     if (e.error is SocketException) {
  //       return const ApiResponse.error(AppException.connectivity());
  //     }

  //     if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout || e.type == DioExceptionType.sendTimeout) {
  //       return const ApiResponse.error(AppException.connectivity());
  //     }

  //     return ApiResponse.error(AppException.errorWithMessage(e.message ?? ''));
  //   }
  // }

  // Future<Response> get(
  //   String path, {
  //   String? newBaseUrl,
  //   String? token,
  //   Map<String, dynamic>? query,
  //   ContentType contentType = ContentType.json,
  // }) async {
  //   var content = 'application/x-www-form-urlencoded';

  //   if (contentType == ContentType.json) {
  //     content = 'application/json; charset=utf-8';
  //   }

  //   final headers = {
  //     'accept': '*/*',
  //     'Content-Type': content,
  //   };

  //   try {
  //     final response = await _dio.get(
  //       _baseUrl + path,
  //       queryParameters: query,
  //       options: Options(
  //         validateStatus: (status) => true,
  //         headers: headers,
  //       ),
  //     );

  //     if (response == null) {
  //       return const ApiResponse.error(AppException.error());
  //     }

  //     if (response.statusCode == null) {
  //       return const ApiResponse.error(AppException.connectivity());
  //     }

  //     if (response.statusCode! < 300) {
  //       return ApiResponse.success(response.data['data']);
  //     } else {
  //       if (response.statusCode! == 404) {
  //         return const ApiResponse.error(AppException.connectivity());
  //       } else if (response.statusCode! == 401) {
  //         return const ApiResponse.error(AppException.unauthorized());
  //       } else if (response.statusCode! == 502) {
  //         return const ApiResponse.error(AppException.error());
  //       } else {
  //         if (response.data['error'] != null) {
  //           return ApiResponse.error(AppException.errorWithMessage(response.data['error'] as String ?? ''));
  //         } else {
  //           return const ApiResponse.error(AppException.error());
  //         }
  //       }
  //     }
  //   } on DioException catch (e) {
  //     if (e.error is SocketException) {
  //       return const ApiResponse.error(AppException.connectivity());
  //     }
  //     if (e.type == DioExceptionType.connectionTimeout || e.type == DioExceptionType.receiveTimeout || e.type == DioExceptionType.sendTimeout) {
  //       return const ApiResponse.error(AppException.connectivity());
  //     }
  //     return const ApiResponse.error(AppException.error());
  //   }
  // }
// }
