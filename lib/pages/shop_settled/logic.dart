import 'dart:async';
import 'package:dio/dio.dart';
import 'package:egou_app/common/routes.dart';
import 'package:egou_app/common/storage.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart' as getx;
import 'package:egou_app/services/common.dart';

import 'state.dart';

class ShopSettledLogic extends getx.GetxController {
  final state = ShopSettledState();

  void uploadImg(FormData data, String key) async {
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
      EasyLoading.showSuccess('上传成功！');
    }
  }

  void removeImg(String key, int index) {
    if (key == 'shop_photo') {
      final List shop_photo = [];
      shop_photo.addAll(state.shop_photo.value);
      shop_photo.remove(index);
      state.shop_photo.value = shop_photo;
    } else {
      final List other_img = [];
      other_img.addAll(state.other_img.value);
      other_img.remove(index);
      state.other_img.value = other_img;
    }
  }

  void entryAdd(data) async {
    final RealResponseData response = await CommonService.entryAdd(data);
    if (response.result) {
      EasyLoading.showSuccess('入驻成功！');
    }
  }

  void onChangeSelect(String index) {
    state.collection_type.value = index;
  }
}
