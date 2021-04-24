import 'package:get/get.dart';
import 'state.dart';

class MainLogic extends GetxController {
  final state = MainState();
  void onSetShopType(int index) => state.shopType.value = index;
}
