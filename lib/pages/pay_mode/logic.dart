import 'package:egou_app/common/routes.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/order.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'state.dart';

class PayModeLogic extends GetxController {
  final state = PayModeState();

  Future onOrderBuy(Map<String, dynamic> data) async {
    EasyLoading.show(status: '加载中');
    final RealResponseData response = await OrderService.orderBuy(data);
    if (response.result) {
      Get.toNamed(RouteConfig.pay_result);
    }
    EasyLoading.dismiss();
  }
}
