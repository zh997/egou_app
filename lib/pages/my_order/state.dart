import 'package:get/get.dart';

class MyOrderState {
  RxList orderLists = [].obs;
  RxInt hasMore = 0.obs;
  RxInt page = 1.obs;
  MyOrderState() {
    ///Initialize variables
  }
}
