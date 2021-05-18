import 'dart:convert';
import 'package:egou_app/constant/app_api_urls.dart';
import 'package:egou_app/http/http_request.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/models/bank_card_list.dart';

class BankCardService {

  // 添加银行卡、绑定微信支付宝收款码
  static Future<RealResponseData> addBankCard(Map<String, dynamic> data) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.USER_ADD_BANKCARD, data, 'POST');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data));
    }
  }

  // 银行卡列表
  static Future<RealResponseData> bankCardList(int page) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.USER_BANKCARD_LIST, {'page_no': page}, 'GET');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: BankCardListModelFromJson));
    }
  }

}
