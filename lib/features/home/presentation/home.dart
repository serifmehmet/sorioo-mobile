import 'package:flutter/material.dart';
import 'package:sorioo/core/theme/gap.dart';

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
          const SliverToBoxAdapter(
            child: AppGap.big(),
          ),
        ],
      ),
    );
  }
}
