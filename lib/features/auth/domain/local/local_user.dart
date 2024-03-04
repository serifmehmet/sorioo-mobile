import 'package:hive/hive.dart';
import 'package:sorioo/core/constants/user_roles.dart';

part 'local_user.g.dart';

@HiveType(typeId: 1)
class LocalUser extends HiveObject {
  LocalUser({
    this.id = '',
    this.fullName = '',
    this.email = '',
    this.userName = '',
    this.refreshToken = '',
    this.profilePictureUrl = '',
    this.token = '',
    this.password = '',
    this.isSeller = false,
    this.sellerId = '',
    this.phoneNumber = '',
    this.about = '',
    this.isLoading = false,
  });

  factory LocalUser.empty() => LocalUser();

  LocalUser copyWith({
    String? id,
    String? fullName,
    String? email,
    String? userName,
    String? profilePictureUrl,
    String? refreshToken,
    String? token,
    String? password,
    bool? isSeller,
    String? sellerId,
    String? phoneNumber,
    String? about,
    bool? isLoading,
  }) {
    return LocalUser(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      userName: userName ?? this.userName,
      profilePictureUrl: profilePictureUrl ?? this.profilePictureUrl,
      refreshToken: refreshToken ?? this.refreshToken,
      token: token ?? this.token,
      password: password ?? this.password,
      isSeller: isSeller ?? this.isSeller,
      sellerId: sellerId ?? this.sellerId,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      about: about ?? this.about,
      isLoading: isLoading ?? this.isLoading,
    );
  }

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

  @HiveField(9)
  String? sellerId;

  @HiveField(10)
  String? profilePictureUrl;

  @HiveField(11)
  String? phoneNumber;

  @HiveField(12)
  String? about;

  bool? isLoading;
}
