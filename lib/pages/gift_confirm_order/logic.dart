import 'package:egou_app/common/routes.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/order.dart';
import 'package:egou_app/services/gift_bag.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'state.dart';

class GiftConfirmOrderLogic extends GetxController {
  final state = GiftConfirmOrderState();

  // 大礼包下单
  Future onGiftBuy(Map<String, dynamic> data) async {
    data['type'] = 'gift';
    data['action'] = 'submit';
    data['order_source'] = 3;
    EasyLoading.show();
    final RealResponseData response = await GiftBagService.giftBuy(data);
    if (response.result) {
      Get.toNamed(RouteConfig.pay_mode + '?from=${response.data.type}&order_id=${response.data.orderId}');
    }
    EasyLoading.dismiss();
  }

}
