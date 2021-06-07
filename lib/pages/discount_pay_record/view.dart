import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_radius.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class DiscountPayRecordPage extends StatelessWidget {
  final DiscountPayRecordLogic logic = Get.put(DiscountPayRecordLogic());
  final DiscountPayRecordState state = Get.find<DiscountPayRecordLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),
        title: '买单记录'
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 15,),),
            SliverList(delegate: SliverChildBuilderDelegate((BuildContext context, int index){
              return _RecordItem();
            }, childCount: 10)),
            SliverToBoxAdapter(child: SizedBox(height: 15,),),
          ],
        ),
      ),
    );
  }

  Widget _RecordItem() {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.only(bottom: 20, top: 20),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColors.COLOR_GRAY_F5F5F5, width: ScreenUtil().setWidth(1)))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: ScreenUtil().setWidth(120),
              height: ScreenUtil().setWidth(120),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular( ScreenUtil().setWidth(120))
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.asset(AppImages.APP_LOGO, fit: BoxFit.cover),
            ),
            SizedBox(width: 20,),
            Expanded(child: Container(
              height: ScreenUtil().setWidth(120),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('口腔医疗店铺', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
                      Text('- 80.00', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_56, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('2021-06-20 16:03', style: TextStyle(color: AppColors.COLOR_GRAY_A5A3B0, fontSize: AppFontsize.SIZE_40)),
                      Row(
                        children: [
                          Text('获得', style: TextStyle(color: AppColors.COLOR_GRAY_A5A3B0, fontSize: AppFontsize.SIZE_40)),
                          Text('5.00', style: TextStyle(color: AppColors.COLOR_PRIMARY_D22315, fontSize: AppFontsize.SIZE_40)),
                          Text('金马', style: TextStyle(color: AppColors.COLOR_GRAY_A5A3B0, fontSize: AppFontsize.SIZE_40)),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
