import 'package:hive/hive.dart';
import 'package:sorioo/core/constants/user_roles.dart';

part 'local_user.g.dart';

@HiveType(typeId: 1)
class LocalUser extends HiveObject {
  LocalUser(
    this.id,
    this.fullName,
    this.email,
    this.userName,
    this.refreshToken,
    this.token, {
    this.password = '',
    this.isSeller = false,
  });

  @HiveField(0)
  String id;

  @HiveField(1)
  String fullName;

  @HiveField(2)
  String userName;

  @HiveField(3)
  String email;

  @HiveField(4)
  String token;

  @HiveField(5)
  String refreshToken;

  @HiveField(6)
  String? password;

  @HiveField(7)
  bool? isSeller;
}
