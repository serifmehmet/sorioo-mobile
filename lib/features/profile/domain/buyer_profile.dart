import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sorioo/common/models/image.dart';

part 'buyer_profile.freezed.dart';
part 'buyer_profile.g.dart';

@freezed
class BuyerProfile with _$BuyerProfile {
  factory BuyerProfile({
    required String fullName,
    @Default('') String phoneNumber,
    @Default('') String about,
    @Default('') String profilePictureUrl,
    Image? userProfileImage,
  }) = _BuyerProfile;

  factory BuyerProfile.fromJson(Map<String, dynamic> json) => _$BuyerProfileFromJson(json);
}
