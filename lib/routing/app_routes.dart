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
  message(name: 'message', path: '/message');

  const AppRoutes({
    required this.name,
    required this.path,
  });

  final String name;
  final String path;

  @override
  String toString() => name;
}
