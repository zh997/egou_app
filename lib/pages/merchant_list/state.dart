import 'package:get/get.dart';
class MerchantListState {
  RxList shopEntryList = [].obs;
  RxInt hasMore = 0.obs;
  RxInt page = 1.obs;
  MerchantListState() {
    ///Initialize variables
  }
}
