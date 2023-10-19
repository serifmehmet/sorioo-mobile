import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/core/theme/widgets/text/app_text_form_field_widget.dart';
import 'package:sorioo/features/advert/presentation/create_advert/create_advert_controller.dart';

class GetAdvertInfoView extends ConsumerStatefulWidget {
  const GetAdvertInfoView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GetAdvertInfoViewState();
}

class _GetAdvertInfoViewState extends ConsumerState<GetAdvertInfoView> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _needsToStartController = TextEditingController();

  String get title => _titleController.text;
  String get description => _descriptionController.text;
  String get needsToStart => _needsToStartController.text;

  final _node = FocusScopeNode();

  @override
  void dispose() {
    _node.dispose();
    _descriptionController.dispose();
    _needsToStartController.dispose();
    _titleController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kSemiBigPadding,
      child: SingleChildScrollView(
        child: FocusScope(
          node: _node,
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  'Açıklama',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                const AppGap.semiBig(),
                AppText(
                  'Hizmet başlığın',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w100,
                      ),
                ),
                const AppGap.regular(),
                AppTextFormField(
                  controller: _titleController,
                  enabled: true,
                  autofocus: false,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.text,
                  hintText: 'Örn: .... konusunda ... hizmetini verebilirim.',
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == '') {
                      return 'Bu alan boş bırakılamaz';
                    } else if (value!.length < 30) {
                      return 'Başlık minimum 30 karakter olmalıdır.';
                    }

                    return null;
                  },
                  onEditingComplete: () {
                    if (title != '') _node.nextFocus();
                  },
                ),
                const AppGap.semiBig(),
                AppText(
                  'Hizmet detayları, minimum 150 karakter!',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w100,
                      ),
                ),
                const AppGap.regular(),
                AppTextFormField(
                  controller: _descriptionController,
                  enabled: true,
                  autofocus: false,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.multiline,
                  maxLines: 5,
                  hintText: 'Minimum 150 karakterle verdiğiniz hizmeti anlatın.',
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == '') {
                      return 'Bu alan boş bırakılamaz';
                    } else if (value!.length < 150) {
                      return 'Açıklama 150 karakterden fazla olmalıdır.';
                    }

                    return null;
                  },
                  onEditingComplete: () {
                    if (description != '') _node.nextFocus();
                  },
                ),
                const AppGap.semiBig(),
                AppText(
                  'Hizmeti vermeniz için gerekenler !',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w100,
                      ),
                ),
                const AppGap.regular(),
                AppTextFormField(
                  controller: _needsToStartController,
                  enabled: true,
                  autofocus: false,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.multiline,
                  maxLines: 5,
                  hintText: 'İşe başlamak için nelere ihtiyacın var?.',
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == '') return 'Bu alan boş bırakılamaz.';
                    return null;
                  },
                  onEditingComplete: () {
                    if (needsToStart != '' && title != '' && description != '') {
                      ref.read(createAdvertControllerProvider.notifier).changeValidationState(
                            true,
                          );
                      ref.read(createAdvertControllerProvider.notifier).changeInfoValues(
                            title,
                            description,
                            needsToStart,
                          );
                      _node.unfocus();
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
