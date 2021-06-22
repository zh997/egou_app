import 'package:egou_app/models/order_detail.dart';
import 'package:get/get.dart';

class PayModeState {
  Rx<OrderDetailModel> orderDetail = OrderDetailModel().obs;
  PayModeState() {
    ///Initialize variables
  }
}
