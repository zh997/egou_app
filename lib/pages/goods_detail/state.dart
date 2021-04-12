import 'package:egou_app/constant/app_images.dart';
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

class SwiperItemModel {
  String url;
  String color;
  SwiperItemModel(Map<String, dynamic> json) {
    this.url = json['url'];
    this.color = json['color'];
  }
}
