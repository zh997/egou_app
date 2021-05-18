import 'package:egou_app/models/bank_card_list.dart';
import 'package:get/get.dart';

class BankCardListState {
  RxList bankCardList = [].obs;
  RxInt hasMore = 0.obs;
  RxInt page = 1.obs;
  Rx<BankCardListModel> selectedBankCard = BankCardListModel().obs;
  BankCardListState() {
    ///Initialize variables
  }
}
