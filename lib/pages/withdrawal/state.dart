import 'package:get/get.dart';
import 'package:egou_app/models/bank_card_list.dart';

class WithdrawalState {
  Rx<BankCardListModel> selectCard = BankCardListModel().obs;
  WithdrawalState() {
    ///Initialize variables
  }
}
