import 'package:egou_app/common/routes.dart';
import 'package:egou_app/common/utils.dart';
import 'package:egou_app/config/env_config.dart';
import 'package:egou_app/constant/app_pay_config.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/models/third_pay.dart';
import 'package:egou_app/services/gift_bag.dart';
import 'package:egou_app/services/order.dart';
import 'package:egou_app/services/common.dart';
import 'package:egou_app/models/order.dart';
import 'package:egou_app/models/pay_config.dart';
import 'package:egou_app/constant/app_enums.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
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

  // 订单支付方式

  Future onGetPayWay(String order_id) async {
    final RealResponseData response = await OrderService.getPayWay(order_id);
    if (response.result) {
      state.orderPayWay.value = response.data;
    }
  }

  // 订单支付
  Future onOrderPay(Map<String, dynamic> data) async {
    data['order_source'] = 3;
    EasyLoading.show();
    print(data);
    if (data['pay_way'] == PayMode.wechat) {
      return onWxPayment(data);
    } else if (data['pay_way'] == PayMode.alipay) {
      return onAliPayment(data);
    } else if (data['pay_way'] == PayMode.third_party || data['pay_way'] == PayMode.third_party_15) {
      return onThirdPay(data);
    }
    final RealResponseData response = await CommonService.blancePrepay(data);
    if (response.result) {
      Get.toNamed(RouteConfig.pay_result);
    }
    EasyLoading.dismiss();
  }

  // 第三方支付
  Future onThirdPay(Map<String, dynamic> data) async {
    final RealResponseData response = await CommonService.thirdPay(data);
    if (response.result) {
      // state.thirdPayModel.value = response.data;
      // print(response.data);
      // Get.toNamed(RouteConfig.pay_middle);
      // String url = EnvConfig.env.apiUrl +
      //     '/index/index/payform' +
      //     "?charset=${response.data.data.charset}&signType=${response.data.data.signType}&data=${Uri.encodeComponent(response.data.data.data)}&sign=${response.data.data.sign}";
      if (await canLaunch(response.data)) {
        await launch(response.data);
      } else {
        throw 'Could not launch $response.data';
      }
    }
    EasyLoading.dismiss();
  }

  // 支付结果
  Future onGetPayResult(String id) async {
    final RealResponseData response = await CommonService.getPayResult(id);
    if (response.result) {
      if(response.data.payStatus == 0) {
        Utils.toast('支付失败');
      } else {
        Get.toNamed(RouteConfig.pay_result);
      }
    }
    EasyLoading.dismiss();
  }

  // 微信支付
  Future onWxPayment(Map<String, dynamic> data) async {
    final RealResponseData response = await CommonService.getWxPayConfig(data);
    if (response.result) {
      Utils.initFluwx(response.data, success: (res) {
        Get.toNamed(RouteConfig.pay_result);
      }, fail: (err) {
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
      }, fail: (err) {
        Utils.toast('支付失败');
      });
    }
    EasyLoading.dismiss();
  }
}
