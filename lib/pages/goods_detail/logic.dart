import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/models/goods_detail.dart';
import 'package:egou_app/services/cart.dart';
import 'package:egou_app/services/goods_detail.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'state.dart';

class GoodsDetailLogic extends GetxController {
  final state = GoodsDetailState();
  void onSwiperChange(int index) => state.current.value = index;
  String id = Get.parameters['id'];

  void onChangeSelectedGoodsSpec (int goods_spec_id, SpecValue specValue) {
    final List goodsSpecList = [];
    final List<int> selectedGoodsSpecIds = [];
    state.selectedGoodsSpec.value.forEach((element) {
      final Map<String, dynamic> goodsSpec = element.toJson();
      if (goods_spec_id == element.id) {
        goodsSpec['spec_value'] = [specValue.toJson()];
      }
      if (goodsSpec['spec_value'].length > 0) {
        selectedGoodsSpecIds.add(goodsSpec['spec_value'][0]['id']);
      }
      goodsSpecList.add(GoodsSpec.fromJson(goodsSpec));
    });
    state.selectedGoodsSpecIds.value = selectedGoodsSpecIds;
    state.selectedGoodsSpec.value = goodsSpecList;
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
      final List<GoodsSpec> goodsSpec = response.data.goodsSpec;
      final List goodsSpecList = [];
      goodsSpec.forEach((element) {
        final Map<String, dynamic> goodsSpecItem = element.toJson();
        goodsSpecItem['spec_value'] = [];
        goodsSpecList.add(GoodsSpec.fromJson(goodsSpecItem));
      });
      state.selectedGoodsSpec.value = goodsSpecList;
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
