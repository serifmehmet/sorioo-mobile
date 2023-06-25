import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorioo/core/init/cache_manager.dart';

Future<ProviderContainer> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheManager.preferencesInit();
  final container = ProviderContainer(overrides: []);

  return container;
}
