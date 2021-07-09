import 'package:egou_app/common/utils.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/models/goods_detail.dart';
import 'package:egou_app/services/cart.dart';
import 'package:egou_app/services/goods_detail.dart';
import 'package:egou_app/services/goods.dart';
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
    final RealResponseData response = await CartService.addCart(data);
    if (response.result) {
      Utils.toast('添加成功');
    }
  }

  Future onCollectGoods(Map<String, dynamic> data) async {
    final RealResponseData response = await GoodsDetailService.collectGoods(data);
    if (response.result) {
      state.is_collect.value = data['is_collect'];
      if (data['is_collect'] == 1) {
        Utils.toast('收藏成功');
      } else {
        Utils.toast('已取消收藏');
      }
    }
  }

  Future onGetCommentCategory() async {
    final RealResponseData response = await GoodsService.commentCategory(int.parse(id));
    if (response.result) {
      state.commentCategory.value = response.data;
    }
  }

  Future onGetCommentList(int category_id) async {
    final RealResponseData response = await GoodsService.commentList(1, goods_id: int.parse(id), id: category_id );
    if (response.result) {
      state.commentList.value = response.data;
      state.hasMore.value = response.more;
      state.page.value = 1;
      state.category_id.value = category_id;
    }
  }

  Future onLoadMoreComment() async {
    if (state.hasMore.value > 0) {
      final page = state.page.value + 1;
      int category_id = state.category_id.value;
      final RealResponseData response = await GoodsService.commentList(page,  goods_id: int.parse(id), id: category_id);
      final List list = [];
      list.addAll(state.commentList.value);
      list.addAll(response.data);
      state.commentList.value = list;
      state.hasMore.value = response.more;
      state.page.value = page;
    }
  }

  Future onChangeCategoryId(int category_id) async{
     await this.onGetCommentList(category_id);
     state.category_id.value = category_id;
  }

}
