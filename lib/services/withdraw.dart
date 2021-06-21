import 'dart:convert';
import 'package:egou_app/constant/app_api_urls.dart';
import 'package:egou_app/http/http_request.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/models/withdraw_record.dart';

class WithdrawService {

  // 申请提现
  static Future<RealResponseData> withdrawApply(Map<String, dynamic> data) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.WITHDRAW_APPLY, data, 'POST');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data));
    }
  }

  // 提现明细
  static Future<RealResponseData> withdrawRecord(int page) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.MONEY_WITHDRAS_RECORD, {'page_no': page}, 'POST');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: WithdrawRecordItemModelFromJson));
    }
  }

}
