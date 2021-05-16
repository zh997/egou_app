import 'package:get/get.dart';

class BalanceState {
  RxList accounLogList = [].obs;
  RxInt hasMore = 0.obs;
  RxInt page = 1.obs;
  BalanceState() {
    ///Initialize variables
  }
}
