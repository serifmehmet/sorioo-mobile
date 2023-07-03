import 'package:freezed_annotation/freezed_annotation.dart';

import '../domain/models/category.dart';

part 'category_state.freezed.dart';

@freezed
class CategoryState with _$CategoryState {
  const factory CategoryState.loading() = CategoryLoading;
  const factory CategoryState.categoriesLoaded(List<Category>? categories) = CategoriesLoaded;
}
