class EmailRegisterSecondPageArgs {
  EmailRegisterSecondPageArgs({
    required this.email,
    required this.fullName,
  });
  final String email;
  final String fullName;
}

class EmailVerifyPageArgs {
  EmailVerifyPageArgs({required this.email});

  final String email;
}
