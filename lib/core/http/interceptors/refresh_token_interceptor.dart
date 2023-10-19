// import 'package:dio/dio.dart';
// import 'package:sorioo/core/constants/preferences_keys.dart';
// import 'package:sorioo/core/init/cache_manager.dart';

// class RefreshTokenInterceptor extends Interceptor {
//   @override
//   Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
//     final accessToken = CacheManager.instance.getStringValue(
//       PreferencesKeys.accessToken,
//     );

//     if (accessToken.isNotEmpty) {
//       options.headers['Authorization'] = 'Bearer $accessToken';
//     }

//     options.headers['Content-Type'] = 'application/json';

//     super.onRequest(options, handler);
//   }

//   @override
//   void onError(DioException e, ErrorInterceptorHandler handler) async {
//     if (e.response?.statusCode == 401) {
//       String newAccessToken = '';

//       e.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

//       return handler.resolve(await dio.)
//     }
//     super.onError(err, handler);
//   }
// }
