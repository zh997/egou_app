import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/cart.dart';
import 'package:egou_app/services/goods_detail.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'state.dart';

class GoodsDetailLogic extends GetxController {
  final state = GoodsDetailState();
  void onSwiperChange(int index) => state.current.value = index;
  String id = Get.parameters['id'];

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
      state.is_collect.value = response.data.isCollect;
    }
  }

  Future onAddCart(Map<String, dynamic> data) async {
    EasyLoading.show(status: '加载中');
    final RealResponseData response = await CartService.addCart(data);
    if (response.result) {
      EasyLoading.showSuccess('添加成功');
    }
  }

  Future onCollectGoods(Map<String, dynamic> data) async {
    EasyLoading.show(status: '加载中');
    final RealResponseData response = await GoodsDetailService.collectGoods(data);
    if (response.result) {
      state.is_collect.value = data['is_collect'];
      if (data['is_collect'] == 1) {
        EasyLoading.showSuccess('收藏成功');
      } else {
        EasyLoading.showToast('已取消收藏');
      }
    }
  }
}
