import 'package:egou_app/common/routes.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/order.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'state.dart';

class ConfirmOrderLogic extends GetxController {
  String type = Get.parameters['type'];
  final state = ConfirmOrderState();

  Future onOrderBuyInfo(Map<String, dynamic> data) async {
    data['type'] = type;
    data['action'] = 'info';
    data['use_integral'] = 0;
    data['order_source'] = 3;
    final RealResponseData response = await OrderService.orderBuyInfo(data);
    if (response.result) {
       state.orderBuyInfo.value = response.data;
    }
  }

  // 普通商品下单
  Future onOrderBuy(Map<String, dynamic> data) async {
    data['type'] = type;
    data['action'] = 'submit';
    data['use_integral'] = 0;
    data['order_source'] = 3;
    EasyLoading.show();
    final RealResponseData response = await OrderService.orderBuy(data);
    if (response.result) {
      Get.toNamed(RouteConfig.pay_mode + '?from=${response.data.type}&order_id=${response.data.orderId}');
    }
    EasyLoading.dismiss();
  }
}
