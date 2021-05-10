import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/user.dart';
import 'package:get/get.dart';

import 'state.dart';

class MyLogic extends GetxController {
  final state = MyState();

  Future onGetUserInfo () async {
    final RealResponseData response = await UserService.getUserInfo();
    if (response.result) {
      state.userInfo.value = response.data;
    }
  }
}
