import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/core/http/api_exception.dart';

import '../data/category_repository.dart';
import '../domain/models/category.dart';

part 'category_controller.g.dart';

@riverpod
class CategoryController extends _$CategoryController {
  @override
  FutureOr<List<Category>> build() async {
    final repository = ref.read(categoryRepositoryProvider);

    final categoryTask = repository.fetchCategories();
    return categoryTask.getOrElse((l) => throw ApiException(message: l.toString())).run();
  }

  Future<Unit> fetch() async {
    final repository = ref.read(categoryRepositoryProvider);
    return _fetchAllRequest(
      () => repository.fetchCategories(),
    );
  }

  Future<Unit> _fetchAllRequest(
    TaskEither<ApiException, List<Category>> Function() request,
  ) async {
    state = const AsyncLoading();
    final categories = request();
    state = (await categories.run()).match(
      (error) => AsyncError(error, StackTrace.current),
      (categories) => AsyncData(categories),
    );

    return unit;
  }
}
