
import 'package:get/get.dart';

class ShopState {
  RxList gridList = [].obs;
  RxList shopEntryList = [].obs;
  RxInt hasMore = 0.obs;
  RxInt page = 1.obs;
  ShopState() {
    ///Initialize variables
  }
}
