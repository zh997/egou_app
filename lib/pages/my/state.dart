import 'package:egou_app/models/user.dart';
import 'package:get/get.dart';

class MyState {
  Rx<UserInfoModel> userInfo = UserInfoModel().obs;
  MyState() {
    ///Initialize variables
  }
}
