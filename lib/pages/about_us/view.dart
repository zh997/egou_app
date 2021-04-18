import 'package:egou_app/common/routes.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class AboutUsPage extends StatelessWidget {
  final AboutUsLogic logic = Get.put(AboutUsLogic());
  final AboutUsState state = Get.find<AboutUsLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title: '关于我们'),
      body: Column(
        children: [
          SizedBox(height: 15),
          _listItem('当前版本',rightText: Text('v1.0.2', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48))),
          SizedBox(height: 15),
          _listItem('最新版本', rightText: Text('v1.0.2', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48))),
          SizedBox(height: 15),
          _listItem('用户协议')
        ]
      )
    );
  }

  Widget _listItem(text, {rightText}) {
    return InkWell(
        onTap: () {
          Get.toNamed(RouteConfig.shop_detail);
        },
        child: Container(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            color: Colors.white,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(text, style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
                  rightText ?? Image.asset(AppImages.ARROW_RIGHT_ICON, width: 8, height: 18)
                ]
            )
        )
    );
  }
}
