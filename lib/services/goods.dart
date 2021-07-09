import 'dart:convert';
import 'package:egou_app/constant/app_api_urls.dart';
import 'package:egou_app/http/http_request.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/models/goods_guess_like.dart';
import 'package:egou_app/models/home.dart';
import 'package:egou_app/models/comment_category.dart';
import 'package:egou_app/models/comment_list.dart';

class GoodsService {

  // 商品详情
  static Future<RealResponseData> goodsGuessLike() async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.GOODS_GUESS_LIKE, null, 'GET');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: GoodsGuessLikeModelFromJson));
    }
  }

  // 商品列表
  static Future<RealResponseData> goodsList(int page_no, {int shopping_type, String keyword}) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.GOODS_GET_GOODSLIST, {'page_no': page_no, 'shopping_type': shopping_type, 'keyword': keyword}, 'GET');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: GoodsListModelFromJson));
    }
  }

  // 商品评价分类
  static Future<RealResponseData> commentCategory(int goods_id) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.COMMENT_CATEGORY, {'goods_id': goods_id}, 'GET');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: CommentCategoryModelFromJson));
    }
  }

  // 商品评价
  static Future<RealResponseData> commentList(int page_no, {int goods_id, int id}) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.COMMENT_LIST, {'goods_id': goods_id, 'id': id, 'page_no': page_no}, 'GET');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: CommentListModelFromJson));
    }
  }

}
