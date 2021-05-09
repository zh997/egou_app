import 'dart:convert';
import 'package:egou_app/constant/app_api_urls.dart';
import 'package:egou_app/http/http_request.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/models/cart.dart';

class CartService {

  // 添加购物车
  static Future<RealResponseData> addCart(Map<String, dynamic> data) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.CART_ADD, data, 'POST');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data));
    }
  }

  // 购物车列表
  static Future<RealResponseData> cartList() async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.CART_LIST, null, 'GET');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: CartListGoodsModelFromJson));
    }
  }

  // 修改购物车数量
  static Future<RealResponseData> cartChange(Map<String, dynamic> data) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.CART_CHANGE, data, 'POST');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data));
    }
  }

  // 修改选中状态
  static Future<RealResponseData> cartSelected(Map<String, dynamic> data) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.CART_SELECTED, data, 'POST');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data));
    }
  }

  // 删除购物车
  static Future<RealResponseData> cartDel(Map<String, dynamic> data) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.CART_DEL, data, 'POST');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data));
    }
  }
}
