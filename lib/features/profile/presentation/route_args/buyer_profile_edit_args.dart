class BuyerProfileEditArgs {
  BuyerProfileEditArgs({
    required this.fullName,
    required this.phoneNumber,
    required this.profilePictureUrl,
    required this.about,
  });

  final String fullName;
  final String phoneNumber;
  final String profilePictureUrl;
  final String about;
}
