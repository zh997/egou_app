import 'package:egou_app/models/shop_entry_list.dart';
import 'package:get/get.dart';

class ShopState {
  RxList gridList = [].obs;
  RxList shopEntryList = [].obs;
  Rx<ShopEntryListModel> selectedShop = ShopEntryListModel().obs;
  RxInt hasMore = 0.obs;
  RxInt page = 1.obs;
  ShopState() {
    ///Initialize variables
  }
}
