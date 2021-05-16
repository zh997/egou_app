import 'package:get/get.dart';

class MyStoreState {
  RxList collectGoods = [].obs;
  RxInt hasMore = 0.obs;
  RxInt page = 1.obs;
  MyStoreState() {
    ///Initialize variables
  }
}
