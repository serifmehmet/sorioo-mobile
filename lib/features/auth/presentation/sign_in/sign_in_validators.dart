import 'package:sorioo/core/validation/string_validators.dart';

mixin SignInValidators {
  final StringValidator emailSubmitValidator = EmailSubmitRegexValidator();

  bool canSubmitEmail(String email) {
    return emailSubmitValidator.isValid(email);
  }

  bool canSubmitPassword(String password) {
    return password.isNotEmpty;
  }

  String? emailErrorText(String email) {
    final showErrorText = !canSubmitEmail(email);

    final errorText = email.isEmpty ? 'E-Posta adresi boş bırakılamaz' : 'Geçersiz e-posta adresi, lütfen geçerli bir e-posta adresi girin.';
    return showErrorText ? errorText : null;
  }

  String? passwordErrorText(String password) {
    final showErrorText = !canSubmitPassword(password);

    const errorText = 'Şifre alanı boş bırakılamaz.';

    return showErrorText ? errorText : null;
  }
}
