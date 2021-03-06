import 'package:egou_app/http/response_data.dart';
import 'package:get/get.dart';
import 'package:egou_app/services/team.dart';
import 'state.dart';

class MyTeamLogic extends GetxController {
  final state = MyTeamState();

  Future onGetTeamList(int type) async {
    final RealResponseData response = await TeamService.userMyTeam({'page_no': 1, 'type': type});
    if (response.result) {
      state.teamLists.value = response.data.list;
      state.first_count.value = response.data.firstCount;
      state.team_count.value = response.data.teamCount;
      state.hasMore.value = response.data.more;
      state.user.value = response.data.user;
      state.page.value = 1;
      state.type.value = type;
    }
  }

  Future onLoadMore(int type) async {
    if (state.hasMore.value > 0) {
      final page = state.page.value + 1;
      final RealResponseData response = await TeamService.userMyTeam({'page_no': page, 'type': type});
      final List list = [];
      list.addAll(state.teamLists.value);
      list.addAll(response.data);
      state.teamLists.value = list;
      state.hasMore.value = response.more;
      state.page.value = page;
    }
  }
}
