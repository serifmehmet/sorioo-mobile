part of '../create_advert/create_advert_view.dart';

mixin _CreateAdvertViewMixin on ConsumerState<CreateAdvertView> {
  int _index = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void changeIsValidated() => ref.read(createAdvertControllerProvider.notifier).changeValidationState(false);

  final pages = <Widget>[
    const SelectCategoryView(),
    const SelectSubCategoryView(),
    const GetAdvertInfoView(),
    const GeneratePackagesView(),
  ];

  Future<void> saveNewAdvert() async {
    if (_index != pages.length - 1) {
      await _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );

      changeIsValidated();
    } else {
      final localCreatedAdvert = ref.watch(createAdvertControllerProvider);

      final advert = Advert(
        advertMainCategoryId: localCreatedAdvert.advertMainCategoryId,
        advertSubCategoryId: localCreatedAdvert.advertSubCategoryId,
        title: localCreatedAdvert.title,
        details: localCreatedAdvert.details,
        needsToStart: localCreatedAdvert.needsToStart,
        sellerId: localCreatedAdvert.sellerId,
        advertPackages: localCreatedAdvert.advertPackages,
      );

      await ref.read(advertControllerProvider.notifier).saveNewAdvert(
            advert,
          );
    }
  }
}
