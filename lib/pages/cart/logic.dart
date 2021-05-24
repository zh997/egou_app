import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/models/cart.dart';
import 'package:egou_app/models/order.dart';
import 'package:egou_app/services/cart.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:egou_app/common/utils.dart';

import 'state.dart';

class CartLogic extends GetxController {
  final state = CartState();
  Future onGetCartList() async {
    EasyLoading.show(status: '加载中');
    final RealResponseData response = await CartService.cartList();
    if (response.result) {
      EasyLoading.dismiss();
      state.cartList.value = response.data;
      onUpdateCartData(response.data.toJson()['lists']);
    }

  }
  Future onCartChange(Map<String, dynamic> data) async {
    final RealResponseData response = await CartService.cartChange(data);
    if (response.result) {
      final lists = state.cartList.value.lists;
      final List goodsList = [];
      lists.forEach((element) {
        final item = element.toJson();
        if (data != null && data['cart_id'] == item['cart_id']) {
          item['goods_num'] = data['goods_num'];
        }
        goodsList.add(item);
      });
      onUpdateCartData(goodsList);
    }
  }

  Future onCartSelected(Map<String, dynamic> data) async {
    EasyLoading.show(status: '加载中');
    final RealResponseData response = await CartService.cartSelected(data);
    if (response.result) {
      final lists = state.cartList.value.lists;
      final List goodsList = [];
      lists.forEach((element) {
        final item = element.toJson();
        if (data != null && data['cart_id'].indexOf(item['cart_id']) != -1 ) {
          item['selected'] = element.selected == 1 ? 0 : 1;
        }
        goodsList.add(item);
      });
      onUpdateCartData(goodsList);
    }
    EasyLoading.dismiss();
  }

  Future onCartDel(Map<String, dynamic> data) async {
    EasyLoading.show(status: '加载中');
    final RealResponseData response = await CartService.cartDel(data);
    if (response.result) {
      final lists = state.cartList.value.lists;
      final List goodsList = [];
      lists.forEach((element) {
        final item = element.toJson();
        if (data != null && data['cart_id'].indexOf(item['cart_id']) == -1) {
          goodsList.add(item);
        }
      });
      onUpdateCartData(goodsList);
    }
    EasyLoading.dismiss();
  }

  void onUpdateCartData(List lists) {
    final cartList = state.cartList.value.toJson();
    final List selectedGoods = [];
    double totalAmount = 0.00;
    lists.forEach((element) {
      final Map<String, dynamic> goods = {};
      goods['spec_value_str'] = element['spec_value_str'];
      goods['image'] = element['img'];
      goods['item_id'] = element['item_id'];
      goods['name'] = element['name'];
      goods['num'] = element['goods_num'];
      goods['price'] = element['price'];
      goods['id'] = element['goods_id'];
      if ( element['selected'] == 1) {
        selectedGoods.add(OrderGoodsModelFromJson(goods));
        totalAmount = Utils.add(totalAmount, Utils.mul(double.parse(element['goods_num'].toString()), double.parse(element['price'])));
      }
    });
    cartList['lists'] = lists;
    state.selectedGoods.value = selectedGoods;
    state.cartList.value = CartListGoodsModelFromJson(cartList);
    state.totalAmount.value = totalAmount;
  }


  void onChangeIsEditCart(bool isEditCart) {
    state.isEditCart.value = isEditCart;
  }

}
