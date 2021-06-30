import 'package:egou_app/models/shop_info.dart';
import 'package:get/get.dart';

class ShopDetailState {
  Rx<ShopInfoModel> shopInfo = ShopInfoModel().obs;
  ShopDetailState() {
    ///Initialize variables
  }
}
