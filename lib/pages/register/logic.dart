import 'dart:async';

import 'package:egou_app/common/routes.dart';
import 'package:egou_app/common/storage.dart';
import 'package:egou_app/common/utils.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/login.dart';
import 'package:egou_app/services/register.dart';
import 'package:get/get.dart';

import 'state.dart';

class RegisterLogic extends GetxController {
  final state = RegisterState();
  Timer _timer;
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

  void sendSms(String mobile) async {
    final RealResponseData response = await RegisterService.getSms(mobile);
    if (response.result) {
      StartCountDown();
      Utils.toast('发送成功');
    }
  }

  void onAccountRegister(data) async {
    RealResponseData response = await RegisterService.register(data);
    if (response.result) {
      Utils.toast('注册成功, 请重新登录');
      Get.offAllNamed(RouteConfig.login_page);
    }
  }
}
