import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_space.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class MyTeamPage extends StatelessWidget {
  final MyTeamLogic logic = Get.put(MyTeamLogic());
  final MyTeamState state = Get.find<MyTeamLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.COLOR_GRAY_F7F7F7,
      appBar: CustomAppBar(title: '商家真牛网络', leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333)),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 15),
            Container(
                color: Colors.white,
                child: Column(
                    children: [
                      _infoItem(30.0, true),
                      SizedBox(height: 15),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                                children: [
                                  Text('直推团友', style: TextStyle(fontSize: AppFontsize.SIZE_36, color: AppColors.COLOR_GRAY_B7B7B7)),
                                  SizedBox(height: 5),
                                  Text('6', style: TextStyle(fontSize: AppFontsize.SIZE_56, fontWeight: FontWeight.bold, color: AppColors.COLOR_PRIMARY_D22315))
                                ]
                            ),
                            Column(
                                children: [
                                  Text('全部团友', style: TextStyle(fontSize: AppFontsize.SIZE_36, color: AppColors.COLOR_GRAY_B7B7B7)),
                                  SizedBox(height: 5),
                                  Text('168', style: TextStyle(fontSize: AppFontsize.SIZE_56, fontWeight: FontWeight.bold, color: AppColors.COLOR_PRIMARY_D22315))
                                ]
                            )
                          ]
                      ),
                      SizedBox(height: 15)
                    ],
                )
            ),
            SizedBox(height: 15),
            Container(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(10, (index) => _infoItem(20.0, false))
                )
            )
          ]
        )
      )
    );
  }

  Widget _infoItem(radius, isShowId) {
    return Column(
      children: [
        SizedBox(height: 15),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 10, left: 20),
              child: CircleAvatar(
                  radius: radius,
                  child:  Image.asset(AppImages.APP_LOGO, fit: BoxFit.cover)
              )
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text('18288888888', style: TextStyle(
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
                      child: Text('市场主任', style: TextStyle(
                          fontSize: AppFontsize.SIZE_36,
                          color: Colors.white
                      )),
                    )
                  ],
                ),
                isShowId ? SizedBox(height: AppSpace.SPACE_24) : SizedBox(height: 0),
                isShowId ? Text('UID:8563', style: TextStyle(
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
