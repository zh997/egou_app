import 'package:get/get.dart';
import 'package:egou_app/models/home.dart';
class HomeState {
  RxList BannerList = [].obs;
  RxInt current;
  RxList Category = [].obs;
  RxList goodsList = [].obs;
  RxInt hasMore = 0.obs;
  HomeState() {
    ///Initialize variables
    current = 0.obs;
  }
}
