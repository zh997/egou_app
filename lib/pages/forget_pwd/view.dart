import 'package:egou_app/common/routes.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/app_buttons.dart';
import 'package:egou_app/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class ForgetPwdPage extends StatefulWidget {
  @override
  _ForgetPwdPageState createState() => _ForgetPwdPageState();
}

class _ForgetPwdPageState extends State<ForgetPwdPage> {
  final ForgetPwdLogic logic = Get.put(ForgetPwdLogic());
  final ForgetPwdState state = Get.find<ForgetPwdLogic>().state;
  final TextEditingController _pwdController = TextEditingController();
  int step = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pwdController.text = '1245678';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title: '找回密码'),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: ListView(
                  padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                  children: [
                    SizedBox(height: 50),
                    Text('修改登陆密码', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_70)),
                    SizedBox(height: 50),
                    step == 1 ? _stepOne() : _stepTwo()
                  ]))
            ]
        )
    );
  }

  Widget _stepOne() {
    return Column(
      children: [
        RowTextField(
          title: '手机号',
          key: GlobalKey(),
          controller: TextEditingController(),
          labelText: '请填写手机号码',
          titleFlexType: TitleFlexType.Column,
          suffixIcon:Padding(
            padding: EdgeInsets.only(top: 8),
            child:  Text('+86', style: TextStyle(color: AppColors.COLOR_PRIMARY_D22315, fontSize: AppFontsize.SIZE_50, fontWeight: FontWeight.bold)),
          ),
          contentPaddingTop: 15,
          labelTop: 20,
          height: 90,
        ),
        SizedBox(height: 30),
        RowTextField(
          title: '短信验证码',
          key: GlobalKey(),
          controller: TextEditingController(),
          labelText: '请填写验证码',
          titleFlexType: TitleFlexType.Column,
          contentPaddingTop: 15,
          suffixIcon: Padding(
            padding: EdgeInsets.only(top: 8),
            child:Text('获取验证码', style: TextStyle(color: AppColors.COLOR_PRIMARY_D22315, fontSize: AppFontsize.SIZE_50)) ,
          ),
          labelTop: 20,
          height: 90,
        ),
        SizedBox(height: 50),
        RadiusButton('下一步', width: 903, height: 156, onTap: (){setState(() {
          step = 2;
        });})
      ],
    );
  }

  Widget _stepTwo() {
    return Column(
      children: [
        RowTextField(
          title: '您的密码是',
          key: GlobalKey(),
          controller: _pwdController,
          labelText: '请填写手机号码',
          titleFlexType: TitleFlexType.Column,
          suffixIcon:Padding(
            padding: EdgeInsets.only(top: 8),
            child:  Text('复制', style: TextStyle(color: AppColors.COLOR_PRIMARY_D22315, fontSize: AppFontsize.SIZE_50)),
          ),
          contentPaddingTop: 15,
          labelTop: 20,
          height: 90,
        ),

        SizedBox(height: 50),
        RadiusButton('确定', width: 903, height: 156, onTap: (){Get.back();})
      ],
    );
  }
}
