import 'package:dio/dio.dart';

class ApiException implements Exception {
  ApiException({required this.message, this.code});
  final String? message;
  final int? code;

  @override
  String toString() => message ?? 'unknown error';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ApiException && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

class BadRequestException extends ApiException {
  BadRequestException({super.message});
}

class UnauthorizedException extends ApiException {
  UnauthorizedException({super.message});
}

class ForbiddenException extends ApiException {
  ForbiddenException({super.message});
}

class NotFoundException extends ApiException {
  NotFoundException({super.message, super.code});
}

class ConflictException extends ApiException {
  ConflictException({super.message});
}

class InternalServerErrorException extends ApiException {
  InternalServerErrorException({super.message});
}

class ResponseHasErrorException extends ApiException {
  ResponseHasErrorException({super.message});
}

class UnSuccessfulOperationException extends ApiException {
  UnSuccessfulOperationException({String message = 'Başarısız işlem'}) : super(message: message);
}

class BadGatewayException extends ApiException {
  BadGatewayException({super.message});
}

class ServiceUnavailableException extends ApiException {
  ServiceUnavailableException({super.message});
}

class ApiErrorHandler {
  static ApiException handleError(error) {
    if (error is DioException) {
      final e = error.response;
      switch (e?.statusCode) {
        case 400:
          return BadRequestException(message: e?.statusMessage);
        case 401:
          return UnauthorizedException(message: e?.statusMessage);
        case 403:
          return ForbiddenException(message: e?.statusMessage);
        case 404:
          return NotFoundException(message: e?.statusMessage);
        case 409:
          return ConflictException(message: e?.statusMessage);
        case 500:
          return InternalServerErrorException(message: e?.statusMessage);

        case 502:
          return BadGatewayException(message: e?.statusMessage);
        case 503:
          return ServiceUnavailableException(message: e?.statusMessage);
        default:
          return ApiException(message: 'Sunucu Hatası');
      }
    } else {
      return ApiException(message: 'Acaip bir hata var');
    }
  }
}
