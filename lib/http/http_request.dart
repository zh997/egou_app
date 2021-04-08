import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:connectivity/connectivity.dart';
import 'package:zb_app/constant/app_api_urls.dart';
import 'package:zb_app/http/response_data.dart';
import 'package:zb_app/http/status_code.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class HttpRequest{

  static String baseUrl = AppApiUrls.BASE_URL;

  static BaseOptions options = new BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 15000,
      receiveTimeout: 3000,
  );

  static Future<ResponseData> request(url, params, String method) async {

    Response response;
    Response errorResponse;

    // 当前网络状态
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
    } else if (connectivityResult == ConnectivityResult.none) {
      // no network
      EasyLoading.showError('请检查网络');
      return ResponseData(StatusCode.NETWORK_ERROR, '' , false, '请检查网络');
    }

    options.method = method;
    Dio dio = new Dio(options);

    try {
       response = await dio.request(url,data: params);
    } on DioError catch(e) {
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = new Response(statusCode: 666);
      }
      if (e.type == DioErrorType.connectTimeout) {
        errorResponse.statusCode = StatusCode.NETWORK_TIMEOUT;
      }
      if (kDebugMode) {
        print('请求异常: ' + e.toString());
        print('请求异常 url: ' + url);
      }
      EasyLoading.showError(errorResponse.statusMessage);
      return ResponseData(errorResponse.statusCode, '' , false, errorResponse.statusMessage);
    }

    if (response.statusCode == 200 || response.statusCode == 201) {
      return ResponseData(response.statusCode, response.data , true, response.statusMessage);
    }
  }
}
