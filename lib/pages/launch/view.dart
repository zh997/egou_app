import 'dart:async';
import 'dart:math';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class LaunchPage extends StatelessWidget {
  final LaunchLogic logic = Get.put(LaunchLogic());
  final LaunchState state = Get.find<LaunchLogic>().state;
  LaunchPage(){ logic.StartCountDown(); }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,  // 未定位的元素充满Stack空间
        children: [
          Container(
            alignment: Alignment.center,
            color: AppColors.COLOR_PRIMARY_1,
            child: Image.asset(AppImages.APP_OPEN_LOGO, width: ScreenUtil().setWidth(384), height: ScreenUtil().setWidth(372)),
          ),
          // Positioned(
          //   top: MediaQuery.of(context).padding.top + 30,
          //   right: 30,
          //   child: Container(
          //     padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          //     decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(10),
          //       color: Color(0x7F757575)
          //     ),
          //     child: Obx(() => Text('${state.CountDownSeconds}s', style: TextStyle(fontSize: 18, color: Colors.white))),
          //   )
          // )
        ],
      ),
    );
  }
}
