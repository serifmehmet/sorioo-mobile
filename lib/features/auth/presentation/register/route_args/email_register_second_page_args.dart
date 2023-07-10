class EmailRegisterSecondPageArgs {
  final String email;
  final String name;
  final String lastName;

  EmailRegisterSecondPageArgs({
    required this.email,
    required this.name,
    required this.lastName,
  });
}

class EmailVerifyPageArgs {
  EmailVerifyPageArgs({required this.email});

  final String email;
}
