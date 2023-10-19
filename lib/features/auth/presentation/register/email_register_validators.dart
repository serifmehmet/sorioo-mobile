import 'package:sorioo/core/validation/string_validators.dart';

mixin RegisterValidators {
  final StringValidator emailSubmitValidator = EmailSubmitRegexValidator();
  final StringValidator passwordRegisterSubmitValidator = MinLengthStringValidator(8);
  final StringValidator nameSubmitValidator = NonEmptyStringValidator();
  final StringValidator lastNameSubmitValidator = NonEmptyStringValidator();
  final StringValidator userNameSubmitValidator = NonEmptyStringValidator();

  bool canSubmitEmail(String email) {
    return emailSubmitValidator.isValid(email);
  }

  bool canSubmitFirstPassword(String passwordFirst) {
    return passwordRegisterSubmitValidator.isValid(passwordFirst);
  }

  bool canSubmitPasswordAll(String passwordFirst, String passwordSecond) {
    if (passwordFirst != passwordSecond) {
      return false;
    }

    return true;
  }

  bool canSubmitName(String name) {
    return nameSubmitValidator.isValid(name);
  }

  bool canSubmitLastName(String lastName) {
    return lastNameSubmitValidator.isValid(lastName);
  }

  bool canSubmitUserName(String userName) {
    return userNameSubmitValidator.isValid(userName);
  }

  String? emailErrorText(String email) {
    final showErrorText = !canSubmitEmail(email);

    final errorText = email.isEmpty ? 'E-Posta adresi boş bırakılamaz' : 'Geçersiz e-posta adresi';
    return showErrorText ? errorText : null;
  }

  String? passwordAllErrorText(String password, String passwordRetry) {
    final showErrorText = !canSubmitPasswordAll(password, passwordRetry);

    const errorText = 'İlk şifre ile ikinci aynı değil.';

    return showErrorText ? errorText : null;
  }

  String? passwordErrorText(String password) {
    final showErrorText = !canSubmitFirstPassword(password);

    final errorText = password.isEmpty ? 'Şifre alanı boş bırakılamaz' : 'Şifre uzunluğu 8 karakterden az olamaz.';
    return showErrorText ? errorText : null;
  }

  String? nameErrorText(String name) {
    final showErrorText = !canSubmitName(name);

    const errorText = 'İsim alanı boş bırakılamaz.';

    return showErrorText ? errorText : null;
  }

  String? lastNameErrorText(String lastName) {
    final showErrorText = !canSubmitLastName(lastName);

    return showErrorText ? 'Soyadı alanı boş bırakılamaz' : null;
  }

  String? userNameErrorText(String userName) {
    final showErrorText = !canSubmitUserName(userName);

    const errorText = 'Kullanıcı adı alanı boş bırakılamaz.';

    return showErrorText ? errorText : null;
  }
}
