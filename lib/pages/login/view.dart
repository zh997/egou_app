import 'package:egou_app/widgets/app_text_field.dart';
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

  final TextEditingController _mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Widget getCodeBtn = Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        onTap: () { logic.sendSms(_mobileController.text); },
        child: Text('获取验证码', style: TextStyle(fontSize: ScreenUtil().setSp(48), color: AppColors.COLOR_PRIMARY_D22315)),
      ),
    );
    // suffixIcon: Obx(() => state.isStartCountdown.value ? countDownText : getCodeBtn)
    final Widget countDownText = Obx(() => Text('${state.CountDownSeconds.value}s', style: TextStyle(fontSize: ScreenUtil().setSp(48), color: AppColors.COLOR_PRIMARY_D22315)));
    final List<Widget> textFieldItems = [
      RowTextField(name: 'account', key: GlobalKey(), controller: _mobileController,
        labelText: '请输入手机号', icon: Text('+86', style: TextStyle(fontSize: ScreenUtil().setSp(48),
              fontWeight: FontWeight.bold, color: AppColors.COLOR_BLACK_000000)),
        contentPaddingLeft: 18, labelLeft: 55,
          isRequired: true
      ),
      SizedBox(height: 10),
      RowTextField(name: 'password', key: GlobalKey(), controller: TextEditingController(),
        labelText: '请输入密码', icon: Text('密码', style: TextStyle(fontSize: ScreenUtil().setSp(48),
            fontWeight: FontWeight.bold, color: AppColors.COLOR_BLACK_000000)),
        contentPaddingLeft: 15 , labelLeft: 55,isRequired: true, obscureText: true,
      ),
    ];

    return  Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
              child: Container(
                width: ScreenUtil().setWidth(960),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50),
                    _HeaderLogo(),
                    SizedBox(height: 50),
                    Form(child: Column(
                      children: textFieldItems,
                    ), onChanged: () {
                      final isPass = Utils.validate(context, textFieldItems, false);
                      logic.onChangeDisabled(!isPass);
                    }),
                    SizedBox(height: 40),
                    Obx(() => RadiusButton('登录', width: 960, onTap: () {
                      final data = Utils.getFormValue(textFieldItems);
                      logic.onAccountLogin(data);
                    }, disabled: state.disabled.value)),
                  ],
                ),
              )
          ),
        ),
      )  ,
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
              behavior: HitTestBehavior.opaque,
              onTap: (){
                Get.toNamed(RouteConfig.register_page);
              },
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
