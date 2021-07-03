import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/common.dart';
import 'package:get/get.dart';

import 'state.dart';

class MyShopLogic extends GetxController {
  final state = MyShopState();
  String shop_id = Get.parameters['shop_id'];

  Future onInitData() async {
    await this.onShopCode();
    await this.onShopOrderInfo();
  }

  // 店铺详情
  Future onShopInfo() async {
    final RealResponseData response = await CommonService.shopInfo(shop_id);
    if (response.result) {
      state.shopInfo.value = response.data;
    }
  }

  // 店铺订单详情
  Future onShopOrderInfo() async {
    final RealResponseData response = await CommonService.shopOrderInfo(shop_id);
    if (response.result) {
      state.shopOrderInfo.value = response.data;
    }
  }

  // 店铺二维码
  Future onShopCode() async {
    final RealResponseData response = await CommonService.shopCode(shop_id);
    if (response.result) {
      state.shopCode.value = response.data;
    }
  }
}
