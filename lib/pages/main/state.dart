import 'package:egou_app/models/order.dart';
import 'package:get/get.dart';

class MainState {
  RxInt shopType;
  RxInt pageIndex = 0.obs;
  RxList orderGoods = [].obs;
  MainState() {
    ///Initialize variables
    shopType = 1.obs;
  }
}
