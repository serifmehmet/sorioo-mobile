import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:sorioo/core/theme/constants.dart';

import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/features/advert/domain/advert.dart';
import 'package:sorioo/features/advert/presentation/advert_controller.dart';
import 'package:sorioo/features/advert/presentation/create_advert/create_advert_controller.dart';
import 'package:sorioo/features/advert/presentation/create_advert/selected_values_widget.dart';
import 'package:sorioo/features/advert/presentation/create_advert/steps_views/generate_packages_view.dart';
import 'package:sorioo/features/advert/presentation/create_advert/steps_views/get_advert_info_view.dart';
import 'package:sorioo/features/advert/presentation/create_advert/steps_views/select_category_view.dart';
import 'package:sorioo/features/advert/presentation/create_advert/steps_views/select_subcategory_view.dart';

part '../mixins/create_advert_view_mixin.dart';

class CreateAdvertView extends ConsumerStatefulWidget {
  const CreateAdvertView({super.key});

  @override
  ConsumerState<CreateAdvertView> createState() => _CreateAdvertViewState();
}

class _CreateAdvertViewState extends ConsumerState<CreateAdvertView> with _CreateAdvertViewMixin {
  @override
  Widget build(BuildContext context) {
    final isValidatedState = ref.watch(createAdvertControllerProvider.select((value) => value.isValidated));
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const AppText('Yeni İlan Oluşturma Sihirbazı'),
          leading: IconButton(
            icon: const Icon(
              Icons.close,
              size: 32,
            ),
            onPressed: () => GoRouter.of(context).pop(),
          ),
        ),
        body: Column(
          children: [
            const SelectedValuesWidget(),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: pages,
                onPageChanged: (index) {
                  setState(() {
                    _index = index;
                  });
                },
              ),
            ),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: kAppGray,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 20,
                  top: 8,
                  bottom: 8,
                ),
                child: Row(
                  mainAxisAlignment: _index == 0 ? MainAxisAlignment.end : MainAxisAlignment.spaceBetween,
                  children: [
                    if (_index != 0)
                      ElevatedButton(
                        onPressed: () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        },
                        style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            kAppGray,
                          ),
                        ),
                        child: const AppText('Bir Önceki Adım'),
                      ),
                    ElevatedButton(
                      onPressed: isValidatedState! ? saveNewAdvert : null,
                      child: _index == pages.length - 1 ? const AppText('Tamamla') : const AppText('Devam'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
