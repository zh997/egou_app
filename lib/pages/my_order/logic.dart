import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/order.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'state.dart';

class MyOrderLogic extends GetxController {
  final state = MyOrderState();

  Future onGetOrderLists(String type) async {
    EasyLoading.show(status: '加载中');
    final RealResponseData response = await OrderService.orderLists(type);
    print(response);
    if (response.result) {
       state.orderLists.value = response.data;
    }
    EasyLoading.dismiss();
  }
}
