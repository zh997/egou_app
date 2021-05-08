import 'dart:convert';
import 'package:egou_app/constant/app_api_urls.dart';
import 'package:egou_app/http/http_request.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/models/home.dart';

class HomeService {


  // 轮播图
  static Future<RealResponseData> banner(Map<String, dynamic> data) async {
    data['client'] = 1;
    final DioResponseData response = await HttpRequest.request(AppApiUrls.AD_LISTS, data, 'GET');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: HomeBannerModelFromJson));
    }
  }


  // 商品列表
  static Future<RealResponseData> goodsList(int page_no, int category_id) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.GET_BESTLIST, {'page_no': page_no, 'category_id': category_id}, 'GET');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: GoodsListModelFromJson));
    }
  }

  // 商品分类
  static Future<RealResponseData> goodsCategory() async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.GET_GOODS_CATEORY, {'client': 1}, 'GET');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: GoodsCategoryModelFromJson));
    }
  }

}
