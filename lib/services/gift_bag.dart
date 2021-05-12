import 'dart:convert';
import 'dart:html' as html;
import 'package:dio/dio.dart';
import 'package:egou_app/constant/app_api_urls.dart';
import 'package:egou_app/http/http_request.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/models/upload_img.dart';
import 'package:egou_app/models/gift_bag.dart';
import 'package:egou_app/models/order.dart';

class GiftBagService {

  // 大礼包详情
  static Future<RealResponseData> giftDetail() async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.GIFT_DETAIL, null , 'GET');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: GiftBagDetailModelFromJson));
    }
  }

  // 大礼包下单
  static Future<RealResponseData> giftBuy(Map<String, dynamic> data) async {
    data['order_source'] = 2;
    data['type'] = 'gift';
    data['action'] = 'submit';
    final DioResponseData response = await HttpRequest.request(AppApiUrls.ORDER_BUYGIFT, data , 'POST');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: OrderBuyModelFromJson));
    }
  }
}
