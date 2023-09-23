class SellerProfileEditPageArgs {
  SellerProfileEditPageArgs({
    required this.id,
    required this.fullName,
    required this.profilePictureUrl,
    required this.profileBio,
    required this.sellerMainCategoryId,
    required this.sellerGraduation,
    required this.sellerIndustry,
  });

  final String id;
  final String fullName;
  final String profilePictureUrl;
  final String profileBio;
  final String sellerMainCategoryId;
  final String sellerIndustry;
  final String sellerGraduation;
}
