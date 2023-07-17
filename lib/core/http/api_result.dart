// import 'package:dio/dio.dart';
// import 'package:sorioo/core/http/api_error.dart';

// abstract class ApiResult<T> {
//   static const String _jsonNodeError = 'error';
//   static const String _jsonNodeData = 'data';

//   static ApiResult<T> fromResponse<T>(
//     Map<String, dynamic> object,
//     T Function(Map<String, dynamic>) mapper,
//   ) {
//     // final responseData = response.data;

//     if (responseData[_jsonNodeError] != null) {
//       return ServerError.fromResponse(response);
//     } else if (responseData[_jsonNodeData] != null) {
//       return Success(
//         mapper(response.data[_jsonNodeData] as Map<String, dynamic>),
//       );
//     } else {
//       return InternalError();
//     }
//   }
// }

// // class GenericResponse<T> extends ApiResult<T> {
// //   GenericResponse(this.error, this.data);
// //   final ApiError error;
// //   final T data;
// // }

// class Success<T> extends ApiResult<T> {
//   Success(this.data);
//   final T data;
// }

// class Failed<T> extends ApiResult<T> {
//   Failed(this.error);
//   ApiError error;
// }

// class ServerError<T> extends Failed<T> {
//   ServerError(super.error);
//   static const String _jsonNodeError = 'error';

//   static ServerError<T> fromResponse<T>(Response response) {
//     return ServerError(
//       ApiError.fromJson(response.data as Map<String, dynamic>),
//     );
//   }
// }

// class NetworkError<T> extends Failed<T> {
//   NetworkError(super.error);
// }

// class InternalError<T> extends Failed<T> {
//   InternalError() : super(ApiError.empty());
// }
