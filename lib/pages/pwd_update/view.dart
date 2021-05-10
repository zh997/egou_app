import 'package:egou_app/common/routes.dart';
import 'package:egou_app/common/utils.dart';
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

class PwdUpdatePage extends StatefulWidget {
  @override
  _PwdUpdatePageState createState() => _PwdUpdatePageState();
}

class _PwdUpdatePageState extends State<PwdUpdatePage> {
  final PwdUpdateLogic logic = Get.put(PwdUpdateLogic());
  final PwdUpdateState state = Get.find<PwdUpdateLogic>().state;
  final TextEditingController _mobileController = TextEditingController();
  String type = Get.parameters['type'];
  String title;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    title = int.parse(type) == 1 ? '登录' : '交易';
  }

  @override
  Widget build(BuildContext context) {
    final Widget getCodeBtn = GestureDetector(
      onTap: () { logic.sendSms(_mobileController.text); },
      child: Text('获取验证码', style: TextStyle(fontSize: ScreenUtil().setSp(48), color: AppColors.COLOR_PRIMARY_D22315)),
    );
    final Widget countDownText = Obx(() => Text('${state.CountDownSeconds.value}s', style: TextStyle(fontSize: ScreenUtil().setSp(48), color: AppColors.COLOR_PRIMARY_D22315)));
    final List<Widget> textFieldItems = [
      SizedBox(height: 50),
      RowTextField(
          title: '手机',
          name: 'mobile',
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
          name: 'code',
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
        title: '新密码',
        name: 'password',
        key: GlobalKey(),
        controller: TextEditingController(),
        labelText: '请填写6-20位新${title}密码',
        titleFlexType: TitleFlexType.Column,
        contentPaddingTop: 15,
        labelTop: 20,
        height: 90,
      ),
      SizedBox(height: 30),
      RowTextField(
        title: '确认密码',
        key: GlobalKey(),
        name: 'repassword',
        controller: TextEditingController(),
        labelText: '请填写6-20位新${title}密码',
        titleFlexType: TitleFlexType.Column,
        contentPaddingTop: 15,
        labelTop: 20,
        height: 90,
      )
    ];

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title:  '${title}密码修改'),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: ListView(
                  padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
                  children: [
                    SizedBox(height: 50),
                    Text('修改${title}密码', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_70)),
                    Form(child: Column(
                      children: textFieldItems,
                    ), onChanged: () {
                      final isPass = Utils.validate(context, textFieldItems, false);
                      logic.onChangeDisabled(!isPass);
                    }),
                    SizedBox(height: 50),
                    Obx(() => RadiusButton('确定',disabled: state.disabled.value, width: 903, height: 156, onTap: (){
                      if (!state.disabled.value) {
                        final data = Utils.getFormValue(textFieldItems);
                        print(data);
                        logic.onUpdateLoginPwd(data);
                      }
                    }))
                  ]))
            ]
        )
    );
  }
}