import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginState {
  RxInt CountDownSeconds;
  RxBool isStartCountdown;
  RxBool disabled;

  LoginState() {
    ///Initialize variables
    this.CountDownSeconds = 60.obs;
    this.isStartCountdown = false.obs;
    this.disabled = true.obs;
  }
}