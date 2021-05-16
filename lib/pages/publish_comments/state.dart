import 'package:get/get.dart';
import 'package:egou_app/models/order_detail.dart';
class PublishCommentsState {
  RxList image = [].obs;
  RxInt description_comment = 1.obs;
  RxInt goods_comment = 1.obs;
  RxInt service_comment = 1.obs;
  RxInt express_comment = 1.obs;
  Rx<OrderDetailModel> orderDetail = OrderDetailModel().obs;
  PublishCommentsState() {
    ///Initialize variables
  }
}
