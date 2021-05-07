import 'package:egou_app/common/routes.dart';
import 'package:egou_app/common/utils.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/widgets/app_buttons.dart';
import 'package:egou_app/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class RegisterPage extends StatelessWidget {
  final RegisterLogic logic = Get.put(RegisterLogic());
  final RegisterState state = Get.find<RegisterLogic>().state;
  final TextEditingController _mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Widget getCodeBtn = GestureDetector(
      onTap: () { logic.sendSms(_mobileController.text); },
      child: Text('获取验证码', style: TextStyle(fontSize: ScreenUtil().setSp(48), color: AppColors.COLOR_PRIMARY_D22315)),
    );
    final Widget countDownText = Obx(() => Text('${state.CountDownSeconds.value}s', style: TextStyle(fontSize: ScreenUtil().setSp(48), color: AppColors.COLOR_PRIMARY_D22315)));
    final List<Widget> textFieldItems  = [
      RowTextField(
          title: '手机',
          key: GlobalKey(),
          controller: _mobileController,
          labelText: '请填写手机号码',
          titleFlexType: TitleFlexType.Column,
          contentPaddingTop: 15,
          labelTop: 20,
          height: 90,
          suffixIcon:Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text('+86', style: TextStyle(fontSize: ScreenUtil().setSp(48),
                fontWeight: FontWeight.bold, color: AppColors.COLOR_PRIMARY_D22315)),
          )
      ),
      SizedBox(height: 30),
      RowTextField(
          title: '短信验证码',
          key: GlobalKey(),
          controller: TextEditingController(),
          labelText: '请填写验证码',
          titleFlexType: TitleFlexType.Column,
          contentPaddingTop: 15,
          labelTop: 20,
          height: 90,
          suffixIcon: Padding(
            padding: EdgeInsets.only(top: 10),
            child: Obx(() => state.isStartCountdown.value ? countDownText : getCodeBtn),
          ),
          isRequired: true
      ),
      SizedBox(height: 30),
      RowTextField(
        title: '密码',
        key: GlobalKey(),
        controller: TextEditingController(),
        labelText: '请填写6-20位登录密码',
        titleFlexType: TitleFlexType.Column,
        contentPaddingTop: 15,
        labelTop: 20,
        height: 90,
        isRequired: true, obscureText: true,
      ),
      SizedBox(height: 30),
      RowTextField(
        title: '确认密码',
        key: GlobalKey(),
        controller: TextEditingController(),
        labelText: '请确认登录密码',
        titleFlexType: TitleFlexType.Column,
        contentPaddingTop: 15,
        labelTop: 20,
        height: 90,
        isRequired: true, obscureText: true,
      ),
      SizedBox(height: 30),
      RowTextField(
        title: '交易密码 ',
        key: GlobalKey(),
        controller: TextEditingController(),
        labelText: '请输入交易密码',
        titleFlexType: TitleFlexType.Column,
        contentPaddingTop: 15,
        labelTop: 20,
        height: 90,
        isRequired: true, obscureText: true,
      ),
      SizedBox(height: 30),
      RowTextField(
        title: '邀请码 ',
        key: GlobalKey(),
        controller: TextEditingController(),
        labelText: '请填写邀请码',
        titleFlexType: TitleFlexType.Column,
        contentPaddingTop: 15,
        labelTop: 20,
        height: 90,
        isRequired: true
      )
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: ListView(
                  padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                  children: [
                    Text('注册', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_70)),
                    SizedBox(height: 50),
                    Form(child: Column(
                      children: textFieldItems,
                    ), onChanged: () {
                      final isPass = Utils.validate(context, textFieldItems);
                      logic.onChangeDisabled(!isPass);
                    }),
                    SizedBox(height: 50),
                    Obx(() => RadiusButton('立即注册', disabled: state.disabled.value, width: 903, height: 156, onTap: (){Get.toNamed(RouteConfig.edit_address);})),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('已有账号? 去', style: TextStyle(color: AppColors.COLOR_GRAY_848484, fontSize: ScreenUtil().setSp(48))),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: (){
                            Get.back();
                          },
                          child: Text('登录', style: TextStyle(color: AppColors.COLOR_PRIMARY_D22315, fontSize: ScreenUtil().setSp(48))),
                        )
                      ],
                    ),
                  ]))
            ]
        ),
      ),
    );
  }
}
