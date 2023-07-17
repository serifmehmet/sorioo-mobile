import 'package:hive/hive.dart';

part 'local_user.g.dart';

@HiveType(typeId: 1)
class LocalUser extends HiveObject {
  LocalUser(
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.userName,
    this.refreshToken,
    this.token,
  );

  String get fullName => '$firstName $lastName';

  @HiveField(0)
  String id;

  @HiveField(1)
  String firstName;

  @HiveField(2)
  String lastName;

  @HiveField(3)
  String userName;

  @HiveField(4)
  String email;

  @HiveField(5)
  String token;

  @HiveField(6)
  String refreshToken;

  @HiveField(7)
  String password;
}
