import 'dart:convert';
import 'package:egou_app/constant/app_api_urls.dart';
import 'package:egou_app/http/http_request.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/models/goods_guess_like.dart';

class GoodsService {

  // 商品详情
  static Future<RealResponseData> goodsGuessLike() async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.GOODS_GUESS_LIKE, null, 'GET');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: GoodsGuessLikeModelFromJson));
    }
  }

}
