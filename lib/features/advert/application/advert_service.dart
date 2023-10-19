import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/core/http/api_exception.dart';

import 'package:sorioo/features/category/data/category_repository.dart';
import 'package:sorioo/features/category/domain/models/category.dart';

part 'advert_service.g.dart';

class AdvertService {
  AdvertService({required this.categoryRepository});
  final CategoryRepository categoryRepository;

  Future<List<Category>> getCategories() async {
    final categoriesTask = await categoryRepository.fetchCategories().run();

    return categoriesTask.fold(
      (error) => throw ApiException(message: error.message),
      (categoryList) => categoryList,
    );
  }

  Future<List<Category>> getSubCategoriesOnCategory(String mainCategoryId) async {
    final subCategoryTask = await categoryRepository
        .getSubCategoriesOnCategory(
          mainCategoryId,
        )
        .run();

    return subCategoryTask.fold(
      (error) => throw ApiException(message: error.message),
      (subCategoryList) => subCategoryList.data!,
    );
  }
}

@riverpod
AdvertService advertService(AdvertServiceRef ref) {
  return AdvertService(
    categoryRepository: ref.watch(categoryRepositoryProvider),
  );
}

@riverpod
Future<List<Category>?> getCategories(GetCategoriesRef ref) async {
  final categories = await ref.watch(advertServiceProvider).getCategories();
  return categories;
}

@riverpod
Future<List<Category>?> getSubCategories(GetSubCategoriesRef ref, {String mainCategoryId = ''}) async {
  final subCategories = await ref.watch(advertServiceProvider).getSubCategoriesOnCategory(mainCategoryId);
  return subCategories;
}
