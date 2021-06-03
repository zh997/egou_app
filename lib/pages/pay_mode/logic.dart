import 'package:egou_app/common/routes.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/gift_bag.dart';
import 'package:egou_app/services/order.dart';
import 'package:get/get.dart';

import 'state.dart';

class PayModeLogic extends GetxController {
  final state = PayModeState();
  String type = Get.parameters['type'];

  // 普通商品下单
  Future onOrderBuy(Map<String, dynamic> data) async {
    data['type'] = type;
    final RealResponseData response = await OrderService.orderBuy(data);
    if (response.result) {
      Get.toNamed(RouteConfig.pay_result);
    }
  }

  // 大礼包下单
  Future onGiftBuy(Map<String, dynamic> data) async {
    final RealResponseData response = await GiftBagService.giftBuy(data);
    if (response.result) {
      Get.toNamed(RouteConfig.pay_result);
    }
  }
}
