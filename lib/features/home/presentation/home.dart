import 'package:flutter/material.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/features/home/presentation/widgets/category_card.dart';
import 'package:sorioo/features/home/presentation/widgets/custom_header.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var top = 0.0;
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
            sliver: SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 220,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return const CategoryCard();
              },
              itemCount: 16,
            ),
          ),
        ],
      ),
    );
  }
}
