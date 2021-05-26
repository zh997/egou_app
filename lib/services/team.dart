import 'dart:convert';
import 'package:egou_app/constant/app_api_urls.dart';
import 'package:egou_app/http/http_request.dart';
import 'package:egou_app/http/response_data.dart';
import 'package:egou_app/models/user_team.dart';

class TeamService {

  // 团队列表
  static Future<RealResponseData> userMyTeam(Map<String, dynamic> data) async {
    final DioResponseData response = await HttpRequest.request(AppApiUrls.USER_MYTEAM, data, 'POST');
    if (response.result && response.data != null) {
      return HttpRequest.catchError(ResponseData.fromJson(response.data, fromJson: UserTeamListModelFromJson, noList: true));
    }
  }

}
