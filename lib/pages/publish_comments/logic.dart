import 'package:egou_app/common/utils.dart';
import 'package:egou_app/services/order.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:convert';
import 'package:universal_html/html.dart' as html;
import 'package:egou_app/constant/app_api_urls.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:get/get.dart' as getx;
import 'package:egou_app/services/common.dart';
import 'package:egou_app/services/comment.dart';

import 'state.dart';

class PublishCommentsLogic extends GetxController {
  final state = PublishCommentsState();
  void onChangForm(String key, int value){
    if (key == 'description_comment') {
      state.description_comment.value = value + 1;
    } else if(key == 'goods_comment') {
      state.goods_comment.value = value + 1;
    } else if(key == 'service_comment') {
      state.service_comment.value = value + 1;
    } else if(key == 'express_comment') {
      state.express_comment.value = value + 1;
    }
  }
  void uploadImg(data) async {
    html.HttpRequest.request(AppApiUrls.UPLOAD_IMG, method: 'post', sendData: data).then((res){
      res.onLoadEnd.listen((e) {
        final response = json.decode(res.response);
        if (response['code'] == 1) {
          final List shop_photo = [];
          shop_photo.addAll(state.image.value);
          shop_photo.add(response['data']['url']);
          state.image.value = shop_photo;
        }
      });
    });
  }

  Future onAddComment(Map<String, dynamic> data) async {
    final RealResponseData response = await CommentService.addComment(data);
    if (response.result) {
      Utils.toast('评价成功');
      Get.back();
    }
  }

  Future onGetOrderDetail(int id) async {
    final RealResponseData response = await OrderService.orderDetail(id);
    if (response.result) {
      state.orderDetail.value = response.data;
    }
  }

  void removeImg( int index) {
    final List shop_photo = [];
    shop_photo.addAll(state.image.value);
    shop_photo.removeAt(index);
    state.image.value = shop_photo;
  }

  void appUploadImg(data) async {
    final RealResponseData response = await CommonService.uploadImg(data);
    if (response.result) {
      final List shop_photo = [];
      shop_photo.addAll(state.image.value);
      shop_photo.add(response.data.url);
      state.image.value = shop_photo;
    }
  }
}
