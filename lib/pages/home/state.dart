import 'package:get/get.dart';
class HomeState {
  RxList<SwiperItemModel> BannerList;
  RxInt current;
  RxDouble appBarOpacity;
  RxString appBarBgColor;
  HomeState() {
    ///Initialize variables
    current = 0.obs;
    BannerList = [
      SwiperItemModel({'url': 'static/images/baner01.png', 'color': '#000000'}),
      SwiperItemModel({'url': 'static/images/baner02.png', 'color': '#000000'}),
      SwiperItemModel({'url': 'static/images/baner03.png', 'color': '#FFC1C1'})
    ].obs;
    appBarOpacity = 0.0.obs;
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