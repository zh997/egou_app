import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/models/goods_detail.dart';
import 'package:get/get.dart';

class GiftBagDetailState {
  RxList<GoodsImage> BannerList;
  RxInt current;
  GiftBagDetailState() {
    ///Initialize variables
    current = 0.obs;
    BannerList = [
      GoodsImage()
    ].obs;
  }
}
