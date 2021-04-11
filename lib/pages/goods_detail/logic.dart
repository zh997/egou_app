import 'package:get/get.dart';

import 'state.dart';

class GoodsDetailLogic extends GetxController {
  final state = GoodsDetailState();
  void onSwiperChange(int index) => state.current.value = index;
}
