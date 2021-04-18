import 'package:egou_app/common/routes.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/app_buttons.dart';
import 'package:egou_app/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class PwdUpdatePage extends StatelessWidget {
  final PwdUpdateLogic logic = Get.put(PwdUpdateLogic());
  final PwdUpdateState state = Get.find<PwdUpdateLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title: '登陆密码修改'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Container(
            width: ScreenUtil().setWidth(903),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                Text('修改登陆密码', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_70)),
                SizedBox(height: 50),
                RowTextField(
                  title: '旧密码',
                  key: GlobalKey(),
                  controller: TextEditingController(),
                  labelText: '请填写6-20位旧登录密码',
                  titleFlexType: TitleFlexType.Column,
                  contentPaddingTop: 15,
                  labelTop: 17,
                  height: 80,
                ),
                SizedBox(height: 30),
                RowTextField(
                  title: '新密码',
                  key: GlobalKey(),
                  controller: TextEditingController(),
                  labelText: '请填写6-20位新登录密码',
                  titleFlexType: TitleFlexType.Column,
                  contentPaddingTop: 15,
                  labelTop: 17,
                  height: 80,
                ),
                SizedBox(height: 30),
                RowTextField(
                  title: '确认密码',
                  key: GlobalKey(),
                  controller: TextEditingController(),
                  labelText: '请填写6-20位新登录密码',
                  titleFlexType: TitleFlexType.Column,
                  contentPaddingTop: 15,
                  labelTop: 17,
                  height: 80,
                ),
              ]
            )
          )),
          Container(
            alignment: Alignment.center,
            height: ScreenUtil().setWidth(250),
            decoration: BoxDecoration(
                color: Colors.white,
            ),
            child: RadiusButton('确定', width: 903, height: 156, onTap: (){Get.toNamed(RouteConfig.edit_address);}),
          )
        ]
      )
    );
  }
}
