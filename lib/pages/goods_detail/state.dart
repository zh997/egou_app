import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/models/global.dart';
import 'package:egou_app/models/goods_detail.dart';
import 'package:get/get.dart';

class GoodsDetailState {
  RxInt current;
  Rx<GoodsDetailModel> goodsDetail = GoodsDetailModel().obs;
  RxList selectedGoodsSpec = [].obs;
  RxList selectedGoodsSpecIds = [].obs;
  RxInt tabIndex = 0.obs;
  RxInt num = 1.obs;
  RxInt is_collect = 0.obs;
  GoodsDetailState() {
    ///Initialize variables
    current = 0.obs;
  }
}
