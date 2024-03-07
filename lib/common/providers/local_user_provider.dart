import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/features/auth/data/local_user_repository.dart';

import 'package:sorioo/features/auth/domain/local/local_user.dart';

part 'local_user_provider.g.dart';

@riverpod
class LocalUserService extends _$LocalUserService {
  @override
  LocalUser build() {
    final localUser = ref.read(localUserRepositoryProvider).getLoggedUser();

    return localUser;
  }

  void makeUserSeller(String userId, String sellerId) {
    state = state.copyWith(isLoading: true);
    final localUser = ref.read(localUserRepositoryProvider).updateLocalUserRole(
          userId,
          sellerId,
        );
    state = state.copyWith(isSeller: localUser.isSeller, isLoading: false);
  }

  LocalUser updateLocalUserTokens(
    String userId,
    String accessToken,
    String refreshToken,
  ) {
    final localUser = ref.read(localUserRepositoryProvider).updateLocalUserTokens(
          userId,
          accessToken,
          refreshToken,
        );

    state = localUser;

    return localUser;
  }
}

// class LocalUserService {
//   LocalUserService({required LocalUserRepository localUserRepository}) : _localUserRepository = localUserRepository;

//   final LocalUserRepository _localUserRepository;

//   LocalUser getLoggedInUser(String userId) {
//     final localUser = _localUserRepository.getLoggedUser(userId);

//     return localUser;
//   }

//   void removeLoggedInUser(String userId) {
//     _localUserRepository.removeLoggedInUser(userId);
//   }
// }

// @riverpod
// LocalUserService localUserService(LocalUserServiceRef ref) {
//   return LocalUserService(
//     localUserRepository: ref.watch(localUserRepositoryProvider),
//   );
// }

// @riverpod
// LocalUser localUser(LocalUserRef ref, {required String userId}) {
//   final localUser = ref
//       .watch(
//         localUserRepositoryProvider,
//       )
//       .getLoggedUser(userId);

//   return localUser;
// }
