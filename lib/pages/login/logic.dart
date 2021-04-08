import 'dart:async';
import 'package:get/get.dart';

import 'state.dart';

class LoginLogic extends GetxController {
  Timer _timer;
  final state = LoginState();
  void onChangeDisabled (bool disabled) => state.disabled.value = disabled;
  void StartCountDown() {
    state.isStartCountdown.value = true;
    if(_timer is Timer) _timer.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      print(timer);
      if (state.CountDownSeconds.value <= 1) {
        _timer.cancel();
        state.isStartCountdown.value = false;
        state.CountDownSeconds.value = 60;
      } else {
        --state.CountDownSeconds;
      }
    });
  }
}
