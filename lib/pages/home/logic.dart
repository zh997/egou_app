import 'package:get/get.dart';
import 'state.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/home.dart';

class HomeLogic extends GetxController {
  final state = HomeState();
  void onSwiperChange(int index) => state.current.value = index;

  Future onInitData() async {
    EasyLoading.show(status: '加载中');
    final RealResponseData response1 = await HomeService.banner({'pid': 2, 'client': 2});
    final RealResponseData response2 = await HomeService.goodsList(1, 1);
    final RealResponseData response3 = await HomeService.goodsCategory();
    if (response1.result) {
      state.BannerList.value = response1.data;
    }
    if (response2.result) {
      state.goodsList.value = response2.data;
      state.hasMore.value = response2.more;
    }
    if (response3.result) {
      state.Category.value = response3.data;
    }
    EasyLoading.dismiss();
  }
}
