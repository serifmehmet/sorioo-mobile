import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:sorioo/core/constants/preferences_keys.dart';
import 'package:sorioo/core/init/cache_manager.dart';
import 'package:sorioo/features/auth/data/local_user_repository.dart';

part 'account_controller.g.dart';

@riverpod
class AccountController extends _$AccountController {
  late Object? key;
  @override
  FutureOr<bool> build() {
    key = Object();
    ref.onDispose(() {
      key = null;
    });

    return false;
  }

  Future<bool> logOut() async {
    state = const AsyncLoading();
    final key = this.key;

    final newState = await AsyncValue.guard(() async {
      ref.watch(localUserRepositoryProvider).removeLoggedInUser(
            CacheManager.instance.getStringValue(PreferencesKeys.userId),
          );
      await CacheManager.instance.setBoolValue(
        PreferencesKeys.isLoggedIn,
        false,
      );

      await CacheManager.instance.deleteStringValue(PreferencesKeys.password);
      await CacheManager.instance.deleteStringValue(PreferencesKeys.userId);

      return true;
    });

    if (key == this.key) {
      state = newState;
    }
    return state.hasError == false;
  }
}
