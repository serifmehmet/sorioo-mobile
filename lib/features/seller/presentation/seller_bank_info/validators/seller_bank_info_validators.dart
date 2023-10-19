import 'package:sorioo/core/validation/string_validators.dart';

mixin SellerBankInfoValidators {
  final StringValidator firstNameValidator = NonEmptyStringValidator();
  final StringValidator lastNameValidator = NonEmptyStringValidator();
  final StringValidator bankNameValidator = NonEmptyStringValidator();
  final StringValidator ibanValidator = MinLengthStringValidator(26);
  final StringValidator identityValidator = MinLengthStringValidator(11);
  final StringValidator addressValidator = NonEmptyStringValidator();

  bool canSubmitFirstName(String firstName) {
    return firstNameValidator.isValid(firstName);
  }

  bool canSubmitlastName(String lastName) {
    return lastNameValidator.isValid(lastName);
  }

  bool canSubmitBankName(String bankName) {
    return bankNameValidator.isValid(bankName);
  }

  bool canSubmitIban(String iban) {
    return ibanValidator.isValid(iban);
  }

  bool canSubmitIdentity(String identity) {
    return identityValidator.isValid(identity);
  }

  bool canSubmitAddress(String address) {
    return addressValidator.isValid(address);
  }

  String? firstNameErrorText(String firstName) {
    final showErrorText = !canSubmitFirstName(firstName);

    const errorText = 'Ad alanı boş bırakılamaz.';

    return showErrorText ? errorText : null;
  }

  String? lastNameErrorText(String lastName) {
    final showErrorText = !canSubmitlastName(lastName);

    const errorText = 'Soyad alanı boş bırakılamaz.';

    return showErrorText ? errorText : null;
  }

  String? bankNameErrorText(String bankName) {
    final showErrorText = !canSubmitBankName(bankName);

    const errorText = 'Banka adı alanı boş bırakılamaz.';

    return showErrorText ? errorText : null;
  }

  String? ibanErrorText(String iban) {
    final showErrorText = !canSubmitIban(iban);

    const errorText = 'IBAN numaranız 26 hane olmak zorundadır.';

    return showErrorText ? errorText : null;
  }

  String? identityErrorText(String identity) {
    final showErrorText = !canSubmitIdentity(identity);

    const errorText = 'TC Kimlik numaranız 11 hane olmak zorundadır.';

    return showErrorText ? errorText : null;
  }

  String? addressErrorText(String address) {
    final showErrorText = !canSubmitAddress(address);

    const errorText = 'Adres alanı boş bırakılamaz.';

    return showErrorText ? errorText : null;
  }
}
