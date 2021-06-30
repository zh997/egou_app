import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/models/shop_entry_list.dart';
import 'package:egou_app/services/shop.dart';
import 'package:get/get.dart';

import 'state.dart';

class ShopLogic extends GetxController {
  final state = ShopState();

  Future onInitData() async  {
    await this.onGetShopCategoryLists();
    await this.onGetShopEntryLists({});
  }

  Future onGetShopCategoryLists() async {
    final RealResponseData response = await ShopService.shopCategoryLists();
    if (response.result) {
      state.gridList.value = response.data;
    }
  }

  Future onGetShopEntryLists(Map<String, dynamic> data) async {
    data['page_no'] = 1;
    final RealResponseData response = await ShopService.shopList(data);
    if (response.result) {
      state.shopEntryList.value = response.data;
      state.hasMore.value = response.more;
      state.page.value = data['page_no'];
    }
  }

  Future onLoadMore(Map<String, dynamic> data) async {
    if (state.hasMore.value > 0) {
      final page = state.page.value + 1;
      data['page_no'] = page;
      final RealResponseData response = await ShopService.shopList(data);
      final List list = [];
      list.addAll(state.shopEntryList.value);
      list.addAll(response.data);
      state.shopEntryList.value = list;
      state.hasMore.value = response.more;
      state.page.value = page;
    }
  }
}
