import 'package:get/get.dart';
import 'state.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/home.dart';

class HomeLogic extends GetxController {
  final state = HomeState();
  void onSwiperChange(int index) => state.current.value = index;

  Future onInitData(bool isShowLoading, {int category_id}) async {
    final RealResponseData response = await HomeService.goodsCategory();
    await onCategoryData(category_id != null ? category_id : response.data[0].id);
    if (response.result) {
      state.Category.value = response.data;
    }
  }

  Future onCategoryData (int category_id) async  {
    final RealResponseData response1 = await HomeService.banner({'pid': 1, 'category_id': category_id});
    final RealResponseData response2 = await HomeService.goodsList(1, category_id: category_id);
    if (response1.result) {
      state.BannerList.value = response1.data;
    }
    if (response2.result) {
      state.goodsList.value = response2.data;
      state.hasMore.value = response2.more;
      state.page.value = 1;
    }
  }

  Future onLoadMore(int category_id) async {
    if (state.hasMore.value > 0) {
      final page = state.page.value + 1;
      final RealResponseData response = await HomeService.goodsList(page, category_id: category_id);
      final List list = [];
      list.addAll(state.goodsList.value);
      list.addAll(response.data);
      state.goodsList.value = list;
      state.hasMore.value = response.more;
      state.page.value = page;
    }
  }
}
