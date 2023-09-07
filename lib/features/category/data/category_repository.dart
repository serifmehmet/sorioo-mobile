import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/core/constants/env.dart';
import 'package:sorioo/core/http/api_exception.dart';

import 'package:sorioo/core/http/api_provider.dart';
import 'package:sorioo/features/category/domain/models/category.dart';

part 'category_repository.g.dart';

class CategoryRepository {
  CategoryRepository({required this.client});
  final Dio client;

  TaskEither<ApiException, List<Category>> fetchCategories() => TaskEither<ApiException, Response>.tryCatch(
        () => client.get('/Category/all'),
        (object, stackTrace) => ApiErrorHandler.handleError(object),
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
              (error) => InternalServerErrorException(message: error.toString()),
            ),
          )
          .chainEither((body) => body.lookup('data').toEither(() => ApiException(message: 'Key bulunamadı')))
          .chainEither(
            (categoryData) => Either<ApiException, List<dynamic>>.safeCast(
              categoryData,
              (d) => ApiException(message: 'Not a list'),
            ),
          )
          .chainEither(
            (results) => Either.tryCatch(
              () => categoriesFromJson(results),
              (error, stackTrace) => InternalServerErrorException(message: error.toString()),
            ),
          );
}

@riverpod
CategoryRepository categoryRepository(CategoryRepositoryRef ref) {
  return CategoryRepository(client: ref.watch(dioProvider));
}
