import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/user.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'state.dart';

class ConcatUsLogic extends GetxController {
  final state = ConcatUsState();
  Future onShopSettingAbout() async {
    EasyLoading.show(status: '加载中');
    final RealResponseData response = await UserService.shopSettingAbout();
    if (response.result) {
         state.concatUs.value = response.data;
    }
    EasyLoading.dismiss();
  }
}
