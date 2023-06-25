import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'bootstrap.dart';
import 'core/theme/custom_theme.dart';
import 'routing/app_router.dart';

Future main() async {
  runApp(
    UncontrolledProviderScope(container: await bootstrap(), child: const SoriooApp()),
  );
}

class SoriooApp extends ConsumerWidget {
  const SoriooApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerDelegate: goRouter.routerDelegate,
      routeInformationParser: goRouter.routeInformationParser,
      routeInformationProvider: goRouter.routeInformationProvider,
      title: 'Sorioo',
      theme: CustomTheme.appTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
