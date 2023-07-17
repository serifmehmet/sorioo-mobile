import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sorioo/core/constants/local_db/box_names.dart';

import 'package:sorioo/core/init/cache_manager.dart';
import 'package:sorioo/features/auth/domain/local/local_user.dart';

Future<ProviderContainer> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheManager.preferencesInit();
  await Hive.initFlutter();

  Hive.registerAdapter<LocalUser>(LocalUserAdapter());

  await Hive.openBox<LocalUser>(localUserBoxName);

  final container = ProviderContainer(overrides: []);

  return container;
}
