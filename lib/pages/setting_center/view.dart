import 'package:egou_app/common/routes.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class SettingCenterPage extends StatelessWidget {
  final SettingCenterLogic logic = Get.put(SettingCenterLogic());
  final SettingCenterState state = Get.find<SettingCenterLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title: '设置中心'),
      body: Column(
        children: [
          SizedBox(height: 15),
          _listItem('登陆密码修改', onTap: () {
            Get.toNamed(RouteConfig.pwd_update);
          }),
          SizedBox(height: 15),
          _listItem('找回登录密码', onTap: () {
            Get.toNamed(RouteConfig.forget_pwd);
          }),
          SizedBox(height: 15),
          _listItem('交易密码修改',onTap: () {
            Get.toNamed(RouteConfig.pwd_update);
          }),
          SizedBox(height: 15),
          _listItem('找回交易密码',onTap: () {
            Get.toNamed(RouteConfig.forget_pwd);
          })
        ]
      )
    );
  }

  Widget _listItem(text, {rightText, Function onTap}) {
    return InkWell(
        onTap: onTap != null ? onTap : (){},
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
