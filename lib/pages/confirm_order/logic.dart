import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/order.dart';
import 'package:get/get.dart';

import 'state.dart';

class ConfirmOrderLogic extends GetxController {
  String type = Get.parameters['type'];
  final state = ConfirmOrderState();

  Future onOrderBuyInfo(Map<String, dynamic> data) async {
    data['type'] = type;
    final RealResponseData response = await OrderService.orderBuyInfo(data);
    if (response.result) {
       state.orderBuyInfo.value = response.data;
    }
  }
}
