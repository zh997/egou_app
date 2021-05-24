import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/order.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'state.dart';

class ConfirmOrderLogic extends GetxController {
  final state = ConfirmOrderState();

  Future onOrderBuyInfo(Map<String, dynamic> data) async {
    EasyLoading.show(status: '加载中');
    final RealResponseData response = await OrderService.orderBuyInfo(data);
    if (response.result) {
       state.orderBuyInfo.value = response.data;
    }
    EasyLoading.dismiss();
  }
}
