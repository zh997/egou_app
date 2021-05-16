import 'dart:convert';
import 'package:egou_app/constant/app_api_urls.dart';
import 'package:egou_app/http/http_request.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/models/goods_detail.dart';

class GoodsDetailService {

  // 商品详情
  static Future<RealResponseData> goodsDetail(Map<String, dynamic> data) async {
    data['client'] = 1;
    final DioResponseData response = await HttpRequest.request(AppApiUrls.GET_GOODS_DETAIL, data, 'GET');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: GoodsDetailModelFromJson));
    }
  }

  // 商品收藏
  static Future<RealResponseData> collectGoods(Map<String, dynamic> data) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.COLLECT_GOODS, data, 'POST');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data));
    }
  }

}
