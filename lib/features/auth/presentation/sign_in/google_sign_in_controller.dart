import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/core/constants/preferences_keys.dart';
import 'package:sorioo/core/constants/user_roles.dart';
import 'package:sorioo/core/http/api_exception.dart';
import 'package:sorioo/core/init/cache_manager.dart';
import 'package:sorioo/features/auth/data/auth_repository.dart';
import 'package:sorioo/features/auth/data/local_user_repository.dart';
import 'package:sorioo/features/auth/domain/local/local_user.dart';

part 'google_sign_in_controller.g.dart';

@riverpod
class GoogleSignInController extends _$GoogleSignInController {
  late Object? key;

  @override
  FutureOr<void> build() {
    key = Object();
    ref.onDispose(() => key = null);
  }

  Future<bool> googleSignIn(String idToken) async {
    final authRepository = ref.watch(authRepositoryProviderProvider);

    const AsyncLoading<dynamic>();

    final authResult = authRepository.signInWithGoogle(
      idToken,
      'GOOGLE',
    );

    (await authResult.run()).match(
      (error) => throw ApiException(message: error.message, code: error.code),
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
                id: signInResult.data!.user.id!,
                fullName: signInResult.data!.user.fullName!,
                email: signInResult.data!.user.email!,
                userName: signInResult.data!.user.userName!,
                refreshToken: signInResult.data!.refreshToken,
                token: signInResult.data!.token,
                googleProfilePictureUrl: signInResult.data!.user.googleProfilePictureUrl,
                isSeller: signInResult.data!.userRoles!.isSeller,
                sellerId: signInResult.data!.sellerId,
              ),
            );

        CacheManager.instance.setStringValue(
          PreferencesKeys.userId,
          signInResult.data!.user.id!,
        );
        CacheManager.instance.setBoolValue(PreferencesKeys.isLoggedIn, true);
        return const AsyncData(true);
      },
    );

    return state.hasError == false;
  }
}
