import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_space.dart';
import 'package:egou_app/models/shop_entry_list.dart';
import 'package:egou_app/pages/shop/logic.dart';
import 'package:egou_app/pages/shop/state.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class ShopDetailPage extends StatelessWidget {
  final ShopDetailLogic logic = Get.put(ShopDetailLogic());
  final ShopState mainState = Get.find<ShopLogic>().state;
  final ShopDetailState state = Get.find<ShopDetailLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final ShopEntryListModel selectShop = mainState.selectedShop.value;
      return Scaffold(
        appBar: CustomAppBar(title: selectShop.name, leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333)),
        body: SafeArea(
            child: SingleChildScrollView(
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
                            Text('????????????', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48))
                          ],
                        ),
                        SizedBox(height: AppSpace.SPACE_50),
                        Column(
                          children: List.generate(selectShop.shopPhotoList.length, (index) =>  Container(
                            width: ScreenUtil().setWidth(1044),
                            height: ScreenUtil().setWidth(460),
                            margin: EdgeInsets.only(bottom: 10),
                            child: Image.network(selectShop.shopPhotoList[index], fit:BoxFit.cover),
                          )),
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
                            Text('????????????', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48))
                          ],
                        ),
                        SizedBox(height: AppSpace.SPACE_50),
                        Text(selectShop.businessContent, style: TextStyle(
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
                            Text('??????', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48))
                          ],
                        ),
                        SizedBox(height: AppSpace.SPACE_50),
                        Text(selectShop.address, style: TextStyle(
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
                            Text('????????????', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48))
                          ],
                        ),
                        Text(selectShop.phone, style: TextStyle(
                            fontSize: AppFontsize.SIZE_48, color: AppColors.COLOR_BLACK_333333
                        ),textAlign: TextAlign.left)
                      ],
                    ),
                  )
                ],
              ),
            )
        ),
      );
    });
  }
}
