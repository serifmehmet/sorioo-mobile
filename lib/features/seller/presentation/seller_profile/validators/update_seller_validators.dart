import 'package:sorioo/core/validation/string_validators.dart';

mixin UpdateSellerValidators {
  final StringValidator fullNameValidator = NonEmptyStringValidator();

  bool canSubmitFullName(String fullName) {
    return fullNameValidator.isValid(fullName);
  }

  String? fullNameErrorText(String fullName) {
    final showErrorText = !canSubmitFullName(fullName);

    const errorText = 'Ad-Soyad alanı boş bırakılamaz.';

    return showErrorText ? errorText : null;
  }
}
