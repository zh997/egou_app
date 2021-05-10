import 'dart:async';

import 'package:egou_app/common/routes.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/user.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'state.dart';

class PwdUpdateLogic extends GetxController {
  final state = PwdUpdateState();
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
    EasyLoading.show(status: '加载中');
    final RealResponseData response = await UserService.getSms(mobile);
    if (response.result) {
      StartCountDown();
      EasyLoading.showToast('发送成功!');
    }else {
      EasyLoading.dismiss();
    }
  }
  
  Future onUpdateLoginPwd (Map<String, dynamic> data) async {
    EasyLoading.show(status: '加载中');
    final RealResponseData response = await UserService.updateLoginPwd(data);
    if (response.result) {
      EasyLoading.showToast('修改成功!');
      Get.back();
    }
  }
}
