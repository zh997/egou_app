import 'package:zb_app/constant/app_api_urls.dart';
import 'package:zb_app/http/http_request.dart';
import 'package:zb_app/http/response_data.dart';

class LoginService {

  // 登陆
  static Future login() async {
    final ResponseData response = await HttpRequest.request(AppApiUrls.LOGIN, {'user_name': 'dasd'}, 'POST');
    if (response.result && response.data != null) {
      // 这里做数据模型处理
      return RealResponseData(response.data, true);
    } else {
      return RealResponseData(null, false);
    }
  }

  // 获取验证码
  static Future getTestCode() async {
    final ResponseData response = await HttpRequest.request(AppApiUrls.LOGIN, {'user_name': 'dasd'}, 'POST');
    if (response.result && response.data != null) {
      // 这里做数据模型处理
      return RealResponseData(response.data, true);
    } else {
      return RealResponseData(null, false);
    }
  }
}
