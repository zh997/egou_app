import 'dart:convert';
import 'package:egou_app/common/utils.dart';
import 'package:egou_app/services/common.dart';
import 'package:universal_html/html.dart' as html;
import 'package:egou_app/constant/app_api_urls.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:get/get.dart';
import 'package:egou_app/services/bank_card.dart';
import 'state.dart';

class MakeQrcodeLogic extends GetxController {
  final state = MakeQrcodeState();
  Future onAddBankCard(Map<String, dynamic> data) async  {
    final RealResponseData response = await BankCardService.addBankCard(data);
    if (response.result) {
      Utils.toast('绑定成功');
      Get.back();
    }
  }

  void uploadImg(data) async {
    html.HttpRequest.request(AppApiUrls.UPLOAD_IMG, method: 'post', sendData: data).then((res){
      res.onLoadEnd.listen((e) {
        final response = json.decode(res.response);
        if (response['code'] == 1) {
          state.image.value = response['data']['url'];
        }
      });
    });

  }

  void appUploadImg(data) async {
    final RealResponseData response = await CommonService.uploadImg(data);
    if (response.result) {
      state.image.value = response.data.url;
    }
  }

  void onChangeImage(String img){
    state.image.value = img;
  }

}
