import 'package:egou_app/models/order_buy_info.dart';
import 'package:get/get.dart';

class ConfirmOrderState {
  Rx<OrderBuyInfoModel> orderBuyInfo = OrderBuyInfoModel().obs;
  ConfirmOrderState() {
    ///Initialize variables
  }
}
