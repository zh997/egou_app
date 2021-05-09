import 'package:egou_app/models/address.dart';
import 'package:egou_app/models/order.dart';
import 'package:get/get.dart';

class MainState {
  RxInt shopType;
  RxInt pageIndex = 0.obs;
  RxList orderGoods = [].obs;
  Rx<AddressListModel> selectAddress = AddressListModel().obs;
  RxList addressList = [].obs;
  MainState() {
    ///Initialize variables
    shopType = 1.obs;
  }
}
