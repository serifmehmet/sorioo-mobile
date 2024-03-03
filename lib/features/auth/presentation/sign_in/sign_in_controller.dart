import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/core/constants/preferences_keys.dart';
import 'package:sorioo/core/constants/user_roles.dart';
import 'package:sorioo/core/http/api_exception.dart';
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
                id: success.data!.userId,
                fullName: success.data!.fullName,
                email: email,
                phoneNumber: success.data!.phoneNumber,
                password: password,
                userName: success.data!.userName,
                about: success.data!.about,
                profilePictureUrl: success.data!.profilePictureUrl,
                refreshToken: success.data!.refreshToken,
                token: success.data!.token,
                isSeller: success.data!.userRoles!.isSeller,
                sellerId: success.data!.sellerId,
              ),
            );
        CacheManager.instance.setStringValue(
          PreferencesKeys.userId,
          success.data!.userId,
        );
        CacheManager.instance.setBoolValue(PreferencesKeys.isLoggedIn, true);

        return const AsyncData(true);
      },
    );

    return state.hasError == false;
  }

  Future<bool> googleSignIn(String idToken) async {
    final authRepository = ref.watch(authRepositoryProviderProvider);

    const AsyncLoading<dynamic>();

    final authResult = authRepository.signInWithGoogle(
      idToken,
      'GOOGLE',
    );

    (await authResult.run()).match(
      (error) => AsyncError(
        error,
        StackTrace.current,
      ),
      (signInResult) {
        if (signInResult.error != null) {
          AsyncError(signInResult.error!.message, StackTrace.current);
        }

        ref
            .watch(
              localUserRepositoryProvider,
            )
            .addNewLoggedInUser(
              LocalUser(
                id: signInResult.data!.userId,
                fullName: signInResult.data!.fullName,
                email: signInResult.data!.email,
                userName: signInResult.data!.userName,
                phoneNumber: signInResult.data!.phoneNumber,
                refreshToken: signInResult.data!.refreshToken,
                token: signInResult.data!.token,
                profilePictureUrl: signInResult.data!.profilePictureUrl,
                about: signInResult.data!.about,
                isSeller: signInResult.data!.userRoles!.isSeller,
                sellerId: signInResult.data!.sellerId,
              ),
            );

        CacheManager.instance.setStringValue(
          PreferencesKeys.userId,
          signInResult.data!.userId,
        );
        CacheManager.instance.setBoolValue(PreferencesKeys.isLoggedIn, true);
        return const AsyncData(true);
      },
    );

    return state.hasError == false;
  }
}
