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
      if (response.data.lists.length > 0) {
        onChangeSelectData(response.data, isDel: false);
      }
    }

  }
  Future onCartChange(Map<String, dynamic> data) async {
    final RealResponseData response = await CartService.cartChange(data);
    if (response.result) {
      final cartList = state.cartList.value.toJson();
      final lists = state.cartList.value.lists;
      final List goodsList = [];
      double totalAmount = 0.00;
      lists.forEach((element) {
        final item = element.toJson();
        if (data != null && data['cart_id'] == item['cart_id']) {
          item['goods_num'] = data['goods_num'];
        }
        totalAmount = Utils.add(totalAmount, Utils.mul(double.parse(item['goods_num'].toString()), double.parse(element.price)));
        goodsList.add(item);
      });
      cartList['lists'] = goodsList;
      state.totalAmount.value = totalAmount;
      state.cartList.value = CartListGoodsModelFromJson(cartList);
    }
  }

  Future onCartSelected(Map<String, dynamic> data) async {
    EasyLoading.show(status: '加载中');
    final RealResponseData response = await CartService.cartSelected(data);
    if (response.result) {
      onChangeSelectData(state.cartList.value, data: data, isDel: false);
    }
    EasyLoading.dismiss();
  }

  Future onCartDel(Map<String, dynamic> data) async {
    EasyLoading.show(status: '加载中');
    final RealResponseData response = await CartService.cartDel(data);
    if (response.result) {
      onChangeSelectData(state.cartList.value, data: data, isDel: true);
    }
    EasyLoading.dismiss();
  }

  void onChangeSelectData (CartListGoodsModel cartData, {Map<String, dynamic> data, isDel}) {
    final cartList = cartData.toJson();
    final lists = cartData.lists;
    final List goodsList = [];
    final List selectedGoods = [];
    double totalAmount = 0.00;
    lists.forEach((element) {
      final item = element.toJson();
      final Map<String, dynamic> goods = {};
      if (isDel) {
        if (data != null && item['selected'] == 1 &&  data['cart_id'].indexOf(item['cart_id']) == -1) {
          goods['spec_value_str'] = item['spec_value_str'];
          goods['item_id'] = item['item_id'].toString();
          goods['image'] = item['img'];
          goods['name'] = item['name'];
          goods['num'] = item['goods_num'];
          goods['price'] = item['price'];
          goods['id'] = item['goods_id'];
          selectedGoods.add(OrderGoodsModelFromJson(goods));
          totalAmount =  Utils.add(totalAmount, Utils.mul(double.parse(element.goodsNum.toString()), double.parse(element.price)));
        }
        if( data != null && data['cart_id'].indexOf(item['cart_id']) == -1) {
          goodsList.add(item);
        }
      } else {
        if ( data != null && data['cart_id'].indexOf(item['cart_id']) != -1 ) {
          item['selected'] = element.selected == 1 ? 0 : 1;
        }
        if (item['selected'] == 1) {
          goods['spec_value_str'] = item['spec_value_str'];
          goods['image'] = item['img'];
          goods['item_id'] = item['item_id'].toString();
          goods['name'] = item['name'];
          goods['num'] = item['goods_num'];
          goods['price'] = item['price'];
          goods['id'] = item['goods_id'];
          selectedGoods.add(OrderGoodsModelFromJson(goods));
          totalAmount =  Utils.add(totalAmount, Utils.mul(double.parse(element.goodsNum.toString()), double.parse(element.price)));
        }
        goodsList.add(item);
      }

    });
    cartList['lists'] = goodsList;
    state.selectedGoods.value = selectedGoods;
    state.cartList.value = CartListGoodsModelFromJson(cartList);
    state.totalAmount.value = totalAmount;
  }


  void onChangeIsEditCart(bool isEditCart) {
    state.isEditCart.value = isEditCart;
  }

}
