import 'package:egou_app/models/cart.dart';
import 'package:get/get.dart';

class CartState {
  Rx<CartListGoodsModel> cartList = CartListGoodsModel().obs;
  RxList selectedGoods = [].obs;
  RxDouble totalAmount = 0.00.obs;
  RxBool isEditCart = false.obs;
  CartState() {
    ///Initialize variables
  }
}
