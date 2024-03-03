import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sorioo/core/http/api_exception.dart';
import 'package:sorioo/features/profile/data/user_profile_repository.dart';
import 'package:sorioo/features/profile/domain/buyer_profile.dart';

part 'profile_service.g.dart';

class ProfileService {
  ProfileService({required UserProfileRepository userProfileRepository})
      : _userProfileRepository = userProfileRepository;
  final UserProfileRepository _userProfileRepository;

  Future<BuyerProfile> getBuyerProfile(String userId) async {
    final getUserProfileTask = await _userProfileRepository.getUserProfile(userId).run();

    return getUserProfileTask.fold(
      (error) => throw ApiException(message: error.toString()),
      (userProfile) => userProfile.data!,
    );
  }
}

@riverpod
ProfileService profileService(ProfileServiceRef ref) {
  return ProfileService(
    userProfileRepository: ref.watch(userProfileRepositoryProvider),
  );
}

@riverpod
Future<BuyerProfile> getBuyerProfile(GetBuyerProfileRef ref, {String buyerId = ''}) async {
  final buyerProfile = await ref.watch(profileServiceProvider).getBuyerProfile(buyerId);
  return buyerProfile;
}
