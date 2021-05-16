import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/services/account.dart';
import 'package:get/get.dart';

import 'state.dart';

class BalanceLogic extends GetxController {
  final state = BalanceState();
  Future onGetAccountLog(Map<String, dynamic> data) async {
    final RealResponseData response = await AccountService.userAccountLog(data);
    if (response.result) {
      state.accounLogList.value = response.data;
    }
  }

  Future onLoadMore(Map<String, dynamic> data) async {
    if (state.hasMore.value > 0) {
      final page = state.page.value + 1;
      data['page_no'] = page;
      final RealResponseData response = await AccountService.userAccountLog(data);
      final List list =  state.accounLogList.value;
      list.addAll(response.data);
      state.accounLogList.value = list;
      state.hasMore.value = response.more;
      state.page.value = page;
    }
  }
}
