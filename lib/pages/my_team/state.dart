import 'package:egou_app/models/user_team.dart';
import 'package:get/get.dart';

class MyTeamState {
  RxList teamLists = [].obs;
  RxInt hasMore = 0.obs;
  RxInt page = 1.obs;
  RxInt team_count = 0.obs;
  RxInt first_count = 0.obs;
  Rx<User> user = User().obs;
  RxInt type = 0.obs;
  MyTeamState() {
    ///Initialize variables
  }
}
