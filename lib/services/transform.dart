import 'dart:convert';
import 'package:egou_app/constant/app_api_urls.dart';
import 'package:egou_app/http/http_request.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/models/conversion_user.dart';
import 'package:egou_app/models/conversion_record.dart';

class TransformService {

  // 互转信息
  static Future<RealResponseData> ConversionUser() async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.CONVERSION_USER, null, 'POST');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: ConversionUserModelFromJson));
    }
  }

  // 互转
  static Future<RealResponseData> ConversionMove(Map<String, dynamic> data) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.CONVERSION_MOVE, data, 'POST');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data));
    }
  }

  // 互转记录
  static Future<RealResponseData> ConversionRecord(int page) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.CONVERSION_RECORD , {'page_no': page}, 'POST');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: ConversionRecordItemModelFromJson));
    }
  }
}
