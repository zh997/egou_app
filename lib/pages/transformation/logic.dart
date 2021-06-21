import 'package:egou_app/common/utils.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/transform.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'state.dart';

class TransformationLogic extends GetxController {
  final state = TransformationState();
  void onChangeSelect(int index) {
    state.collection_type.value = index;
  }

  Future onGetConversionUser() async {
    final RealResponseData response = await TransformService.ConversionUser();
    if (response.result) {
      state.conversionUser.value = response.data;
    }
  }

  Future onConversionMove(Map<String, dynamic> data) async {
    EasyLoading.show();
    final RealResponseData response = await TransformService.ConversionMove(data);
    if (response.result) {
      Utils.toast('互转成功');
    }
    EasyLoading.dismiss();
  }
}
