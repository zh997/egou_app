import 'package:egou_app/common/utils.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/order.dart';
import 'package:get/get.dart';

import 'state.dart';

class OrderDetailLogic extends GetxController {
  final state = OrderDetailState();
  Future onGetOrderDetail(int id) async {
    final RealResponseData response = await OrderService.orderDetail(id);
    if (response.result) {
      state.orderDetail.value = response.data;
    }
  }

  Future onOrderConfirm(int id) async {
    final RealResponseData response = await OrderService.orderConfirm(id);
    if (response.result) {
      Utils.toast('操作成功');
    }
  }

  Future onOrderDel(int id) async {
    final RealResponseData response = await OrderService.orderDel(id);
    if (response.result) {
      Utils.toast('操作成功');
    }
  }


  Future onOrderCancel(int id) async {
    final RealResponseData response = await OrderService.orderCancel(id);
    if (response.result) {
      Utils.toast('操作成功');
    }
  }

}
