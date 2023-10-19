import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/core/constants/preferences_keys.dart';
import 'package:sorioo/core/init/cache_manager.dart';
import 'package:sorioo/features/advert/domain/advert.dart';

part 'create_advert_controller.g.dart';

@riverpod
class CreateAdvertController extends _$CreateAdvertController {
  @override
  Advert build() {
    final userId = CacheManager.instance.getStringValue(PreferencesKeys.userId);
    return Advert(
      advertMainCategoryId: '',
      advertSubCategoryId: '',
      title: '',
      details: '',
      needsToStart: '',
      userId: userId,
      categoryName: '',
      subCategoryName: '',
      isValidated: false,
    );
  }

  void changeValidationState(bool value) {
    state = state.copyWith(isValidated: value);
  }

  void selectMainCategory(String mainCategoryId, String categoryName) {
    state = state.copyWith(
      advertMainCategoryId: mainCategoryId,
      categoryName: categoryName,
      isValidated: true,
    );
  }

  void selectSubCategory(String subCategoryId, String subCategoryName) {
    state = state.copyWith(
      advertSubCategoryId: subCategoryId,
      subCategoryName: subCategoryName,
      isValidated: true,
    );
  }

  void changeInfoValues(String title, String details, String needsToStart) {
    state = state.copyWith(
      title: title,
      details: details,
      needsToStart: needsToStart,
    );
  }
}
