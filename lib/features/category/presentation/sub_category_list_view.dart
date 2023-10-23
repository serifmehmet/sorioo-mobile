import 'package:flutter/material.dart';
import 'package:sorioo/core/theme/constants.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/features/category/presentation/route_args/sub_category_args.dart';
import 'package:sorioo/features/category/presentation/widgets/sub_category_list_view_widget.dart';

class SubCategoryListView extends StatelessWidget {
  const SubCategoryListView({required this.args, super.key});

  final SubCategoryArgs args;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: AppText(args.mainCategoryTitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: kSemiBigPadding,
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    maxRadius: 30,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: Image.asset('assets/images/question-mark.png'),
                  ),
                  const AppGap.semiBig(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        args.mainCategoryTitle,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      AppText(
                        '1.200 Hizmet veren',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const AppGap.big(),
                    ],
                  ),
                ],
              ),
              const AppGap.big(),
              SubCategoryListViewWidget(
                mainCategoryName: args.mainCategoryTitle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
