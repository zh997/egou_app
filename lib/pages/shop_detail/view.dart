import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_space.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class ShopDetailPage extends StatelessWidget {
  final ShopDetailLogic logic = Get.put(ShopDetailLogic());
  final ShopDetailState state = Get.find<ShopDetailLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '商家真牛网络', leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(AppSpace.SPACE_50),
              color: Colors.white,
              margin: EdgeInsets.only(top: AppSpace.SPACE_35),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(width: ScreenUtil().setWidth(10), height: ScreenUtil().setWidth(66),
                          decoration: BoxDecoration(
                           color: AppColors.COLOR_PRIMARY_D22315,
                           borderRadius: BorderRadius.circular(2)
                          ),
                          margin: EdgeInsets.only(right: 5),
                      ),
                      Text('商家照片', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48))
                    ],
                  ),
                  SizedBox(height: AppSpace.SPACE_50),
                  Container(
                    width: ScreenUtil().setWidth(1044),
                    height: ScreenUtil().setWidth(460),
                    child: Image.network(AppImages.SHOP_IMG, fit:BoxFit.cover),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(AppSpace.SPACE_50),
              margin: EdgeInsets.only(top: AppSpace.SPACE_35),
              decoration: BoxDecoration(
                  color: Colors.white,
                border: Border(bottom: BorderSide(
                  width: 1,
                  color: AppColors.COLOR_GRAY_F7F7F7
                ))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(width: ScreenUtil().setWidth(10), height: ScreenUtil().setWidth(66),
                        decoration: BoxDecoration(
                            color: AppColors.COLOR_PRIMARY_D22315,
                            borderRadius: BorderRadius.circular(2)
                        ),
                        margin: EdgeInsets.only(right: 5),
                      ),
                      Text('商家介绍', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48))
                    ],
                  ),
                  SizedBox(height: AppSpace.SPACE_50),
                  Text('真牛网络科技是一家经营内容经营内容经营内容经营内容经营内容经营内容经营内容经营内容经营内容', style: TextStyle(
                    fontSize: AppFontsize.SIZE_48, color: AppColors.COLOR_BLACK_333333,
                  ), textAlign: TextAlign.left)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(AppSpace.SPACE_50),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(bottom: BorderSide(
                      width: 1,
                      color: AppColors.COLOR_GRAY_F7F7F7
                  ))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(width: ScreenUtil().setWidth(10), height: ScreenUtil().setWidth(66),
                        decoration: BoxDecoration(
                            color: AppColors.COLOR_PRIMARY_D22315,
                            borderRadius: BorderRadius.circular(2)
                        ),
                        margin: EdgeInsets.only(right: 5),
                      ),
                      Text('地址', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48))
                    ],
                  ),
                  SizedBox(height: AppSpace.SPACE_50),
                  Text('广东省深圳市南山区南头街道1号204', style: TextStyle(
                      fontSize: AppFontsize.SIZE_48, color: AppColors.COLOR_BLACK_333333
                  ),textAlign: TextAlign.left)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(AppSpace.SPACE_50),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(bottom: BorderSide(
                      width: 1,
                      color: AppColors.COLOR_GRAY_F7F7F7
                  ))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(width: ScreenUtil().setWidth(10), height: ScreenUtil().setWidth(66),
                        decoration: BoxDecoration(
                            color: AppColors.COLOR_PRIMARY_D22315,
                            borderRadius: BorderRadius.circular(2)
                        ),
                        margin: EdgeInsets.only(right: 5),
                      ),
                      Text('联系方式', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48))
                    ],
                  ),
                  Text('0579-88888888', style: TextStyle(
                      fontSize: AppFontsize.SIZE_48, color: AppColors.COLOR_BLACK_333333
                  ),textAlign: TextAlign.left)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
