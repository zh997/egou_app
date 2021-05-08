import 'dart:async';
import 'package:egou_app/common/routes.dart';
import 'package:egou_app/common/storage.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:egou_app/services/login.dart';

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

  void sendSms(String mobile) async {
    EasyLoading.show(status: '加载中');
    final RealResponseData response = await LoginService.getSms(mobile);
    if (response.result) {
      StartCountDown();
      EasyLoading.showToast('发送成功!');
    }
  }

  void onLogin(data) async {
    EasyLoading.show(status: '加载中');
    RealResponseData response = await LoginService.smsLogin(data);
    if (response.result) {
      AppStorage.setString('token', response.data.token);
      EasyLoading.showToast('登录成功!');
      Get.offAllNamed(RouteConfig.main_page);
    }else {
      EasyLoading.dismiss();
    }
  }

  void onAccountLogin(data) async {
    EasyLoading.show(status: '加载中');
    RealResponseData response = await LoginService.accountLogin(data);
    print(data);
    if (response.result) {
      AppStorage.setString('token', response.data.token);
      EasyLoading.showToast('登录成功!');
      Get.offAllNamed(RouteConfig.main_page);
    }else {
      EasyLoading.dismiss();
    }
  }
}
