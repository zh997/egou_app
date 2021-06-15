import 'package:egou_app/common/routes.dart';
import 'package:egou_app/common/utils.dart';
import 'package:egou_app/constant/app_pay_config.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/gift_bag.dart';
import 'package:egou_app/services/order.dart';
import 'package:egou_app/services/common.dart';
import 'package:egou_app/models/order.dart';
import 'package:egou_app/models/pay_config.dart';
import 'package:egou_app/constant/app_enums.dart';
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
      if (data['pay_way'] == PayMode.balance) {
        Get.toNamed(RouteConfig.pay_result);
      } else if (data['pay_way'] == PayMode.wechat) {
        onWxPayment({'from': response.data.type, 'order_id': response.data.orderId, 'order_source': 3});
      }
    }
  }

  // 大礼包下单
  Future onGiftBuy(Map<String, dynamic> data) async {
    final RealResponseData response = await GiftBagService.giftBuy(data);
    if (response.result) {
      if (data['pay_way'] == PayMode.balance) {
        Get.toNamed(RouteConfig.pay_result);
      } else if (data['pay_way'] == PayMode.wechat) {
        onWxPayment({'from': response.data.type, 'order_id': response.data.orderId, 'order_source': 2});
      }
    }
  }

  // 获取支付配置
  Future onWxPayment(Map<String, dynamic> data) async {
    final RealResponseData response = await CommonService.getWxPayConfig(data);
    if (response.result) {
      Utils.initFluwx(response.data, success: () {
        Get.toNamed(RouteConfig.pay_result);
      }, fail: (){
        Utils.toast('支付失败');
      });
    }
  }
}
