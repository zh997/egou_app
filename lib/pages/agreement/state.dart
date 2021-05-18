import 'package:get/get.dart';
import 'package:egou_app/models/user_policy.dart';

class AgreementState {
  Rx<UserPolicyModel> userPolicy = UserPolicyModel().obs;
  AgreementState() {
    ///Initialize variables
  }
}
