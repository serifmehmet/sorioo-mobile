import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/core/constants/local_db/box_names.dart';
import 'package:sorioo/features/auth/domain/local/local_user.dart';

part 'local_user_repository.g.dart';

class LocalUserRepository {
  LocalUserRepository();
  late Box<LocalUser> _hive;
  late LocalUser _box;

  LocalUser getLoggedUser() {
    _hive = Hive.box<LocalUser>(localUserBoxName);

    return _hive.values.first;
  }

  LocalUser addNewLoggedInUser(LocalUser localUser) {
    _hive = Hive.box<LocalUser>(localUserBoxName);
    _hive.add(localUser);

    return localUser;
  }

  void removeLoggedInUser(String id) {
    _hive = Hive.box<LocalUser>(localUserBoxName);
    _hive.deleteAt(
      _hive.values.toList().indexWhere((lu) => lu.id == id),
    );
  }

  void removeAll() {
    Hive.deleteFromDisk();
  }

  LocalUser updateLocalUserRole(String id) {
    _hive = Hive.box<LocalUser>(localUserBoxName);
    final localUser = _hive.values.where((lu) => lu.id == id).first..isSeller = true;

    _hive.put(localUser.key, localUser);

    return localUser;
  }

  LocalUser updateLocalUserTokens(
    String id,
    String accessToken,
    String refreshToken,
  ) {
    _hive = Hive.box<LocalUser>(localUserBoxName);
    final localUser = _hive.values.where((lu) => lu.id == id).first
      ..token = accessToken
      ..refreshToken = refreshToken;

    _hive.put(localUser.key, localUser);

    return localUser;
  }
}

@riverpod
LocalUserRepository localUserRepository(
  LocalUserRepositoryRef ref,
) {
  return LocalUserRepository();
}
