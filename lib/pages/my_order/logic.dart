import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/order.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'state.dart';

class MyOrderLogic extends GetxController {
  final state = MyOrderState();

  Future onGetOrderLists(String type) async {
    EasyLoading.show(status: '加载中');
    final RealResponseData response = await OrderService.orderLists(1, type);
    if (response.result) {
       state.orderLists.value = response.data;
       state.hasMore.value = response.more;
       state.page.value = 1;
    }
    EasyLoading.dismiss();
  }

  Future onLoadMore(String type) async {
    if (state.hasMore.value > 0) {
      final page = state.page.value + 1;
      final RealResponseData response = await OrderService.orderLists(page, type);
      final List list =  state.orderLists.value;
      list.addAll(response.data);
      state.orderLists.value = list;
      state.hasMore.value = response.more;
      state.page.value = page;
    }
  }

  Future onOrderConfirm(int id) async {
    EasyLoading.show(status: '加载中');
    final RealResponseData response = await OrderService.orderConfirm(id);
    if (response.result) {
      EasyLoading.showSuccess('操作成功');
    }
    EasyLoading.dismiss();
  }

  Future onOrderDel(int id) async {
    EasyLoading.show(status: '加载中');
    final RealResponseData response = await OrderService.orderDel(id);
    if (response.result) {
      EasyLoading.showSuccess('操作成功');
    }
    EasyLoading.dismiss();
  }

  Future onOrderCancel(int id) async {
    EasyLoading.show(status: '加载中');
    final RealResponseData response = await OrderService.orderCancel(id);
    if (response.result) {
      EasyLoading.showSuccess('操作成功');
    }
    EasyLoading.dismiss();
  }
}
