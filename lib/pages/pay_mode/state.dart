import 'package:egou_app/models/order_detail.dart';
import 'package:egou_app/models/order_pay_way.dart';
import 'package:get/get.dart';

class PayModeState {
  Rx<OrderDetailModel> orderDetail = OrderDetailModel().obs;
  Rx<OrderPayWayModel> orderPayWay = OrderPayWayModel().obs;
  PayModeState() {
    ///Initialize variables
  }
}
