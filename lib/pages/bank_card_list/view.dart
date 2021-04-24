import 'package:egou_app/common/routes.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_radius.dart';
import 'package:egou_app/constant/app_space.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class BankCardListPage extends StatelessWidget {
  final BankCardListLogic logic = Get.put(BankCardListLogic());
  final BankCardListState state = Get.find<BankCardListLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),
        title: '绑定银行卡',
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: [
          _CardItem(AppImages.CARD_QRCODE, '微信号', 'YYANGLJKE236', showQrcode: true, onTap: () {
            Get.toNamed(RouteConfig.make_qrcode);
          }),
          _CardItem(AppImages.CARD_LOGO_4, '支付宝账号', '135****8966', showQrcode: true, onTap: () {
            Get.toNamed(RouteConfig.make_qrcode);
          }),
          _CardItem(AppImages.CARD_LOGO_1, '工商银行', '**** **** **** 5025', cardType: '储蓄卡'),
          _CardItem(AppImages.CARD_LOGO_2, '招商银行', '**** **** **** 8092', cardType: '储蓄卡'),
          _AddCardBtn(),
        ],
      ),
    );
  }


  Widget _CardItem(String icon, String title,String subtitle, { bool showQrcode = false, String cardType, Function onTap }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap != null ? onTap : (){},
      child: Container(
        padding: EdgeInsets.all(AppSpace.SPACE_50),
        margin: EdgeInsets.only(bottom: AppSpace.SPACE_50),
        height: ScreenUtil().setWidth(344),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppRadius.RADIUS_30),
          boxShadow: [BoxShadow(color: AppColors.COLOR_GRAY_E7E8E8, blurRadius: 10.0, spreadRadius: 0)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(icon, width: ScreenUtil().setWidth(150), height: ScreenUtil().setWidth(150)),
                SizedBox(width: 20,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(title, style: TextStyle(color: Colors.black, fontSize: AppFontsize.SIZE_50)),
                        SizedBox(width: 20,),
                        cardType != null ? Text(cardType, style: TextStyle(color:AppColors.COLOR_GRAY_9E9E9E, fontSize: AppFontsize.SIZE_42)) : SizedBox()
                      ],
                    ),
                    SizedBox(height: 15),
                    Text(subtitle, style: TextStyle(color: Colors.black, fontSize: AppFontsize.SIZE_56)),
                  ],
                )
              ],
            ),
            showQrcode ? Row(
              children: [
                Image.asset(AppImages.CARD_QRCODE, width: ScreenUtil().setWidth(150), height: ScreenUtil().setWidth(150)),
                Icon(Icons.keyboard_arrow_right_sharp, size: 30, color: AppColors.COLOR_GRAY_999999)
              ],
            ) : SizedBox()
          ],
        ),
      ),
    );
  }


  Widget _AddCardBtn() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Get.toNamed(RouteConfig.bind_card);
      },
      child:Container(
        padding: EdgeInsets.all(AppSpace.SPACE_50),
        margin: EdgeInsets.only(bottom: AppSpace.SPACE_50),
        height: ScreenUtil().setWidth(200),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppRadius.RADIUS_30),
          boxShadow: [BoxShadow(color: AppColors.COLOR_GRAY_E7E8E8, blurRadius: 10.0, spreadRadius: 0)],
        ),
        child: Row(
          children: [
            Image.asset(AppImages.ADD_CARD_ICON, width: ScreenUtil().setWidth(56), height: ScreenUtil().setWidth(56),),
            SizedBox(width: 20,),
            Text('添加银行卡', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_40)),
          ],
        ),
      ) ,
    );
  }
}
