import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/app_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class MakeQrcodePage extends StatelessWidget {
  final MakeQrcodeLogic logic = Get.put(MakeQrcodeLogic());
  final MakeQrcodeState state = Get.find<MakeQrcodeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),
        title: '编辑微信号',
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('微信号', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
                SizedBox(height: 20,),
                Text('YYANGLJKE236', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
                SizedBox(height: 30,),
                Divider(color: AppColors.COLOR_GRAY_F4F4F4, height: 1,),
                SizedBox(height: 30,),
                Text('微信收款码', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
                SizedBox(height: 30,),
                Container(
                  width: ScreenUtil().setWidth(307),
                  height:  ScreenUtil().setWidth(307),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(AppImages.CARD_QRCODE,  fit:BoxFit.cover),
                      Container(color: Color(0x7F000000),width: ScreenUtil().setWidth(307),
                        height:  ScreenUtil().setWidth(307),),
                      Image.asset(AppImages.CAMARA_ICON,  width: 60, height:60,),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 30,),
          Padding(padding: EdgeInsets.all(20), child: RadiusButton('保存', width: 700,))
        ],
      ),
    );
  }
}
