import 'package:get/get.dart';

class SearchState {
  RxList searchGoodsList = [].obs;
  RxInt hasMore = 0.obs;
  RxInt page = 1.obs;
  SearchState() {
    ///Initialize variables
  }
}
