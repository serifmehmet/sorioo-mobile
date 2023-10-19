import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_categories_provider.g.dart';

@riverpod
class SelectedCategoryNamesProvider extends _$SelectedCategoryNamesProvider {
  @override
  List<String> build() {
    return [];
  }

  void addCategory(String categoryName) {
    state = [...state, categoryName];
  }
}
