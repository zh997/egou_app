import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/user.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'state.dart';

class AgreementLogic extends GetxController {
  final state = AgreementState();
  Future onShopSettingPolicy() async {
    EasyLoading.show(status: '加载中');
    final RealResponseData response = await UserService.shopSettingPolicy();
    if (response.result) {
      state.userPolicy.value = response.data;
    }
    EasyLoading.dismiss();
  }
}
