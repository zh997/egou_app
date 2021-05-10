import 'package:get/get.dart';

class PwdUpdateState {
  RxInt CountDownSeconds;
  RxBool isStartCountdown;
  RxBool disabled = true.obs;
  PwdUpdateState() {
    ///Initialize variables
    this.CountDownSeconds = 60.obs;
    this.isStartCountdown = false.obs;
  }
}
