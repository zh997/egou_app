import 'package:egou_app/models/shop_info.dart';
import 'package:egou_app/models/shop_order_info.dart';
import 'package:get/get.dart';

class MyShopState {
  Rx<ShopInfoModel> shopInfo = ShopInfoModel().obs;
  Rx<ShopCodeModel> shopCode = ShopCodeModel().obs;
  Rx<ShopOrderInfoModel> shopOrderInfo = ShopOrderInfoModel().obs;
  MyShopState() {
    ///Initialize variables
  }
}
