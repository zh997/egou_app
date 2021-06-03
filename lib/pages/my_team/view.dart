import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_space.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/small_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:egou_app/models/user_team.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class MyTeamPage extends StatefulWidget {
  @override
  _MyTeamPageState createState() => _MyTeamPageState();
}

class _MyTeamPageState extends State<MyTeamPage> {
  final MyTeamLogic logic = Get.put(MyTeamLogic());
  final MyTeamState state = Get.find<MyTeamLogic>().state;

  Future _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = logic.onGetTeamList(state.type.value);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: _future, builder: (BuildContext context, AsyncSnapshot snapshot){
      if (snapshot.connectionState == ConnectionState.done) {
        return Obx((){
          final List teamLists = state.teamLists.value;
          final int first_count = state.first_count.value;
          final int team_count  = state.team_count.value;
          final User user = state.user.value;
          final int type = state.type.value;
          return Scaffold(
              backgroundColor: AppColors.COLOR_GRAY_F7F7F7,
              appBar: CustomAppBar(title: '我的团队', leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333)),
              body: SafeArea(
                  child: EasyRefresh.custom(
                    header: BallPulseHeader(color: AppColors.COLOR_PRIMARY_D22315),
                    footer: BallPulseFooter(color: AppColors.COLOR_PRIMARY_D22315),
                    onRefresh: () async => await  logic.onGetTeamList(state.type.value),
                    onLoad: () async => await logic.onLoadMore(state.type.value),
                    slivers: [
                      SliverList(delegate: SliverChildListDelegate([
                        SizedBox(height: 15),
                        Container(
                            color: Colors.white,
                            child: Column(
                              children: [
                                _infoItem(130.0, true, user),
                                SizedBox(height: 15),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: InkWell(
                                          onTap: (){
                                            logic.onGetTeamList(0);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.only(bottom: 15),
                                            decoration: BoxDecoration(
                                                border: type == 0 ? Border(bottom: BorderSide(width: 2, color: AppColors.COLOR_PRIMARY_D22315)) : Border()
                                            ),
                                            child: Column(
                                                children: [
                                                  Text('直推团友', style: TextStyle(fontSize: AppFontsize.SIZE_36, color: AppColors.COLOR_GRAY_B7B7B7)),
                                                  SizedBox(height: 5),
                                                  Text( first_count.toString(), style: TextStyle(fontSize: AppFontsize.SIZE_56, fontWeight: FontWeight.bold, color: AppColors.COLOR_PRIMARY_D22315))
                                                ]
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: InkWell(
                                          onTap: (){
                                            logic.onGetTeamList(1);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.only(bottom: 15),
                                            decoration: BoxDecoration(
                                                border: type == 1 ? Border(bottom: BorderSide(width: 2, color: AppColors.COLOR_PRIMARY_D22315)) : Border()
                                            ),
                                            child: Column(
                                                children: [
                                                  Text('全部团友', style: TextStyle(fontSize: AppFontsize.SIZE_36, color: AppColors.COLOR_GRAY_B7B7B7)),
                                                  SizedBox(height: 5),
                                                  Text(team_count.toString(), style: TextStyle(fontSize: AppFontsize.SIZE_56, fontWeight: FontWeight.bold, color: AppColors.COLOR_PRIMARY_D22315))
                                                ]
                                            ),
                                          )
                                        ),
                                      )
                                    ]
                                ),
                                // SizedBox(height: 15)
                              ],
                            )
                        ),
                        SizedBox(height: 15)
                      ]),),
                      SliverList(delegate: SliverChildBuilderDelegate((BuildContext context, int index){
                        return Container(color: Colors.white, child: _infoItem(100.0, false, teamLists[index]),);
                      }, childCount: teamLists.length))
                    ],
                  )
              )
          );
        });
      }
      return SpinKit();
    });
  }

  Widget _infoItem(radius, isShowId, item) {
    return Column(
        children: [
          SizedBox(height: 15),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.only(right: 10, left: 20),
                  child: Container(
                    width: ScreenUtil().setWidth(radius),
                    height:  ScreenUtil().setWidth(radius),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radius)
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: Image.network(item.avatar, fit: BoxFit.cover),
                  )
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(item.mobile, style: TextStyle(
                          fontSize: AppFontsize.SIZE_56,
                          color: AppColors.COLOR_BLACK_000000
                      )),
                      Container(
                        padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                        margin: EdgeInsets.only(left: 10),
                        decoration: BoxDecoration(
                            color: AppColors.COLOR_6AB354,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text(isShowId  ? item.makerLevelStr : item.levelName, style: TextStyle(
                            fontSize: AppFontsize.SIZE_36,
                            color: Colors.white
                        )),
                      )
                    ],
                  ),
                  isShowId ? SizedBox(height: AppSpace.SPACE_24) : SizedBox(height: 0),
                  isShowId ? Text('UID:${item.id.toString()}', style: TextStyle(
                      fontSize: AppFontsize.SIZE_36,
                      color: AppColors.COLOR_BLACK_000000
                  )) : SizedBox()
                ],
              )
            ],
          ),
          SizedBox(height: 15),
          Divider()
        ]
    );
  }
}
