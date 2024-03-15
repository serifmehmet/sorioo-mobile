import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorioo/core/theme/gap.dart';
import 'package:sorioo/core/theme/widgets/text/app_text.dart';
import 'package:sorioo/features/advert/presentation/advert_detail/get_single_advert_provider.dart';
import 'package:sorioo/features/advert/presentation/route_args/advert_detail_args.dart';

class AdvertDetailView extends ConsumerWidget {
  const AdvertDetailView({required this.args, super.key});

  final AdvertDetailArgs args;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final advertItemState = ref.watch(
      getSingleAdvertProvider(advertId: args.advertId),
    );
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: AppText(args.advertUserName),
        ),
        body: advertItemState.when(
          data: (advert) {
            return Column(
              children: [
                Image.asset('assets/images/proffesional-header.png'),
                AppText(
                  advert.title!,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            );
          },
          error: (error, stackTrace) => Column(
            children: [
              Image.asset(
                'assets/images/no-data.png',
                width: 200,
              ),
              const AppGap.semiBig(),
              AppText(
                error.toString(),
                style: Theme.of(context).textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
