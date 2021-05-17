import 'dart:convert';
import 'package:egou_app/constant/app_api_urls.dart';
import 'package:egou_app/http/http_request.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/models/user.dart';

class UserService {

  // 用户信息
  static Future<RealResponseData> getUserInfo() async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.USER_CENTER, null , 'GET');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: UserInfoModelFromJson));
    }
  }

  // 获取验证码
  static Future<RealResponseData> getSms(String mobile) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.SEND_CODE, {'mobile': mobile, 'key': 'ZHMM' , 'client': 1}, 'POST');
    print(response.data);
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data));
    }
  }

  // 修改登录密码
  static Future<RealResponseData> updateLoginPwd(Map<String, dynamic> data) async {
    data['client'] = 2;
    final DioResponseData response = await HttpRequest.request(AppApiUrls.FORGET_LOGIN_PWD, data , 'POST');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: UserInfoModelFromJson));
    }
  }

  // 修改交易密码
  static Future<RealResponseData> updatePayPwd(Map<String, dynamic> data) async {
    data['client'] = 2;
    final DioResponseData response = await HttpRequest.request(AppApiUrls.UPDATE_PAY_PWD, data , 'POST');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data));
    }
  }
}
