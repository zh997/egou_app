import 'dart:convert';
import 'package:egou_app/constant/app_api_urls.dart';
import 'package:egou_app/http/http_request.dart';
import 'package:egou_app/constant/app_enums.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/models/login.dart';
import 'package:egou_app/models/sms_login.dart';

class RegisterService {

  // 获取验证码
  static Future<RealResponseData> getSms(String mobile) async {
    print( sendMsgKey.ZCYZ);
    final DioResponseData response = await HttpRequest.request(AppApiUrls.SEND_CODE, {'mobile': mobile, 'key': 'ZCYZ' , 'client': 1}, 'POST');
    print(response.data);
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data));
    }
  }

  // 密码登陆
  static Future<RealResponseData> register(Map<String, dynamic> data) async {
    data['client'] = 1;
    final DioResponseData response = await HttpRequest.request(AppApiUrls.ACCOUNT_REGISTER, data, 'POST');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data));
    }
  }

}
