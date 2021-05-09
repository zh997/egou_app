import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:egou_app/common/routes.dart';
import 'package:egou_app/common/storage.dart';
import 'package:egou_app/constant/app_api_urls.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/http/status_code.dart';
import 'package:get/get.dart' as navigator;
import 'package:flutter/foundation.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


class HttpRequest{

  static String baseUrl = AppApiUrls.BASE_URL;

  static BaseOptions options = new BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: 15000,
    receiveTimeout: 3000,
  );

  static Future<DioResponseData> request(url, params, String method) async {

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
      return DioResponseData(StatusCode.NETWORK_ERROR, '' , false, '请检查网络');
    }

    options.method = method;
    // options.headers['token'] = '81db4474cdaf61cb99855b309354b683';
    options.headers['token'] = AppStorage.getString('token');
    Dio dio = new Dio(options);

    try {
      if (method == 'POST') {
        response = await dio.request(url,data: params);
      } else if(method == 'GET') {
        response = await dio.request(url, queryParameters: params);
      }
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
        print('请求异常 url: ' + baseUrl + url);
      }
      EasyLoading.showError(errorResponse.statusMessage);
      return DioResponseData(errorResponse.statusCode, '' , false, errorResponse.statusMessage);
    }

    if (response.statusCode == 200 || response.statusCode == 201) {
      return DioResponseData(response.statusCode, response.data , true, response.statusMessage);
    }
  }

  static addHeaders(String key, dynamic val) {
    options.headers[key] = val;
  }

  static RealResponseData catchError(ResponseData response) {
    if (response.code != 1) {
      EasyLoading.showError(response.msg);
      // 未登录
      if (response.code == -1) {
        AppStorage.setString('token', '');
        navigator.Get.offAllNamed(RouteConfig.login_page);
      }
      return RealResponseData(result: false, data: null);
    } else {
      return RealResponseData(result: true, data: response.data, more: response.more);
    }
  }
}
