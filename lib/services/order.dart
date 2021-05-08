import 'dart:convert';
import 'package:egou_app/constant/app_api_urls.dart';
import 'package:egou_app/http/http_request.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/models/address.dart';

class AddressService {

  // 地址列表
  static Future<RealResponseData> addressList() async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.GET_ADDRESS, {'client': 1}, 'GET');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: AddressListModelFromJson));
    }
  }

}
