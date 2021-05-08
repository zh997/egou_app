import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/goods_detail.dart';
import 'package:get/get.dart';

import 'state.dart';

class GoodsDetailLogic extends GetxController {
  final state = GoodsDetailState();
  void onSwiperChange(int index) => state.current.value = index;
  String id = Get.parameters['id'];
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await onGetGoodsDetail();
  }

  void onChangeSelectSpecId (int index) {
    state.selectSpecId.value = index;
  }
  void onChangeTabIndex (int index) {
    state.tabIndex.value = index;
  }
  void onChangeNum (int index) {
    state.num.value = index;
  }

  Future onGetGoodsDetail() async {
    final RealResponseData response = await GoodsDetailService.goodsDetail({'id': int.parse(id)});
    if (response.result) {
      state.goodsDetail.value = response.data;
    }
  }
}
