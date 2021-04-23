import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/models/global.dart';
import 'package:get/get.dart';

class GoodsDetailState {
  RxList<SwiperItemModel> BannerList;
  RxInt current;
  GoodsDetailState() {
    ///Initialize variables
    current = 0.obs;
    BannerList = [
      SwiperItemModel({'url': AppImages.GOODS_IMG_1, 'color': '#000000'})
    ].obs;
  }
}