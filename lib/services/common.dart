import 'dart:convert';
import 'dart:html' as html;
import 'package:dio/dio.dart';
import 'package:egou_app/constant/app_api_urls.dart';
import 'package:egou_app/http/http_request.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/models/upload_img.dart';
import 'package:egou_app/models/global.dart';
import 'package:egou_app/models/my_collect_item.dart';

class CommonService {

  // 商家入驻
  static Future<RealResponseData> entryAdd( Map<String, dynamic> data) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.ENTRY_ADD, data, 'POST');
    print(response.data);
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data));
    }
  }

  // 分享二维码
  static Future<RealResponseData> sharePoster() async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.SHARE_POSETER, {'client': 2}, 'POST');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: SharePosterModelFromJson));
    }
  }

  // 大礼包详情
  static Future<RealResponseData> giftDetail() async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.GIFT_DETAIL, null , 'GET');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: SharePosterModelFromJson));
    }
  }

  // 我的收藏
  static Future<RealResponseData> getCollectGoods(Map<String, dynamic> data) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.GET_COLLECT_GOODS, data , 'GET');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: MyCollectItemModelFromJson));
    }
  }
}
