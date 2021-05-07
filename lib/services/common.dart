import 'dart:convert';
import 'dart:html' as html;
import 'package:dio/dio.dart';
import 'package:egou_app/constant/app_api_urls.dart';
import 'package:egou_app/http/http_request.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/models/upload_img.dart';

class CommonService {

  // 上传图片
  static Future<RealResponseData> uploadImg(data) async {
    html.HttpRequest.request('http://shop.hlnsqz.cn/api/file/formimage', method: 'post', sendData: data).then((res){
      res.onLoadEnd.listen((e) {
        final response = json.decode(res.response);
        return HttpRequest.catchError(ResponseData.fromJson(response, fromJson: uploadImgModelFromJson));
      });
    });
  }

  // 商家入驻
  static Future<RealResponseData> entryAdd( Map<String, dynamic> data) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.ENTRY_ADD, data, 'POST');
    print(response.data);
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data));
    }
  }
}
