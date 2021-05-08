import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/models/global.dart';
import 'package:egou_app/models/goods_detail.dart';
import 'package:get/get.dart';

class GoodsDetailState {
  RxInt current;
  Rx<GoodsDetailModel> goodsDetail = GoodsDetailModel().obs;
  GoodsDetailState() {
    ///Initialize variables
    current = 0.obs;
  }
}