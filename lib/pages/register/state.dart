import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegisterState {
  RxInt CountDownSeconds;
  RxBool isStartCountdown;
  RxBool disabled;

  RegisterState() {
    ///Initialize variables
    this.CountDownSeconds = 60.obs;
    this.isStartCountdown = false.obs;
    this.disabled = true.obs;
  }
}
