import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/core/http/api_provider.dart';

part 'category_repository.g.dart';

class CategoryRepository {
  final ApiProvider apiProvider;

  CategoryRepository({required this.apiProvider});
}

@riverpod
CategoryRepository categoryRepository(Ref ref) {
  return CategoryRepository(apiProvider: ref.watch(networkProvider));
}
