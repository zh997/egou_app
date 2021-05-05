import 'dart:convert';
import 'package:egou_app/constant/app_api_urls.dart';
import 'package:egou_app/http/http_request.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/models/login.dart';
import 'package:egou_app/models/sms_login.dart';

class LoginService {

  // 获取验证码
  static Future<RealResponseData> getSms(String mobile) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.SEND_CODE, {'mobile': mobile, 'key': 'YZMDL', 'client': 1}, 'POST');
    print(response.data);
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data));
    }
  }

  // 短信登录
  static Future<RealResponseData> smsLogin(Map<String, dynamic> data) async {
    data['client'] = 2;
    final DioResponseData response = await HttpRequest.request(AppApiUrls.SMS_LOGIN, data, 'POST');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: smsLoginModelFromJson));
    }
  }

  // 密码登陆
  static Future<RealResponseData> accountLogin(Map<String, dynamic> data) async {
    data['client'] = 2;
    final DioResponseData response = await HttpRequest.request(AppApiUrls.ACCOUNT_LOGIN, data, 'POST');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: smsLoginModelFromJson));
    }
  }

}
