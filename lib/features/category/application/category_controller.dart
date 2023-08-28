import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:sorioo/core/http/api_exception.dart';
import 'package:sorioo/features/category/data/category_repository.dart';
import 'package:sorioo/features/category/domain/models/category.dart';

part 'category_controller.g.dart';

@riverpod
class CategoryController extends _$CategoryController {
  @override
  FutureOr<List<Category>> build() async {
    final repository = ref.read(categoryRepositoryProvider);

    final categoryTask = repository.fetchCategories();
    return categoryTask.getOrElse((l) => throw ApiException(message: l.toString())).run();
  }

  Future<Unit> _fetchAllRequest() async {
    final repository = ref.read(categoryRepositoryProvider);
    state = const AsyncLoading();
    final categories = repository.fetchCategories();

    state = (await categories.run()).match(
      (error) => AsyncError(error, StackTrace.current),
      AsyncData.new,
    );

    return unit;
  }
}
