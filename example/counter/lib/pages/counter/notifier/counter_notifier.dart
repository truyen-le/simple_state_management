import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:simple_state_management/simple_state_management.dart';

import 'counter_state.dart';

class CounterNotifier extends SimpleStateNotifier<CounterState> {
  CounterNotifier() : super(const CounterState(count: 0));

  void increaseCount() {
    final updateCount = state.count + 1;
    update(state.copyWith(count: updateCount));
  }

  void decreaseCount() {
    final updateCount = state.count - 1;
    update(state.copyWith(count: updateCount));
  }

  Future<void> increaseCountAsync() async {
    EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.black);
    await Future.delayed(Duration(seconds: 1));
    final updateCount = state.count + 1;
    update(state.copyWith(count: updateCount));
    EasyLoading.dismiss();
  }

  Future<void> decreaseCountAsync() async {
    EasyLoading.show(dismissOnTap: false, maskType: EasyLoadingMaskType.black);
    await Future.delayed(Duration(seconds: 1));
    final updateCount = state.count - 1;
    update(state.copyWith(count: updateCount));
    EasyLoading.dismiss();
  }
}
