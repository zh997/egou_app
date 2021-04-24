import 'package:get/get.dart';

import 'state.dart';

class PointsMallLogic extends GetxController {
  final state = PointsMallState();
  void onSetShopType(int index) => state.shopType.value = index;
}
