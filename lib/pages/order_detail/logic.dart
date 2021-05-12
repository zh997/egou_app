import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/order.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'state.dart';

class OrderDetailLogic extends GetxController {
  final state = OrderDetailState();
  Future onGetOrderDetail(int id) async {
    EasyLoading.show(status: '加载中');
    final RealResponseData response = await OrderService.orderDetail(id);
    if (response.result) {
      state.orderDetail.value = response.data;
    }
    EasyLoading.dismiss();
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
