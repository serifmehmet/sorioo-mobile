import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/auth_repository.dart';

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
      (success) => const AsyncData(true),
    );

    return state.hasError ? false : true;
  }

  Future<bool> resendConfirmation(String email) async {
    final repository = ref.watch(authRepositoryProviderProvider);
    state = const AsyncValue.loading();
    final response = repository.resendConfirmation(email);
    state = (await response.run()).match(
      (error) => AsyncError(error, StackTrace.current),
      (success) => const AsyncData(true),
    );

    return state.hasError == false;
  }
}
