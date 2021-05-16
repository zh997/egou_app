import 'package:get/get.dart';
import 'state.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/home.dart';

class PointsMallLogic extends GetxController {
  final state = PointsMallState();
  Future onGoodsList(int category_id) async  {
    EasyLoading.show(status: '加载中');
    final RealResponseData response2 = await HomeService.goodsList(1, category_id);
    if (response2.result) {
      state.goodsList.value = response2.data;
      state.hasMore.value = response2.more;
      state.page.value = 1;
    }
    EasyLoading.dismiss();
  }
  Future onLoadMore(int category_id) async {
    if (state.hasMore.value > 0) {
      final page = state.page.value + 1;
      final RealResponseData response = await HomeService.goodsList(page, category_id);
      final List list =  state.goodsList.value;
      list.addAll(response.data);
      state.goodsList.value = list;
      state.hasMore.value = response.more;
      state.page.value = page;
    }
  }
}
