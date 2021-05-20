import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/goods.dart';
import 'package:get/get.dart';

import 'state.dart';

class PayResultLogic extends GetxController {
  final state = PayResultState();
  Future onCategoryData () async  {
    final RealResponseData response = await GoodsService.goodsGuessLike();
    if (response.result) {
      state.goodsGuessLike.value = response.data;
    }
  }
}
