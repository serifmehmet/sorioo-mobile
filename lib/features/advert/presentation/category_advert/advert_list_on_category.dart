import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/features/advert/presentation/category_advert/get_advert_list_on_category_provider.dart';
import 'package:sorioo/features/advert/presentation/category_advert/widgets/advert_list_async_data_widget.dart';
import 'package:sorioo/features/advert/presentation/route_args/advert_list_args.dart';

class AdvertListOnCategory extends ConsumerWidget {
  const AdvertListOnCategory({required this.args, super.key});

  final AdvertListArgs args;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: AppText(args.categoryName),
        ),
        body: Padding(
          padding: kSemiBigPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                'mahmut erdem de bunu kabul etmek gerekir. bu konuda kamuoyu oluşturmaya çalışmak gerekiyor. bunun için allah teâlâ’nın zâtının gerisinde kalan yaşlı bir adam yaşarmış.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const AppGap.regular(),
              AppText(
                'İlanlar',
                style: Theme.of(context).textTheme.displayMedium,
              ),
              const AppGap.regular(),
              AdvertListAsyncDataWidget(
                categoryId: args.advertCategoryId,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
