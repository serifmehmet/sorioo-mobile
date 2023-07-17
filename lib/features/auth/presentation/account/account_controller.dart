import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:sorioo/core/constants/preferences_keys.dart';
import 'package:sorioo/core/init/cache_manager.dart';
import 'package:sorioo/features/auth/data/local_user_repository.dart';

part 'account_controller.g.dart';

@riverpod
class AccountController extends _$AccountController {
  @override
  FutureOr<void> build() {}

  Future<bool> logOut() async {
    state = const AsyncLoading();

    ref.watch(localUserRepositoryProvider).removeLoggedInUser(
          CacheManager.instance.getStringValue(PreferencesKeys.userId),
        );

    await CacheManager.instance.setBoolValue(PreferencesKeys.isLoggedIn, false);

    await CacheManager.instance.deleteStringValue(PreferencesKeys.password);
    await CacheManager.instance.deleteStringValue(PreferencesKeys.userId);

    state = const AsyncData(true);

    return true;
  }
}
