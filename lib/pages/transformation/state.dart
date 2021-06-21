import 'package:egou_app/constant/app_enums.dart';
import 'package:get/get.dart';
import 'package:egou_app/models/conversion_user.dart';

class TransformationState {
  RxInt collection_type = ConversionType.user_money.obs;
  Rx<ConversionUserModel> conversionUser = ConversionUserModel().obs;
  TransformationState() {
    ///Initialize variables
  }
}
