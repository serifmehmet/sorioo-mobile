import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sorioo/common/providers/nav_state.dart';

class NavNotifier extends StateNotifier<NavState> {
  NavNotifier() : super(const NavState());

  void onIndexChanged(int index) {
    state = state.copyWith(index: index);
  }
}

final navProvider = StateNotifierProvider<NavNotifier, NavState>(
  (ref) => NavNotifier(),
);
