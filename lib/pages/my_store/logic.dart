import 'package:egou_app/services/cart.dart';
import 'package:egou_app/services/common.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:egou_app/http/response_data.dart';
import 'state.dart';

class MyStoreLogic extends GetxController {
  final state = MyStoreState();
  Future onGetCollectGoods() async {
    EasyLoading.show(status: '加载中');
    final RealResponseData response = await CommonService.getCollectGoods({'page_no': 1});
    if (response.result) {
      state.collectGoods.value = response.data;
      state.hasMore.value = response.more;
      state.page.value = 1;
    }
    EasyLoading.dismiss();
  }

  Future onLoadMore(String type) async {
    if (state.hasMore.value > 0) {
      final page = state.page.value + 1;
      final RealResponseData response = await CommonService.getCollectGoods({'page_no': page});
      final List list =  state.collectGoods.value;
      list.addAll(response.data);
      state.collectGoods.value = list;
      state.hasMore.value = response.more;
      state.page.value = page;
    }
  }

  Future onAddCart(Map<String, dynamic> data) async {
    EasyLoading.show(status: '加载中');
    final RealResponseData response = await CartService.addCart(data);
    if (response.result) {
      EasyLoading.showSuccess('添加成功');
    }
  }
}
