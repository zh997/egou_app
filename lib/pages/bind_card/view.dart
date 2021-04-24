import 'package:egou_app/common/routes.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_radius.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/app_buttons.dart';
import 'package:egou_app/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class BindCardPage extends StatefulWidget {
  @override
  _BindCardPageState createState() => _BindCardPageState();
}

class _BindCardPageState extends State<BindCardPage> {
  final BindCardLogic logic = Get.put(BindCardLogic());
  final BindCardState state = Get.find<BindCardLogic>().state;

  int step = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),
          title: '余额提现',
          actions: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                Get.toNamed(RouteConfig.withdrawal_record);
              },
              child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(right: 15),
                  child: Text('提现记录', style: TextStyle(color: AppColors.COLOR_PRIMARY_D22315, fontSize: AppFontsize.SIZE_48)),
                ),
            )
          ],
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text('添加银行卡，继续提现', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_70)),
              SizedBox(height: 20),
              step == 1 ? _stepOne() : _stepTwo(),
              SizedBox(height: 50),
              RadiusButton('下一步', width: 1080, height: 186, onTap: (){
                setState(() {
                  step = 2;
                });
              },)
            ],
          ),
        )
    );
  }


  Widget _stepOne() {
    return  Container(
      height: ScreenUtil().setWidth(186),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.RADIUS_20),
          color: AppColors.COLOR_GRAY_EFEFEF
      ),
      child: RowTextField(
        key: GlobalKey(),
        controller: TextEditingController(),
        labelText: '点击输入银行卡号',
        contentPaddingTop: 15,
        contentPaddingLeft: 30,
        contentPaddingRight: 30,
        labelLeft: 30,
        labelTop: 21,
        height: 80,
        showBorder: false,
      ),
    );
  }

  Widget _stepTwo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Row(
              children: [
                Image.asset(AppImages.CARD_LOGO_1,width: ScreenUtil().setWidth(60),  height: ScreenUtil().setWidth(60)),
                Text('招商银行储蓄卡', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_40))
              ],
            )
          ],
        ),
        SizedBox(height: 20),
        _stepOne(),
        SizedBox(height: 20),
        Text('银行预留手机号', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_40)),
        SizedBox(height: 20),
        _stepOne()
      ],
    );
  }
}
