import 'package:get/get.dart';
class HomeState {
  RxList<SwiperItemModel> BannerList;
  RxInt current;
  HomeState() {
    ///Initialize variables
    current = 0.obs;
    BannerList = [
      SwiperItemModel({'url': 'static/images/banner.jpg', 'color': '#000000'})
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