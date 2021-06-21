import 'package:egou_app/models/bank_card_list.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:egou_app/services/withdraw.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/common/utils.dart';
import 'state.dart';

class WithdrawalLogic extends GetxController {
  final state = WithdrawalState();

  Future onApplyWithdraw(Map<String, dynamic> data) async {
    EasyLoading.show();
    final RealResponseData response = await WithdrawService.withdrawApply(data);
    if (response.result) {
       Utils.toast('申请已提交，待审核');
    }
    EasyLoading.dismiss();
  }

  void onSelectCard (BankCardListModel card) {
    state.selectCard.value = card;
  }
}
