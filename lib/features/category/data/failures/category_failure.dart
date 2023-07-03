import 'package:dio/dio.dart';

import '../../../../core/failures/api_failure.dart';

class CategoryHttpRequestFailure implements ApiFailure {
  CategoryHttpRequestFailure(this.object, this.stackTrace);
  final Object object;
  final StackTrace stackTrace;
}

class CategoryRequestNotSuccessfulFailure implements ApiFailure {
  const CategoryRequestNotSuccessfulFailure(this.response);
  final Response response;
}

class CategoryInvalidJsonFailure implements ApiFailure {
  const CategoryInvalidJsonFailure(this.body);
  final String body;
}

class CategoryInvalidMapFaliure implements ApiFailure {
  const CategoryInvalidMapFaliure(this.json);
  final dynamic json;
}

class CategoryInvalidResponseTypeFailure implements ApiFailure {}

class CategoryInvalidListFailure implements ApiFailure {
  const CategoryInvalidListFailure(this.value);
  final dynamic value;
}

class CategoryDataFormattingFailure implements ApiFailure {
  const CategoryDataFormattingFailure(this.object, this.stackTrace);

  final Object object;
  final StackTrace stackTrace;
}
