import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:egou_app/common/routes.dart';
import 'package:egou_app/common/utils.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_strings.dart';
import 'package:egou_app/widgets/app_buttons.dart';
import 'package:egou_app/widgets/text_field.dart';

import 'logic.dart';
import 'state.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginLogic logic = Get.put(LoginLogic());
  final LoginState state = Get.find<LoginLogic>().state;

  @override
  Widget build(BuildContext context) {
    final Widget getCodeBtn = GestureDetector(
      onTap: logic.StartCountDown,
      child: Text('获取验证码', style: TextStyle(fontSize: ScreenUtil().setSp(48), color: AppColors.COLOR_PRIMARY_D22315)),
    );
    final Widget countDownText = Obx(() => Text('${state.CountDownSeconds.value}s', style: TextStyle(fontSize: ScreenUtil().setSp(48), color: AppColors.COLOR_PRIMARY_D22315)));
    final List<Widget> textFieldItems = [
      TextFormFieldWidget('user_name', key: GlobalKey(), leftSolt:
      Text('+86', style: TextStyle(fontSize: ScreenUtil().setSp(48), fontWeight: FontWeight.bold, color: AppColors.COLOR_BLACK_000000)),
          rightSolt: Obx(() => state.isStartCountdown.value ? countDownText : getCodeBtn) ,
          validate: (String val){
            if (val.isEmpty) {
              return AppStrings.LOGIN_FORM_PHONE_LABELTEXT;
            }
            if (!Utils.isChinaPhoneLegal(val)) {
              return AppStrings.LOGIN_FORM_PHONE_LABELTEXT_1;
            }
            return '';
          }, labelText: AppStrings.LOGIN_FORM_PHONE_LABELTEXT, contentPaddingBottom: 5, labelHeight: 8,),
      SizedBox(height: 10),
      TextFormFieldWidget('password', key: GlobalKey(),leftSolt:
      Text('密码', style: TextStyle(fontSize: ScreenUtil().setSp(48), color: AppColors.COLOR_BLACK_000000)), validate: (String val){
        if (val.isEmpty) {
          return AppStrings.LOGIN_FORM_PWD_LABELTEXT;
        }
        return '';
      }, labelText: AppStrings.LOGIN_FORM_PWD_LABELTEXT, contentPaddingBottom: 5, labelHeight: 8),
    ];

    return  Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: Container(
              width: ScreenUtil().setWidth(960),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _HeaderLogo(),
                  SizedBox(height: 50),
                  Form(child: Column(
                    children: textFieldItems,
                  ), onChanged: () {
                    final formData = Utils.validate(context, textFieldItems);
                    logic.onChangeDisabled(!formData);
                  }),
                  SizedBox(height: 40),
                  Obx(() => RadiusButton('登录', width: 960, onTap: () {
                    Get.toNamed(RouteConfig.main_page);
                  }, disabled: state.disabled.value)),
                ],
              ),
            )
        ),
      ) ,
    );
  }

  Widget _HeaderLogo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImages.APP_LOGO, width: ScreenUtil().setWidth(180), height: ScreenUtil().setWidth(180)),
            Padding(
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(60)),
                child: Text(AppStrings.LOGIN, style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: ScreenUtil().setSp(80), fontWeight: FontWeight.bold))
            )
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('还没有账号? 立即', style: TextStyle(color: AppColors.COLOR_GRAY_848484, fontSize: ScreenUtil().setSp(48))),
            GestureDetector(
              onTap: (){},
              child: Text('注册', style: TextStyle(color: AppColors.COLOR_PRIMARY_D22315, fontSize: ScreenUtil().setSp(48))),
            )
          ],
        ),
      ],
    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    FocusManager.instance.primaryFocus.unfocus();
    super.dispose();
  }
}
