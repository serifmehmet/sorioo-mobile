import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/core/constants/preferences_keys.dart';
import 'package:sorioo/core/constants/user_roles.dart';
import 'package:sorioo/core/init/cache_manager.dart';
import 'package:sorioo/features/auth/data/auth_repository.dart';
import 'package:sorioo/features/auth/data/local_user_repository.dart';
import 'package:sorioo/features/auth/domain/local/local_user.dart';

part 'sign_in_controller.g.dart';

@riverpod
class SingInController extends _$SingInController {
  @override
  FutureOr<void> build() {}

  Future<bool> login(String email, String password) async {
    final authRepository = ref.watch(authRepositoryProviderProvider);
    state = const AsyncLoading();
    final authResult = authRepository.loginUser(email, password);
    state = (await authResult.run()).match(
      (error) => AsyncError(
        error,
        StackTrace.current,
      ),
      (success) {
        if (success.error != null) {
          AsyncError(success.error!.message, StackTrace.current);
        }
        //? Save remote user data to local user
        ref
            .watch(
              localUserRepositoryProvider,
            )
            .addNewLoggedInUser(
              LocalUser(
                success.data!.user.id!,
                success.data!.user.fullName!,
                email,
                password: password,
                success.data!.user.userName!,
                success.data!.refreshToken,
                success.data!.token,
                isSeller: success.data!.userRoles!.isSeller,
              ),
            );
        CacheManager.instance.setStringValue(
          PreferencesKeys.userId,
          success.data!.user.id!,
        );
        CacheManager.instance.setBoolValue(PreferencesKeys.isLoggedIn, true);

        return const AsyncData(true);
      },
    );

    return state.hasError == false;
  }
}
