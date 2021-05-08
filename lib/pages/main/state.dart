import 'package:get/get.dart';

class MainState {
  RxInt shopType;
  RxInt pageIndex = 0.obs;
  MainState() {
    ///Initialize variables
    shopType = 1.obs;
  }
}
