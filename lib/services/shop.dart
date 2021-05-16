import 'dart:convert';
import 'package:egou_app/constant/app_api_urls.dart';
import 'package:egou_app/http/http_request.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/models/shop_category_list.dart';
import 'package:egou_app/models/shop_entry_list.dart';

class ShopService {

  // 商家分类列表
  static Future<RealResponseData> shopCategoryLists() async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.SHOP_CATEGORY_LISTS, null, 'GET');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: ShopCategoryListModelFromJson));
    }
  }

  // 商家列表
  static Future<RealResponseData> shopList(Map<String, dynamic> data) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.SHOP_ENTRY_LISTS, data, 'GET');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: ShopEntryListModelFromJson));
    }
  }
}
