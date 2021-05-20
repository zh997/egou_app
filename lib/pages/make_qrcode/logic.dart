import 'dart:convert';
import 'package:egou_app/services/common.dart';
import 'package:universal_html/html.dart' as html;
import 'package:egou_app/constant/app_api_urls.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:egou_app/services/bank_card.dart';
import 'state.dart';

class MakeQrcodeLogic extends GetxController {
  final state = MakeQrcodeState();
  Future onAddBankCard(Map<String, dynamic> data) async  {
    EasyLoading.show(status: '绑定中');
    final RealResponseData response = await BankCardService.addBankCard(data);
    if (response.result) {
      EasyLoading.showSuccess('绑定成功');
      Get.back();
    }
  }

  void uploadImg(data) async {
    EasyLoading.show(status: '正在上传');
    html.HttpRequest.request(AppApiUrls.UPLOAD_IMG, method: 'post', sendData: data).then((res){
      res.onLoadEnd.listen((e) {
        final response = json.decode(res.response);
        if (response['code'] == 1) {
          state.image.value = response['data']['url'];
        }
        EasyLoading.dismiss();
      });
    });

  }

  void appUploadImg(data) async {
    EasyLoading.show(status: '正在上传');
    final RealResponseData response = await CommonService.uploadImg(data);
    if (response.result) {
      state.image.value = response.data.url;
    }
    EasyLoading.dismiss();
  }

  void onChangeImage(String img){
    state.image.value = img;
  }

}
