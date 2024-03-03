import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/common/providers/local_user_provider.dart';
import 'package:sorioo/core/constants/preferences_keys.dart';
import 'package:sorioo/core/init/cache_manager.dart';
import 'package:sorioo/features/advert/domain/advert.dart';
import 'package:sorioo/features/advert/domain/advert_package.dart';

part 'create_advert_controller.g.dart';

@riverpod
class CreateAdvertController extends _$CreateAdvertController {
  @override
  Advert build() {
    // final userId = CacheManager.instance.getStringValue(PreferencesKeys.userId);
    final sellerId = ref.watch(
      localUserServiceProvider.select((user) => user.sellerId),
    );
    return Advert(
      advertMainCategoryId: '',
      advertSubCategoryId: '',
      title: '',
      details: '',
      needsToStart: '',
      sellerId: sellerId!,
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

  void addAdvertPackage(AdvertPackage advertPackage) {
    if (state.advertPackages != null) {
      state = state.copyWith(
        advertPackages: [...state.advertPackages!, advertPackage],
        isValidated: true,
      );
    } else {
      state = state.copyWith(
        advertPackages: [advertPackage],
        isValidated: true,
      );
    }
  }

  void deleteAdvertPackage(int packageType) {
    final apList = List<AdvertPackage>.from(state.advertPackages!)
      ..removeWhere(
        (element) => element.packageType == packageType,
      );

    state = state.copyWith(
      advertPackages: apList,
      isValidated: !state.advertPackages!.isNotEmpty,
    );
  }
}
