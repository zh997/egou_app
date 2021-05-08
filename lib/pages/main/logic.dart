import 'package:egou_app/models/order.dart';
import 'package:get/get.dart';
import 'state.dart';

class MainLogic extends GetxController {
  final state = MainState();
  void onSetShopType(int index) => state.shopType.value = index;
  void onChangePageIndex(int index) => state.pageIndex.value = index;
  void onSelectOrderGoods(List<OrderGoodsModel> data){
    state.orderGoods.value = data;
  }
}
