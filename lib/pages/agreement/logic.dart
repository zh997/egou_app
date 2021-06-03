import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/user.dart';
import 'package:get/get.dart';

import 'state.dart';

class AgreementLogic extends GetxController {
  final state = AgreementState();
  Future onShopSettingPolicy() async {
    final RealResponseData response = await UserService.shopSettingPolicy();
    if (response.result) {
      state.userPolicy.value = response.data;
    }
  }
}
