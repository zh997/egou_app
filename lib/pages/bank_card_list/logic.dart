import 'package:egou_app/models/bank_card_list.dart';
import 'package:get/get.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/bank_card.dart';
import 'state.dart';

class BankCardListLogic extends GetxController {
  final state = BankCardListState();
  Future onGetBankCardList() async  {
    final RealResponseData response = await BankCardService.bankCardList(1);
    if (response.result) {
      state.bankCardList.value = response.data;
      state.hasMore.value = response.more;
      state.page.value = 1;
    }
  }

  Future onLoadMore() async {
    if (state.hasMore.value > 0) {
      final page = state.page.value + 1;
      final RealResponseData response = await BankCardService.bankCardList(page);
      final List list =  state.bankCardList.value;
      list.addAll(response.data);
      state.bankCardList.value = list;
      state.hasMore.value = response.more;
      state.page.value = page;
    }
  }

  void onSelectedBankCard(BankCardListModel bankCard) {
    state.selectedBankCard.value = bankCard;
  }
}
