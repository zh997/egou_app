import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_radius.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class WithDrawalRecordPage extends StatelessWidget {
  final WithDrawalRecordLogic logic = Get.put(WithDrawalRecordLogic());
  final WithDrawalRecordState state = Get.find<WithDrawalRecordLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),
        title: '提现记录',
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: List.generate(20, (index) =>  _RecordItem(),),
      ),
    );
  }

  Widget _RecordItem() {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 15),
      height: ScreenUtil().setWidth(353),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.RADIUS_16),
      ),
      child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceAround,
         children: [
           Row(
             children: [
               SizedBox(width: 100, child: Text('到账银行卡', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize:AppFontsize.SIZE_46)),),
               Text('2536 5566 6689 66321', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize:AppFontsize.SIZE_46))
             ],
           ),
           Row(
             children: [
               SizedBox(width: 100, child: Text('提现金额', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize:AppFontsize.SIZE_46)),) ,
               Text('0.03', style: TextStyle(color: AppColors.COLOR_PRIMARY_D22315, fontSize:AppFontsize.SIZE_46))
             ],
           ),
           Row(
             children: [
               SizedBox(width: 100, child: Text('提现时间', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize:AppFontsize.SIZE_46))),
               Text('2021-04-03 15:03:03', style: TextStyle(color: AppColors.COLOR_PRIMARY_D22315, fontSize:AppFontsize.SIZE_46))
             ],
           )
         ],
      ),
    );
  }
}
