import 'package:egou_app/models/shop_info.dart';
import 'package:get/get.dart';

class DiscountPayState {
  Rx<ShopInfoModel> shopInfo = ShopInfoModel().obs;
  RxString income = '0.00'.obs;
  DiscountPayState() {
    ///Initialize variables
  }
}
