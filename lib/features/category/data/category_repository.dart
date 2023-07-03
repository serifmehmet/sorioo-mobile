import 'package:dio/dio.dart';
import "package:fpdart/fpdart.dart";
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/core/constants/env.dart';
import 'package:sorioo/core/http/api_exception.dart';

import '../../../core/http/api_provider.dart';
import '../domain/models/category.dart';

part 'category_repository.g.dart';

class CategoryRepository {
  final Dio client;

  CategoryRepository({required this.client});

  TaskEither<ApiException, List<Category>> fetchCategories() => TaskEither<ApiException, Response>.tryCatch(
        () => client.get("${Env.apiLocalDevUrl}/Category/all"),
        (object, stackTrace) => ApiErrorHandler.handleError(object),
      )
          .chainEither((response) => Either<ApiException, Response>.fromPredicate(
                response,
                (r) => r.statusCode == 200 && r.statusCode! < 300,
                (response) => ApiErrorHandler.handleError(response.data),
              ).map((a) => a.data))
          .chainEither(
            (json) => Either<ApiException, Map<dynamic, dynamic>>.safeCast(
              json,
              (e) => InternalServerErrorException(message: e),
            ),
          )
          .chainEither((body) => body.lookup("data").toEither(() => ApiException(message: "Key bulunamadı")))
          .chainEither(
            (categoryData) => Either<ApiException, List<dynamic>>.safeCast(
              categoryData,
              (d) => ApiException(message: "Not a list"),
            ),
          )
          .chainEither(
            (results) => Either.tryCatch(
              () => categoriesFromJson(results),
              (error, stackTrace) => InternalServerErrorException(message: error.toString()),
            ),
          );
}

Either<E, String> _validateResponseBody<E>(
  Response response,
  E Function(Response) onError,
) =>
    Either<E, Response>.fromPredicate(response, (r) => r.statusCode == 200, onError).map((a) => a.data);

@riverpod
CategoryRepository categoryRepository(CategoryRepositoryRef ref) {
  return CategoryRepository(client: ref.watch(dioProvider));
}
