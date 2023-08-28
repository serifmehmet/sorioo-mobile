import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sorioo/common/widgets/category_card.dart';
import 'package:sorioo/common/widgets/custom_header.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/features/category/application/category_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double top = 0;
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
              expandedHeight: 250,
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
                final categoryController = ref.watch(
                  categoryControllerProvider,
                );
                return categoryController.map(
                  data: (data) {
                    return SliverGrid.builder(
                      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                        mainAxisExtent: 200,
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
                  error: (s) => const SliverToBoxAdapter(
                    child: Center(
                      child: Text('error'),
                    ),
                  ),
                  loading: (s) => const SliverToBoxAdapter(
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
