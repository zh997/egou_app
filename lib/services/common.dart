import 'dart:convert';
import 'package:universal_html/html.dart' as html;
import 'package:dio/dio.dart';
import 'package:egou_app/constant/app_api_urls.dart';
import 'package:egou_app/http/http_request.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/models/upload_img.dart';
import 'package:egou_app/models/global.dart';
import 'package:egou_app/models/my_collect_item.dart';
import 'package:egou_app/models/pay_config.dart';
import 'package:egou_app/models/alipay_config.dart';
import 'package:egou_app/models/shop_info.dart';
import 'package:egou_app/models/shop_order_info.dart';
import 'package:egou_app/models/third_pay.dart';

class CommonService {

  // 上传图片
  static Future<RealResponseData> uploadImg(data) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.APP_UPLOAD_IMG, data, 'POST');
    print(response.data);
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: uploadImgModelFromJson));
    }
  }

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

  // 店铺详情
  static Future<RealResponseData> shopInfo(String shop_id) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.SHOP_INFO, {'shop_id': shop_id} , 'POST');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: ShopInfoModelFromJson));
    }
  }

  // 店铺订单详情
  static Future<RealResponseData> shopOrderInfo(String shop_id) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.SHOP_ORDER_INFO, {'shop_id': shop_id} , 'POST');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: ShopOrderInfoModelFromJson));
    }
  }

  // 店铺二维码
  static Future<RealResponseData> shopCode(String shop_id) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.SHOP_CODE, {'shop_id': shop_id} , 'POST');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: ShopCodeModelFromJson));
    }
  }

  // 我的收藏
  static Future<RealResponseData> getCollectGoods(Map<String, dynamic> data) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.GET_COLLECT_GOODS, data , 'GET');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: MyCollectItemModelFromJson));
    }
  }

  // 微信支付配置(预支付)
  static Future<RealResponseData> getWxPayConfig(Map<String, dynamic> data) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.WX_PAYMENT_PREPAY, data , 'POST');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: WxPayConfigModelFromJson));
    }
  }

  // 支付宝支付配置(预支付)
  static Future<RealResponseData> getAliPayConfig(Map<String, dynamic> data) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.WX_PAYMENT_PREPAY, data , 'POST');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: AlipayConfigModelFromJson));
    }
  }

  // 余额预支付
  static Future<RealResponseData> blancePrepay(Map<String, dynamic> data) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.WX_PAYMENT_PREPAY, data , 'POST');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data));
    }
  }

  // 第三方支付
  static Future<RealResponseData> thirdPay(Map<String, dynamic> data) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.WX_PAYMENT_PREPAY, data , 'POST');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: ThirdPayModelFromJson));
    }
  }

  // 请求第三方支付
  static Future<RealResponseData> postThirdPay(String url, Map<String, dynamic> data) async {
    final DioResponseData response = await HttpRequest.request(url, data , 'POST', notBaseUrl: true);
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data));
    }
  }
}
