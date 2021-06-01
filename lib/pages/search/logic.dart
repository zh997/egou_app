import 'package:get/get.dart';
import 'state.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/goods.dart';

class SearchLogic extends GetxController {
  final state = SearchState();
  Future onBaseGoodsList (String keyword) async  {
    EasyLoading.show(status: '正在搜索');
    final RealResponseData response = await GoodsService.goodsList(1, keyword: keyword);
    if (response.result) {
      state.searchGoodsList.value = response.data;
      state.hasMore.value = response.more;
      state.page.value = 1;
      if ( response.data.length <= 0) {
        EasyLoading.showToast('没有找到相关的商品');
      }
    }
    EasyLoading.dismiss();
  }

  Future onLoadMore(String keyword) async {
    if (state.hasMore.value > 0) {
      final page = state.page.value + 1;
      final RealResponseData response = await GoodsService.goodsList(page, keyword: keyword);
      final List list = [];
      list.addAll(state.searchGoodsList.value);
      list.addAll(response.data);
      state.searchGoodsList.value = list;
      state.hasMore.value = response.more;
      state.page.value = page;
    }
  }
}
