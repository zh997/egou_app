import 'dart:convert';
import 'dart:html' as html;
import 'package:dio/dio.dart';
import 'package:egou_app/constant/app_api_urls.dart';
import 'package:egou_app/http/http_request.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/models/upload_img.dart';

class CommonService {

  // 商家入驻
  static Future<RealResponseData> entryAdd( Map<String, dynamic> data) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.ENTRY_ADD, data, 'POST');
    print(response.data);
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data));
    }
  }
}
