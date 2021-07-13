import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/common.dart';
import 'package:get/get.dart';

import 'state.dart';

class ShopDetailLogic extends GetxController {
  final state = ShopDetailState();
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
  }



  // 店铺详情
  Future onShopInfo(String shop_id) async {
    final RealResponseData response = await CommonService.shopInfo(shop_id);
    if (response.result) {
      state.shopInfo.value = response.data;
    }
  }

}
