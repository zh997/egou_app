import 'package:get/get.dart';
import 'state.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/goods.dart';

class PointsMallLogic extends GetxController {
  final state = PointsMallState();
  Future onGoodsList(int shopping_type) async  {
    EasyLoading.show(status: '加载中');
    final RealResponseData response2 = await GoodsService.goodsList(1, shopping_type: shopping_type);
    if (response2.result) {
      state.goodsList.value = response2.data;
      state.hasMore.value = response2.more;
      state.page.value = 1;
    }
    EasyLoading.dismiss();
  }
  Future onLoadMore(int shopping_type) async {
    if (state.hasMore.value > 0) {
      final page = state.page.value + 1;
      final RealResponseData response = await GoodsService.goodsList(page, shopping_type: shopping_type);
      final List list =  state.goodsList.value;
      list.addAll(response.data);
      state.goodsList.value = list;
      state.hasMore.value = response.more;
      state.page.value = page;
    }
  }
}
