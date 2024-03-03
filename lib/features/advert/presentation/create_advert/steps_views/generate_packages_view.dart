import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';

import 'package:sorioo/features/advert/presentation/create_advert/steps_views/widgets/advert_ask_question_package_widget.dart';
import 'package:sorioo/features/advert/presentation/create_advert/steps_views/widgets/advert_preference_package_widget.dart';
import 'package:sorioo/features/advert/presentation/create_advert/steps_views/widgets/advert_support_package_widget.dart';

class GeneratePackagesView extends ConsumerStatefulWidget {
  const GeneratePackagesView({super.key});

  @override
  ConsumerState<GeneratePackagesView> createState() => _GeneratePackagesViewState();
}

class _GeneratePackagesViewState extends ConsumerState<GeneratePackagesView> {
  final _priceController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final _node = FocusScopeNode();

  String get price => _priceController.text;

  @override
  void dispose() {
    _priceController.dispose();
    _node.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: kSemiBigPadding,
        child: FocusScope(
          node: _node,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                AdvertAskQuestionPackageWidget(priceController: _priceController),
                const AppGap.regular(),
                AdvertPreferencePackageWidget(),
                const AppGap.regular(),
                AdvertSupportPackageWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
