import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/gap.dart';
import '../application/category_controller.dart';
import 'widgets/category_card.dart';
import 'widgets/custom_header.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          toolbarHeight: 10,
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: CustomHeader(
            collapsedHeight: kToolbarHeight + 20,
            expandedHeight: 210,
          ),
        ),
        const SliverToBoxAdapter(
          child: AppGap.big(),
        ),
        SliverPadding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          sliver: Consumer(
            builder: (context, ref, child) {
              var categoryController = ref.watch(categoryControllerProvider);
              return categoryController.map(
                data: (data) {
                  return SliverGrid.builder(
                    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 220,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return CategoryCard(
                        category: data.value[index],
                      );
                    },
                    itemCount: data.value.length,
                  );
                },
                error: (s) => const SliverToBoxAdapter(child: Center(child: Text("error"))),
                loading: (s) => const SliverToBoxAdapter(child: CircularProgressIndicator()),
              );
            },
          ),
        ),
      ],
    )

        // Consumer(
        //   builder: (_, ref, child) {
        //     var categoryController = ref.watch(categoryControllerProvider);
        //     return categoryController.map(
        //       data: (data) {
        //         return ListView.builder(
        //           itemBuilder: (context, index) {
        //             return Center(
        //               child: AppText(data.value[index].name, color: Colors.black),
        //             );
        //           },
        //           itemCount: data.value.length,
        //         );
        //       },
        //       error: (s) {
        //         return const SizedBox(
        //             child: Center(
        //           child: AppText("error", color: Colors.black),
        //         ));
        //       },
        //       loading: (l) => const CircularProgressIndicator(),
        //     );
        //   },
        // ),
        );
  }
}
