import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/bank_card.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'state.dart';

class BindCardLogic extends GetxController {
  final state = BindCardState();

  Future onAddBankCard(Map<String, dynamic> data) async  {
    EasyLoading.show(status: '绑定中');
    final RealResponseData response = await BankCardService.addBankCard(data);
    if (response.result) {
      EasyLoading.showSuccess('绑定成功');
      Get.back();
    }
  }
}
