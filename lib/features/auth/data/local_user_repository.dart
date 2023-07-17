import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/core/constants/local_db/box_names.dart';
import 'package:sorioo/features/auth/domain/local/local_user.dart';

part 'local_user_repository.g.dart';

class LocalUserRepository {
  LocalUserRepository();
  late Box<LocalUser> _hive;
  late LocalUser _box;

  LocalUser getLoggedUser(String id) {
    _hive = Hive.box<LocalUser>(localUserBoxName);

    return _hive.values
        .where(
          (lu) => lu.id == id,
        )
        .first;
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
}

@riverpod
LocalUserRepository localUserRepository(
  LocalUserRepositoryRef ref,
) {
  return LocalUserRepository();
}
