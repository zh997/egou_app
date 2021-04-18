import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class SharePage extends StatelessWidget {
  final ShareLogic logic = Get.put(ShareLogic());
  final ShareState state = Get.find<ShareLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title: '邀请好友'),
      body: ListView(
        children: [
          Container(
              color: Colors.blue,
              child: Image.asset(AppImages.SHARE_BG, fit: BoxFit.fill, width: 10000)
          )
        ]
      )
    );
  }
}
