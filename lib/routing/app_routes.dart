enum AppRoutes {
  splash(
    name: 'splash',
    path: '/splash',
  ),

  login(name: 'login', path: '/login'),
  register(name: 'register', path: '/register'),
  emailRegister(name: 'email-register', path: '/emailRegister'),
  emailRegisterLastStep(name: 'email-register-last-step', path: '/emailRegisterLastStep'),
  emailRegisterVerification(name: 'email-register-verification', path: '/emailRegisterVerification'),
  forgotPassword(name: 'forgotPassword', path: '/forgotPassword'),

  home(name: 'home', path: '/home'),
  category(name: 'category', path: '/category'),
  profile(name: 'profile', path: '/profile'),

  editProfile(name: 'editProfile', path: 'editProfile'),

  sellerProfile(name: 'sellerProfile', path: '/sellerProfile'),
  editSellerProfile(name: 'editSellerProfile', path: 'editSellerProfile'),
  sellerAccountInfo(name: 'sellerAccountInfo', path: 'sellerAccountInfo'),
  sellerBankInfo(name: 'sellerBankInfo', path: 'sellerBankInfo'),
  sellerAdverts(name: 'sellerAdverts', path: 'sellerAdverts'),
  sellerAdvertsCreate(name: 'sellerAdvertsCreate', path: 'sellerAdverts/sellerAdvertsCreate'),
  sellerAdvertsSubCategory(name: 'sellerAdvertsSubCategory', path: 'sellerAdverts/sellerAdvertsSubCategory'),
  createSellerBankInfo(name: 'createSellerBankInfo', path: 'createSellerBankInfo'),

  chat(name: 'chat', path: '/chat'),
  chatDetail(name: 'chatDetail', path: '/chatDetail');

  const AppRoutes({
    required this.name,
    required this.path,
  });

  final String name;
  final String path;

  @override
  String toString() => name;
}
