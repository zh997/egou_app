import 'package:egou_app/common/routes.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_radius.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/app_buttons.dart';
import 'package:egou_app/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class PublishCommentsPage extends StatelessWidget {
  final PublishCommentsLogic logic = Get.put(PublishCommentsLogic());
  final PublishCommentsState state = Get.find<PublishCommentsLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title: '发表评论'),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 15),
            Container(
              color:  Colors.white,
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: ScreenUtil().setWidth(150),
                        height: ScreenUtil().setWidth(150),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.COLOR_GRAY_F6F6F6, width: 2)
                        ),
                        child: Image.network(AppImages.GOODS_IMG_1, fit: BoxFit.cover),
                        clipBehavior: Clip.hardEdge,
                      ),
                      SizedBox(width: 15),
                      Column(
                        children: [
                          Text(' GUCCI', style: TextStyle(fontSize: AppFontsize.SIZE_48, color: AppColors.COLOR_BLACK_222222)),
                          SizedBox(height: 5),
                          Container(
                            padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                            decoration: BoxDecoration(
                                color: AppColors.COLOR_GRAY_F6F6F6,
                                borderRadius: BorderRadius.circular(AppRadius.RADIUS_11)
                            ),
                            child: Text(' 英码4', style: TextStyle(fontSize: AppFontsize.SIZE_46, color: AppColors.COLOR_GRAY_999999)),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('描述相符', style: TextStyle(fontSize: AppFontsize.SIZE_48, color: AppColors.COLOR_BLACK_333333)),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Image.asset(AppImages.COMMENT_ICON_31, width: ScreenUtil().setWidth(80), height: ScreenUtil().setWidth(80)),
                                SizedBox(width: 5),
                                Text('好评', style: TextStyle(fontSize: AppFontsize.SIZE_48, color: AppColors.COLOR_BLACK_333333))
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                Image.asset(AppImages.COMMENT_ICON_21, width: ScreenUtil().setWidth(80), height: ScreenUtil().setWidth(80)),
                                SizedBox(width: 5),
                                Text('中评', style: TextStyle(fontSize: AppFontsize.SIZE_48, color: AppColors.COLOR_BLACK_333333))
                              ],
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Image.asset(AppImages.COMMENT_ICON_11, width: ScreenUtil().setWidth(80), height: ScreenUtil().setWidth(80)),
                                  SizedBox(width: 5),
                                  Text('差评', style: TextStyle(fontSize: AppFontsize.SIZE_48, color: AppColors.COLOR_BLACK_333333))
                                ],
                              )
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 15,),
                  Container(
                    height: ScreenUtil().setWidth(460),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppRadius.RADIUS_20),
                        color: AppColors.COLOR_GRAY_EFEFEF
                    ),
                    child: RowTextField(
                      key: GlobalKey(),
                      controller: TextEditingController(),
                      labelText: '请输入评价',
                      contentPaddingTop: 15,
                      contentPaddingLeft: 30,
                      contentPaddingRight: 30,
                      labelLeft: 30,
                      labelTop: 21,
                      maxLines: 5,
                      height: 80,
                      showBorder: false,
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    width: ScreenUtil().setWidth(322),
                    height: ScreenUtil().setWidth(322),
                    decoration: BoxDecoration(
                        color: AppColors.COLOR_GRAY_F6F6F6,
                        borderRadius: BorderRadius.circular(AppRadius.RADIUS_16)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        SizedBox(height: 10),
                        Text('添加照片', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_52))
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('物流服务', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
                      SizedBox(width: 50),
                      Row(
                        children: [
                          Image.asset(AppImages.STAR_ICON, width: ScreenUtil().setWidth(72), height: ScreenUtil().setWidth(72)),
                          SizedBox(width: 10),
                          Image.asset(AppImages.STAR_ICON, width: ScreenUtil().setWidth(72), height: ScreenUtil().setWidth(72)),
                          SizedBox(width: 10),
                          Image.asset(AppImages.STAR_ICON, width: ScreenUtil().setWidth(72), height: ScreenUtil().setWidth(72)),
                          SizedBox(width: 10),
                          Image.asset(AppImages.STAR_ICON, width: ScreenUtil().setWidth(72), height: ScreenUtil().setWidth(72)),
                          SizedBox(width: 10),
                          Image.asset(AppImages.STAR_ICON, width: ScreenUtil().setWidth(72), height: ScreenUtil().setWidth(72))
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Divider(height: 1, color: AppColors.COLOR_GRAY_F8F8F8),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('商家服务', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
                      SizedBox(width: 50),
                      Row(
                        children: [
                          Image.asset(AppImages.STAR_ICON, width: ScreenUtil().setWidth(72), height: ScreenUtil().setWidth(72)),
                          SizedBox(width: 10),
                          Image.asset(AppImages.STAR_ICON, width: ScreenUtil().setWidth(72), height: ScreenUtil().setWidth(72)),
                          SizedBox(width: 10),
                          Image.asset(AppImages.STAR_ICON, width: ScreenUtil().setWidth(72), height: ScreenUtil().setWidth(72)),
                          SizedBox(width: 10),
                          Image.asset(AppImages.STAR_ICON, width: ScreenUtil().setWidth(72), height: ScreenUtil().setWidth(72)),
                          SizedBox(width: 10),
                          Image.asset(AppImages.STAR_ICON, width: ScreenUtil().setWidth(72), height: ScreenUtil().setWidth(72))
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.all(15),
              color: Colors.white,
              child: Row(
                children: [
                  Image.asset(AppImages.ICON_5, width: ScreenUtil().setWidth(52),height: ScreenUtil().setWidth(52)),
                  SizedBox(width: 5),
                  Text('匿名评价', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48))
                ],
              ),
            ),
            SizedBox(height: 15),
            Container(
                height: ScreenUtil().setWidth(200),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(top: BorderSide(width: 1, color: AppColors.COLOR_GRAY_DDDDDD))
                ),
                child: RadiusButton('提交', onTap: (){
                  Get.toNamed(RouteConfig.pay_result);
                })
            )
          ],
        ),
      ),
    );
  }
}
