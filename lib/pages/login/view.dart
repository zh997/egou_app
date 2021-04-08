import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zb_app/common/routes.dart';
import 'package:zb_app/common/utils.dart';
import 'package:zb_app/constant/app_colors.dart';
import 'package:zb_app/constant/app_images.dart';
import 'package:zb_app/constant/app_strings.dart';
import 'package:zb_app/constant/app_text_styles.dart';
import 'package:zb_app/widgets/app_buttons.dart';
import 'package:zb_app/widgets/text_field.dart';

import 'logic.dart';
import 'state.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginLogic logic = Get.put(LoginLogic());
  final LoginState state = Get.find<LoginLogic>().state;

  int current = 0;
  bool isRememberPwd = false;

  final List<Widget> textFieldItems = [
    TextFormFieldWidget('user_name', key: GlobalKey(), validate: (String val){
      if (val.isEmpty) {
        return AppStrings.LOGIN_FORM_PHONE_LABELTEXT;
      }
      return '';
    }, labelText: AppStrings.LOGIN_FORM_PHONE_LABELTEXT, suffixIcon: AppImages.TEXTFEILD_PHONE_ICON),
    TextFormFieldWidget('password', key: GlobalKey(), validate: (String val){
        if (val.isEmpty) {
          return AppStrings.LOGIN_FORM_PWD_LABELTEXT ;
        }
        return '';
      }, labelText: AppStrings.LOGIN_FORM_PWD_LABELTEXT, suffixIcon: AppImages.TEXTFEILD_PWD_ICON,
      obscureText: true,
    ),
    TextFormFieldWidget('code', key: GlobalKey(), validate: (String val){
      if (val.isEmpty) {
        return AppStrings.LOGIN_FORM_CODE_LABELTEXT ;
      }
      return '';
    }, labelText: AppStrings.LOGIN_FORM_CODE_LABELTEXT, suffixIcon: AppImages.TEXTFEILD_CODE_ICON,
      rightSolt: Container(
        height: ScreenUtil().setHeight(83),
        width: ScreenUtil().setWidth(170),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: AppColors.COLOR_RED_2,
            borderRadius: BorderRadius.circular(ScreenUtil().setHeight(83))
        ),
        child: Text('获取验证码', style: TextStyle(fontSize: ScreenUtil().setSp(28),color: Colors.white)),
      ),
    )
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _onChangeTab(int index) {
    setState(() {
      current = index;
    });
  }

  void _onChangeCheck(bool val) {
    setState(() {
      isRememberPwd = val;
    });
  }

  List<Widget> _onGetTextFieldItems(int current,List<Widget> items) {
    final list = List.generate(items.length, (index) => items[index]);
    if (current == 0) {
      list.removeAt(2);
    } else {
      list.removeAt(1);
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final items =  _onGetTextFieldItems(current, textFieldItems);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: Container(
              width: ScreenUtil().setWidth(895),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _LogoWidget(),
                  _TabWidget(),
                  _TextFeildWidget(items),
                  SizedBox(height: 15),
                  _RemmenberPwdItem(),
                  SizedBox(height: 30),
                  RadiusButton('登录', onTap: () {
                    // final formData = Utils.validate(context, items);
                    // print(formData);
                    Get.toNamed(RouteConfig.main_page);
                  }),
                  SizedBox(height: 20),
                  RadiusButton('商城首页', isLine: true),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('还没账户？'),
                      GestureDetector(
                        child: Row(
                          children: [
                            Text('注册', style: TextStyle(color: AppColors.COLOR_PRIMARY_1)),
                            Image.asset(AppImages.ARROW_RIGHT_YELLOW, width: ScreenUtil().setWidth(36), height: ScreenUtil().setHeight(36),)
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
        ),
      ) ,
    );
  }

  Widget _LogoWidget() {
    return Container(
      alignment: Alignment.center,
      width: ScreenUtil().setWidth(250),
      height: ScreenUtil().setWidth(250),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [BoxShadow(color: Utils.getColor('#f5f5f5'), blurRadius: 20.0, spreadRadius: 3.0)]
      ),
      child: Text('LOGO', style: TextStyle(fontSize: ScreenUtil().setSp(72), color: Utils.getColor('#2D3236'))),
    );
  }

  Widget _TabItem(String title, Color color, int index) {
    return Expanded(child: GestureDetector(
      onTap: () => _onChangeTab(index),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: color, width: 1))
        ),
        child: Text(title,  style: TextStyle(fontSize: ScreenUtil().setSp(40), color: color, fontWeight: FontWeight.bold)),
      ),
    ));
  }

  Widget _TabWidget() {
     final List<String> tabHeaderMap = ['手机号登录', '验证码登录'];
     Color _getColor(index) => current == index ? AppColors.COLOR_PRIMARY_1 : AppColors.COLOR_GRAY_2;
     return Container(
       width: ScreenUtil().setWidth(710),
       height: ScreenUtil().setWidth(150),
       margin: EdgeInsets.only(top: ScreenUtil().setWidth(100), bottom:  ScreenUtil().setWidth(50)),
       child: Row(
         children: List.generate(tabHeaderMap.length, (index) => _TabItem(tabHeaderMap[index], _getColor(index), index)),
       ),
     );
  }

  Widget _TextFeildWidget(items) {
    return Container(
      width: ScreenUtil().setWidth(710),
      child: Column(
        children: items,
      ),
    );
  }

  Widget _RemmenberPwdItem() {
    return Container(
      width: ScreenUtil().setWidth(710),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => _onChangeCheck(!isRememberPwd),
            child:  Row(
              children: [
                !isRememberPwd ? Image.asset(AppImages.CHECK_ICON, width: ScreenUtil().setWidth(38), height: ScreenUtil().setHeight(38)) :
                Image.asset(AppImages.CHECKED_ICON, width: ScreenUtil().setWidth(38), height: ScreenUtil().setHeight(38)),
                Padding(padding: EdgeInsets.only(left: 5), child: Text(AppStrings.LOGIN_FORM_REMENBER_PWD, style: AppTextStyles.COLOR_BLACK_3_SIZE_36))
              ],
            ),
          ),
          Text(AppStrings.LOGIN_FORM_FORGET_PWD, style: AppTextStyles.COLOR_BLACK_3_SIZE_36)
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    FocusManager.instance.primaryFocus.unfocus();
    super.dispose();
  }
}
