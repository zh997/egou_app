import 'dart:convert';
import 'package:egou_app/constant/app_api_urls.dart';
import 'package:egou_app/http/http_request.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/models/order.dart';

class OrderService {

  // 下单
  static Future<RealResponseData> orderBuy(Map<String, dynamic> data) async {
    data['order_source'] = 2;
    data['type'] = 'buy_now';
    data['action'] = 'submit';
    final DioResponseData response = await HttpRequest.request(AppApiUrls.ORDER_BUY, data, 'POST');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: OrderBuyModelFromJson));
    }
  }

}
