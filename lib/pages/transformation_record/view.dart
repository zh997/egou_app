import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_radius.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class TransformationRecordPage extends StatelessWidget {
  final TransformationRecordLogic logic = Get.put(TransformationRecordLogic());
  final TransformationRecordState state = Get.find<TransformationRecordLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),
        title: '互转记录',
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
      height: ScreenUtil().setWidth(594),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.RADIUS_16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              SizedBox(width: 100, child: Text('转账种类', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize:AppFontsize.SIZE_46)),),
              Text('余额', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize:AppFontsize.SIZE_46))
            ],
          ),
          Row(
            children: [
              SizedBox(width: 100, child: Text('转账数量', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize:AppFontsize.SIZE_46)),) ,
              Text('2000.00', style: TextStyle(color: AppColors.COLOR_PRIMARY_D22315, fontSize:AppFontsize.SIZE_46))
            ],
          ),
          Row(
            children: [
              SizedBox(width: 100, child: Text('转账手机号', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize:AppFontsize.SIZE_46)),),
              Text('17620356332', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize:AppFontsize.SIZE_46))
            ],
          ),
          Row(
            children: [
              SizedBox(width: 100, child: Text('手续费', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize:AppFontsize.SIZE_46)),),
              Text('0.00', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize:AppFontsize.SIZE_46))
            ],
          ),
          Row(
            children: [
              SizedBox(width: 100, child: Text('转账时间', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize:AppFontsize.SIZE_46)),),
              Text('2021-06-06 12:00:00', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize:AppFontsize.SIZE_46))
            ],
          ),
        ],
      ),
    );
  }
}
