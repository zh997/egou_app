import 'package:get/get.dart';
import 'package:egou_app/services/withdraw.dart';
import 'package:egou_app/http/response_data.dart';
import 'state.dart';

class WithDrawalRecordLogic extends GetxController {
  final state = WithDrawalRecordState();

  // 提现记录
  Future onGetWithdrawRecord() async {
    final RealResponseData response = await WithdrawService.withdrawRecord(1);
    if (response.result) {
      state.withdrawRecord.value = response.data;
      state.hasMore.value = response.more;
      state.page.value = 1;
    }
  }

  Future onLoadMore() async {
    if (state.hasMore.value > 0) {
      final page = state.page.value + 1;
      final RealResponseData response = await WithdrawService.withdrawRecord(page);
      final List list = [];
      list.addAll(state.withdrawRecord.value);
      list.addAll(response.data);
      state.withdrawRecord.value = list;
      state.hasMore.value = response.more;
      state.page.value = page;
    }
  }
}
