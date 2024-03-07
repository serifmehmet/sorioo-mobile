import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/features/category/domain/models/category.dart';
import 'package:sorioo/features/seller/presentation/seller_profile/widgets/seller_category/seller_category_dropdown_contoller.dart';

class CategoriesDropdownWidget extends ConsumerStatefulWidget {
  const CategoriesDropdownWidget({required this.onDropdownChanged, super.key, this.selectedCategoryId});

  final String? selectedCategoryId;
  final Function(String) onDropdownChanged;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CategoriesDropdownWidgetState();
}

class _CategoriesDropdownWidgetState extends ConsumerState<CategoriesDropdownWidget> {
  final String _selectedValue = '';
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(sellerCategoryDropdownControllerProvider);
    return state.when(
      data: (data) {
        return SizedBox(
          width: double.infinity,
          child: DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
            value: widget.selectedCategoryId == '' ? null : widget.selectedCategoryId,
            items: data!
                .map(
                  (catData) => DropdownMenuItem<String>(
                    value: catData.id,
                    child: AppText(
                      catData.name,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                )
                .toList(),
            onChanged: (String? value) {
              widget.onDropdownChanged(value!);
            },
            hint: AppText(
              'Lütfen bir kategori seçiniz.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        );
      },
      error: (o, s) => const SizedBox(),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
