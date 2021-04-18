import 'dart:async';
import 'package:get/get.dart';
import 'package:egou_app/common/routes.dart';

import 'state.dart';

class LaunchLogic extends GetxController {
  final LaunchState state = LaunchState();
  Timer _timer;
  void StartCountDown() {
    if(_timer is Timer) _timer.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      print(timer);
      if (state.CountDownSeconds <= 1) {
        _timer.cancel();
        // 跳转页面
        Get.offNamed(RouteConfig.main_page);
      } else {
        --state.CountDownSeconds;
      }
    });
  }
}
