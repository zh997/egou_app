import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/home.dart';
import 'package:get/get.dart';

import 'state.dart';

class PayResultLogic extends GetxController {
  final state = PayResultState();
  Future onCategoryData (int category_id) async  {
    final RealResponseData response2 = await HomeService.goodsList(1, 1);
    if (response2.result) {
      state.goodsList.value = response2.data;
    }
  }
}
