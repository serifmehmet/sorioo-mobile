import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/auth_repository.dart';
import '../../domain/user.dart';

part 'email_register_controller.g.dart';

@riverpod
class EmailRegisterController extends _$EmailRegisterController {
  @override
  FutureOr<void> build() {}

  Future<bool> submit(User user) async {
    final repository = ref.watch(authRepositoryProviderProvider);
    state = const AsyncValue.loading();
    final response = repository.createUser(user);
    state = (await response.run()).match(
      (error) => AsyncError(
        error,
        StackTrace.current,
      ),
      (success) {
        return const AsyncData(true);
      },
    );

    return state.hasError == false;
  }
}
