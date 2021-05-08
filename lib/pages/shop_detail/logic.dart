import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/goods_detail.dart';
import 'package:get/get.dart';

import 'state.dart';

class ShopDetailLogic extends GetxController {
  final state = ShopDetailState();
  String id = Get.parameters['id'];
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await onGetGoodsDetail();
  }

  Future onGetGoodsDetail() async {
     final RealResponseData response = await GoodsDetailService.goodsDetail({'id': int.parse(id)});
     if (response.result) {
       state.goodsDetail.value = response.data;
     }
  }
}
