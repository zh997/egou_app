import 'dart:convert';
import 'package:egou_app/constant/app_api_urls.dart';
import 'package:egou_app/http/http_request.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/models/user_account_log.dart';

class CommentService {

  // 账户变动日志
  static Future<RealResponseData> addComment(Map<String, dynamic> data) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.ADD_COMMENT, data, 'POST');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data));
    }
  }

}
