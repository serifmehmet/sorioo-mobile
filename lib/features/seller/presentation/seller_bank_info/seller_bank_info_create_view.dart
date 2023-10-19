import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:sorioo/common/providers/local_user_provider.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/button/app_button.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/core/theme/widgets/text/app_text_form_field_widget.dart';
import 'package:sorioo/features/auth/data/local_user_repository.dart';
import 'package:sorioo/features/seller/domain/seller_bank_info.dart';
import 'package:sorioo/features/seller/presentation/seller_bank_info/seller_bank_info_controller.dart';
import 'package:sorioo/features/seller/presentation/seller_bank_info/validators/seller_bank_info_validators.dart';

class SellerBankInfoCreateView extends ConsumerStatefulWidget {
  const SellerBankInfoCreateView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SellerBankInfoCreateViewState();
}

class _SellerBankInfoCreateViewState extends ConsumerState<SellerBankInfoCreateView> with SellerBankInfoValidators {
  final _bankName = TextEditingController();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _iban = TextEditingController();
  final _identityNumber = TextEditingController();
  final _billingAddress = TextEditingController();

  String get bankName => _bankName.text;
  String get firstName => _firstName.text;
  String get lastName => _lastName.text;
  String get iban => _iban.text;
  String get identityNumber => _identityNumber.text;
  String get billingAddress => _billingAddress.text;

  final _formKey = GlobalKey<FormState>();
  final _node = FocusScopeNode();
  var _submitted = false;

  @override
  void dispose() {
    _bankName.dispose();
    _firstName.dispose();
    _lastName.dispose();
    _iban.dispose();
    _node.dispose();
    _identityNumber.dispose();
    _billingAddress.dispose();
    super.dispose();
  }

  Future<void> _submit(String sellerId) async {
    setState(() {
      _submitted = true;
    });

    if (_formKey.currentState!.validate()) {
      final sellerBankInfo = SellerBankInfo(
        bankName: bankName,
        billingAddress: billingAddress,
        iban: iban,
        firstName: firstName,
        lastName: lastName,
        identityNumber: identityNumber,
        sellerId: sellerId,
      );

      final controller = ref.read(sellerBankInfoControllerProvider.notifier);
      await controller.createSellerBankInfo(sellerBankInfo);
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      sellerBankInfoControllerProvider,
      (_, state) {
        if (!state.isLoading && !state.hasError) {
          Fluttertoast.showToast(
            msg: 'Profiliniz başarılı bir şekilde güncellenmeiştir.',
            toastLength: Toast.LENGTH_LONG,
            backgroundColor: Theme.of(context).colorScheme.primary,
            fontSize: 16,
          ).then(
            (value) => GoRouter.of(context).pop(),
          );
        }
      },
    );

    final sellerBankInfoState = ref.watch(sellerBankInfoControllerProvider);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const AppText(
            'Banka Bilgisi Oluştur',
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: sellerBankInfoState.maybeWhen(
                orElse: () => SingleChildScrollView(
                  child: Padding(
                    padding: kSemiBigPadding,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFFFFF),
                      ),
                      padding: kSemiBigPadding,
                      child: FocusScope(
                        node: _node,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                'Ad',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const AppGap.semiSmall(),
                              AppTextFormField(
                                enabled: true,
                                autofocus: false,
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.text,
                                hintText: '',
                                controller: _firstName,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (firstName) => !_submitted
                                    ? null
                                    : firstNameErrorText(
                                        firstName ?? '',
                                      ),
                                onEditingComplete: () {
                                  if (canSubmitFirstName(firstName)) {
                                    _node.nextFocus();
                                  }
                                },
                              ),
                              AppText(
                                'Soyad',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const AppGap.semiSmall(),
                              AppTextFormField(
                                enabled: true,
                                autofocus: false,
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.text,
                                hintText: '',
                                controller: _lastName,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (lastName) => !_submitted
                                    ? null
                                    : lastNameErrorText(
                                        lastName ?? '',
                                      ),
                                onEditingComplete: () {
                                  if (canSubmitlastName(lastName)) {
                                    _node.nextFocus();
                                  }
                                },
                              ),
                              AppText(
                                'Banka Adı',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const AppGap.semiSmall(),
                              AppTextFormField(
                                enabled: true,
                                autofocus: false,
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.text,
                                hintText: '',
                                controller: _bankName,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (bankName) => !_submitted
                                    ? null
                                    : bankNameErrorText(
                                        bankName ?? '',
                                      ),
                                onEditingComplete: () {
                                  if (canSubmitBankName(bankName)) {
                                    _node.nextFocus();
                                  }
                                },
                              ),
                              AppText(
                                'IBAN',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const AppGap.semiSmall(),
                              AppTextFormField(
                                enabled: true,
                                autofocus: false,
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.text,
                                hintText: '',
                                controller: _iban,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (iban) => !_submitted
                                    ? null
                                    : ibanErrorText(
                                        iban ?? '',
                                      ),
                                onEditingComplete: () {
                                  if (canSubmitIban(iban)) {
                                    _node.nextFocus();
                                  }
                                },
                              ),
                              AppText(
                                'T.C. Kimlik Numarası',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const AppGap.semiSmall(),
                              AppTextFormField(
                                enabled: true,
                                autofocus: false,
                                textInputAction: TextInputAction.next,
                                textInputType: TextInputType.number,
                                hintText: '',
                                controller: _identityNumber,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (identity) => !_submitted
                                    ? null
                                    : identityErrorText(
                                        identity ?? '',
                                      ),
                                onEditingComplete: () {
                                  if (canSubmitIdentity(identityNumber)) {
                                    _node.nextFocus();
                                  }
                                },
                              ),
                              AppText(
                                'Adres',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const AppGap.semiSmall(),
                              AppTextFormField(
                                enabled: true,
                                autofocus: false,
                                textInputAction: TextInputAction.done,
                                textInputType: TextInputType.text,
                                hintText: '',
                                controller: _billingAddress,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (address) => !_submitted
                                    ? null
                                    : addressErrorText(
                                        address ?? '',
                                      ),
                              ),
                              const AppGap.big(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
            Container(
              padding: kSemiBigPadding,
              decoration: const BoxDecoration(color: Color(0xFFFFFFFF)),
              child: AppPrimaryButton(
                title: 'Kaydet',
                onTap: () => _submit(
                  ref.watch(localUserServiceProvider).sellerId!,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
