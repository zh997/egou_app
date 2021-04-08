import 'package:get/get.dart';

class LaunchState {
  RxInt CountDownSeconds;
  LaunchState() {
     this.CountDownSeconds = 5.obs;
  }
}
