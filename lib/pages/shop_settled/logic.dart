import 'dart:convert';
import 'package:egou_app/common/utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:universal_html/html.dart' as html;
import 'package:egou_app/constant/app_api_urls.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:get/get.dart' as getx;
import 'package:egou_app/services/common.dart';

import 'state.dart';

class ShopSettledLogic extends getx.GetxController {
  final state = ShopSettledState();

  void uploadImg(data, String key) async {
    html.HttpRequest.request(AppApiUrls.UPLOAD_IMG, method: 'post', sendData: data).then((res){
      res.onLoadEnd.listen((e) {
        final response = json.decode(res.response);
        if (response['code'] == 1) {
          if (key == 'shop_photo') {
            final List shop_photo = [];
            shop_photo.addAll(state.shop_photo.value);
            shop_photo.add(response['data']['url']);
            state.shop_photo.value = shop_photo;
          } else {
            final List other_img = [];
            other_img.addAll(state.other_img.value);
            other_img.add(response['data']['url']);
            state.other_img.value = other_img;
          }
        }
      });
    });

  }

  void appUploadImg(data, String key) async {
    final RealResponseData response = await CommonService.uploadImg(data);
    if (response.result) {
      if (key == 'shop_photo') {
        final List shop_photo = [];
        shop_photo.addAll(state.shop_photo.value);
        shop_photo.add(response.data.url);
        state.shop_photo.value = shop_photo;
      } else {
        final List other_img = [];
        other_img.addAll(state.other_img.value);
        other_img.add(response.data.url);
        state.other_img.value = other_img;
      }
    }
  }

  void removeImg(String key, int index) {
    if (key == 'shop_photo') {
      final List shop_photo = [];
      shop_photo.addAll(state.shop_photo.value);
      shop_photo.removeAt(index);
      state.shop_photo.value = shop_photo;
    } else {
      final List other_img = [];
      other_img.addAll(state.other_img.value);
      other_img.removeAt(index);
      state.other_img.value = other_img;
    }
  }

  void entryAdd(data) async {
    EasyLoading.show();
    final RealResponseData response = await CommonService.entryAdd(data);
    if (response.result) {
      Utils.toast('入驻成功');
    }
    EasyLoading.dismiss();
  }

  void onChangeSelect(String index) {
    state.collection_type.value = index;
  }
}
