import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorioo/core/theme/constants.dart';

class SellerProfileEditView extends ConsumerStatefulWidget {
  const SellerProfileEditView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SellerProfileEditViewState();
}

class _SellerProfileEditViewState extends ConsumerState<SellerProfileEditView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: const Padding(
          padding: kSemiBigPadding,
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
          ),
        ),
      ),
    );
  }
}
