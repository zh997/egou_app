import 'package:egou_app/common/routes.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/common.dart';
import 'package:egou_app/services/order.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'state.dart';

class DiscountPayLogic extends GetxController {
  final state = DiscountPayState();
  String shop_id = Get.parameters['shop_id'];

  // 店铺详情
  Future onShopInfo() async {
    final RealResponseData response = await CommonService.shopInfo(shop_id);
    if (response.result) {
      state.shopInfo.value = response.data;
    }
  }

  // 优惠下单
  Future onOrderBuy(String order_amount) async {
    final Map<String, dynamic> data = {};
    data['shop_id'] = shop_id;
    data['action'] = 'submit';
    data['order_source'] = 3;
    data['order_amount'] = order_amount;
    EasyLoading.show();
    final RealResponseData response = await OrderService.orderBuy(data);
    if (response.result) {
      Get.toNamed(RouteConfig.pay_mode + '?from=${response.data.type}&order_id=${response.data.orderId}');
    }
    EasyLoading.dismiss();
  }

  void onChangeIncome(String val) {
    state.income.value = val;
  }
}
