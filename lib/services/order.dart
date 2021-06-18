import 'dart:convert';
import 'package:egou_app/constant/app_api_urls.dart';
import 'package:egou_app/http/http_request.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/models/order.dart';
import 'package:egou_app/models/order_list.dart';
import 'package:egou_app/models/order_detail.dart';
import 'package:egou_app/models/order_buy_info.dart';

class OrderService {

  // 结算详情
  static Future<RealResponseData> orderBuyInfo(Map<String, dynamic> data) async {
    data['order_source'] = 3;
    data['action'] = 'info';
    final DioResponseData response = await HttpRequest.request(AppApiUrls.ORDER_BUY, data, 'POST');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: OrderBuyInfoModelFromJson));
    }
  }

  // 下单
  static Future<RealResponseData> orderBuy(Map<String, dynamic> data) async {
    data['order_source'] = 3;
    data['action'] = 'submit';
    final DioResponseData response = await HttpRequest.request(AppApiUrls.ORDER_BUY, data, 'POST');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: OrderBuyModelFromJson));
    }
  }


  // 订单列表
  static Future<RealResponseData> orderLists(int page,  String type) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.ORDER_LISTS, {'type': type, 'page_no': page}, 'GET');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: OrderListItemFromJson));
    }
  }

  // 订单详情
  static Future<RealResponseData> orderDetail(int id) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.ORDER_DETAIL, {'id': id}, 'GET');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: OrderDetailModelFromJson));
    }
  }

  // 确认收货
  static Future<RealResponseData> orderConfirm(int id) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.ORDER_CONFIRM, {'id': id}, 'POST');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data));
    }
  }

  // 删除订单
  static Future<RealResponseData> orderDel(int id) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.ORDER_DEL, {'id': id}, 'POST');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data));
    }
  }

  // 取消订单
  static Future<RealResponseData> orderCancel(int id) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.ORDER_CANCEL, {'id': id}, 'POST');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data));
    }
  }
}
