import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/common/providers/local_user_provider.dart';
import 'package:sorioo/core/constants/preferences_keys.dart';
import 'package:sorioo/core/init/cache_manager.dart';
import 'package:sorioo/features/auth/domain/local/local_user.dart';
import 'package:sorioo/features/profile/data/user_profile_repository.dart';

part 'user_type_controller.g.dart';

@riverpod
class UserTypeController extends _$UserTypeController {
  late Object? key;
  @override
  FutureOr<void> build() {
    key = Object();
    ref.onDispose(() {
      key = null;
    });
  }

  Future<void> makeSeller() async {
    final key = this.key;
    final repository = ref.watch(userProfileRepositoryProviderProvider);
    final userId = CacheManager.instance.getStringValue(PreferencesKeys.userId);
    state = const AsyncLoading();

    final result = repository.makeUserSeller(userId);

    state = (await result.run()).match(
      (failure) => AsyncValue<dynamic>.error(
        failure,
        StackTrace.current,
      ),
      (success) {
        //update local user objects isSeller field

        final localUser = ref
            .read(
              localUserServiceProvider.notifier,
            )
            .makeUserSeller(userId);

        ref.refresh(localUserServiceProvider);

        return AsyncValue.data(localUser);
        //return message to user
      },
    );
  }
}
