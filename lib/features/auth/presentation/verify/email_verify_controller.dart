import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/core/constants/preferences_keys.dart';
import 'package:sorioo/core/init/cache_manager.dart';

import 'package:sorioo/features/auth/data/auth_repository.dart';
import 'package:sorioo/features/auth/presentation/sign_in/sign_in_controller.dart';

part 'email_verify_controller.g.dart';

@riverpod
class EmailVerifyController extends _$EmailVerifyController {
  @override
  FutureOr<void> build() {}

  Future<bool> verifySubmit(String email, String code) async {
    final repository = ref.watch(authRepositoryProviderProvider);

    state = const AsyncValue.loading();
    final response = repository.verifyUser(email, code);
    state = (await response.run()).match(
      (error) => AsyncError(error, StackTrace.current),
      (successResponse) {
        if (successResponse.error != null) {
          return AsyncError(successResponse.error!.message, StackTrace.current);
        }

        ref.read(singInControllerProvider.notifier).login(
              email,
              CacheManager.instance.getStringValue(
                PreferencesKeys.password,
              ),
            );

        CacheManager.instance.deleteStringValue(
          PreferencesKeys.password,
        );

        return const AsyncData(true);
      },
    );

    return state.hasError ? false : true;
  }

  Future<bool> resendConfirmation(String email) async {
    final repository = ref.watch(authRepositoryProviderProvider);
    state = const AsyncValue.loading();
    final response = repository.resendConfirmation(email);
    state = (await response.run()).match(
      (error) => AsyncError(error, StackTrace.current),
      (successResponse) {
        return const AsyncData(true);
      },
    );

    return state.hasError == false;
  }
}
