import 'package:egou_app/models/goods_detail.dart';
import 'package:get/get.dart';

class ShopDetailState {
  Rx<GoodsDetailModel> goodsDetail = GoodsDetailModel().obs;
  ShopDetailState() {
    ///Initialize variables
  }
}
