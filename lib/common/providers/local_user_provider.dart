import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/features/auth/data/local_user_repository.dart';

import 'package:sorioo/features/auth/domain/local/local_user.dart';

part 'local_user_provider.g.dart';

@Riverpod()
LocalUser localUser(LocalUserRef ref, {required String userId}) {
  final localUser = ref
      .watch(
        localUserRepositoryProvider,
      )
      .getLoggedUser(userId);

  return localUser;
}
