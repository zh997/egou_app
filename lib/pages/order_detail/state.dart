import 'package:egou_app/models/order_detail.dart';
import 'package:get/get.dart';

class OrderDetailState {
  Rx<OrderDetailModel> orderDetail = OrderDetailModel().obs;
  OrderDetailState() {
    ///Initialize variables
  }
}
