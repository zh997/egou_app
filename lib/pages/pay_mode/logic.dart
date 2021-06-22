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
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'state.dart';

class PayModeLogic extends GetxController {
  final state = PayModeState();
  String type = Get.parameters['type'];

  Future onGetOrderDetail(int id) async {
    final RealResponseData response = await OrderService.orderDetail(id);
    if (response.result) {
      state.orderDetail.value = response.data;
    }
  }

  // 订单支付
  Future onOrderPay(Map<String, dynamic> data) async {
    data['order_source'] = 3;
    EasyLoading.show();
    if (data['pay_way'] == PayMode.balance) {
      final RealResponseData response = await CommonService.blancePrepay(data);
      if (response.result) {
        Get.toNamed(RouteConfig.pay_result);
      }
    } else if (data['pay_way'] == PayMode.wechat) {
      onWxPayment(data);
    } else if (data['pay_way'] == PayMode.alipay) {
      onAliPayment(data);
    }
  }

  // 微信支付
  Future onWxPayment(Map<String, dynamic> data) async {
    final RealResponseData response = await CommonService.getWxPayConfig(data);
    if (response.result) {
      Utils.initFluwx(response.data, success: (res) {
        Get.toNamed(RouteConfig.pay_result);
      }, fail: (err){
        Utils.toast('支付失败');
      });
    }
    EasyLoading.dismiss();
  }

  // 支付宝支付
  Future onAliPayment(Map<String, dynamic> data) async {
    final RealResponseData response = await CommonService.getAliPayConfig(data);
    if (response.result) {
      Utils.initAlipay(response.data.dataStr, success: (res) {
        Get.toNamed(RouteConfig.pay_result);
      }, fail: (err){
        Utils.toast('支付失败');
      });
    }
    EasyLoading.dismiss();
  }
}
