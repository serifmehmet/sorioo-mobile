import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sorioo/core/http/api_error.dart';

part 'generic_response.freezed.dart';
part 'generic_response.g.dart';

@Freezed(genericArgumentFactories: true)
class GenericResponse<T> with _$GenericResponse<T> {
  factory GenericResponse({
    T? data,
    ApiError? error,
  }) = _GenericResponse;

  factory GenericResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$GenericResponseFromJson<T>(json, fromJsonT);
}
