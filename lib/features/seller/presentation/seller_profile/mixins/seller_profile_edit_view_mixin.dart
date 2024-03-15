part of '../seller_profile_edit_view.dart';

mixin _SellerProfileEditViewMixin on ConsumerState<SellerProfileEditView> {
  final formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _bioController = TextEditingController();
  final _industryController = TextEditingController();
  final _graduationController = TextEditingController();
  String? selectedCategoryId;

  final _node = FocusScopeNode();
  final _submitted = false;
  bool isLoading = false;

  @override
  void dispose() {
    _node.dispose();
    _fullNameController.dispose();
    _bioController.dispose();
    _industryController.dispose();
    _graduationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _fullNameController.text = widget.args.fullName;
    _bioController.text = widget.args.profileBio;
    _industryController.text = widget.args.sellerIndustry;
    _graduationController.text = widget.args.sellerGraduation;
    selectedCategoryId = widget.args.sellerMainCategoryId;
    super.initState();
  }

  String get fullName => _fullNameController.text;
  String get bio => _bioController.text;
  String get industry => _industryController.text;
  String get graduation => _graduationController.text;

  Future<void> _submit() async {
    if (formKey.currentState!.validate()) {
      final controller = ref.read(sellerProfileControllerProvider.notifier);
      final imageNotifier = ref.watch(imagePickerNotifierProvider);
      final updateSellerDto = UpdateSellerDto(
        id: widget.args.id,
        fullName: fullName,
        userId: CacheManager.instance.getStringValue(PreferencesKeys.userId),
        graduation: graduation,
        industry: industry,
        sellerBio: bio,
        sellerMainCategoryId: selectedCategoryId,
        image: imageNotifier.filePath.isNotEmpty ? imageNotifier : null,
      );

      await controller.updateSellerInfo(updateSellerDto);
    }
  }
}
