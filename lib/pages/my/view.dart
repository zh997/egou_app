import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_space.dart';
import 'package:egou_app/widgets/small_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class MyPage extends StatelessWidget {
  final MyLogic logic = Get.put(MyLogic());
  final MyState state = Get.find<MyLogic>().state;

  @override
  Widget build(BuildContext context) {
    final _statusBarHeght = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(AppSpace.SPACE_52, _statusBarHeght+AppSpace.SPACE_52, AppSpace.SPACE_52, AppSpace.SPACE_52),
              color: Colors.white,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: ScreenUtil().setWidth(182),
                        height: ScreenUtil().setWidth(182),
                        margin: EdgeInsets.only(right: 10),
                        child: Image.asset(AppImages.APP_LOGO, fit: BoxFit.cover),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('18288888888', style: TextStyle(
                                fontSize: AppFontsize.SIZE_56,
                                color: AppColors.COLOR_BLACK_000000
                              )),
                              Container(
                                padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                                margin: EdgeInsets.only(left: 10),
                                decoration: BoxDecoration(
                                  color: AppColors.COLOR_6AB354,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Text('市场主任', style: TextStyle(
                                  fontSize: AppFontsize.SIZE_36,
                                  color: Colors.white
                                )),
                              )
                            ],
                          ),
                          SizedBox(height: AppSpace.SPACE_40),
                          Text('UID:8563', style: TextStyle(
                              fontSize: AppFontsize.SIZE_36,
                              color: AppColors.COLOR_BLACK_000000
                          ))
                        ],
                      )
                    ],
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(0, AppSpace.SPACE_64, 0, AppSpace.SPACE_24), child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text('余额', style: TextStyle(
                              fontSize: AppFontsize.SIZE_36,
                              color: AppColors.COLOR_GRAY_B7B7B7
                          )),
                          Price(color: AppColors.COLOR_BLACK_000000)
                        ],
                      ),
                      Column(
                        children: [
                          Text('余额', style: TextStyle(
                              fontSize: AppFontsize.SIZE_36,
                              color: AppColors.COLOR_GRAY_B7B7B7
                          )),
                          Price(color: AppColors.COLOR_BLACK_000000)
                        ],
                      ),
                      Column(
                        children: [
                          Text('余额', style: TextStyle(
                              fontSize: AppFontsize.SIZE_36,
                              color: AppColors.COLOR_GRAY_B7B7B7
                          )),
                          Price(color: AppColors.COLOR_BLACK_000000)
                        ],
                      )
                    ],
                  )),
                  GestureDetector(
                    child: Container(
                      decoration: BoxDecoration(
                        // boxShadow: [BoxShadow(color: AppColors.COLOR_GRAY_B7B7B7, blurRadius:1, spreadRadius: 0)]
                      ),
                      child: Image.asset(AppImages.SHARE_BANNER, width: ScreenUtil().setWidth(1087),height: ScreenUtil().setWidth(298),),
                    ),
                  ),
                  Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 20), child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('我的订单', style: TextStyle(fontSize: AppFontsize.SIZE_56, color: AppColors.COLOR_BLACK_000000)),
                      Row(
                        children: [
                          Padding(padding: EdgeInsets.only(right: 5), child: Text('全部订单',style: TextStyle(
                              fontSize: AppFontsize.SIZE_36,
                              color: AppColors.COLOR_GRAY_999999
                          )),),
                          Image.asset(AppImages.ARROW_RIGHT_ICON, width: ScreenUtil().setWidth(20), height: ScreenUtil().setWidth(32))
                        ],
                      )
                    ],
                  )),
                  Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 0), child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Image.asset(AppImages.ICON_9, width: ScreenUtil().setWidth(81),height:  ScreenUtil().setWidth(81)),
                          SizedBox(height: AppSpace.SPACE_35),
                          Text('待付款', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_44))
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(AppImages.ICON_10, width: ScreenUtil().setWidth(81),height:  ScreenUtil().setWidth(81)),
                          SizedBox(height: AppSpace.SPACE_35),
                          Text('待收货', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_44))
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(AppImages.ICON_11, width: ScreenUtil().setWidth(81),height:  ScreenUtil().setWidth(81)),
                          SizedBox(height: AppSpace.SPACE_35),
                          Text('待评价', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_44))
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset(AppImages.ICON_12, width: ScreenUtil().setWidth(81),height:  ScreenUtil().setWidth(81)),
                          SizedBox(height: AppSpace.SPACE_35),
                          Text('待退货', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_44))
                        ],
                      ),
                    ],
                  ))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: AppSpace.SPACE_52),
              height: ScreenUtil().setWidth(598),
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: GridView(
                  physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                    ),
                  children: [
                  Column(
                    children: [
                      Image.asset(AppImages.ICON_13, width: ScreenUtil().setWidth(101),height:  ScreenUtil().setWidth(101)),
                      SizedBox(height: AppSpace.SPACE_35),
                      Text('我的团队', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_44))
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(AppImages.ICON_14, width: ScreenUtil().setWidth(101),height:  ScreenUtil().setWidth(101)),
                      SizedBox(height: AppSpace.SPACE_35),
                      Text('邀请好友', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_44))
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(AppImages.ICON_15, width: ScreenUtil().setWidth(101),height:  ScreenUtil().setWidth(101)),
                      SizedBox(height: AppSpace.SPACE_35),
                      Text('我的收藏', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_44))
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(AppImages.ICON_16, width: ScreenUtil().setWidth(101),height:  ScreenUtil().setWidth(101)),
                      SizedBox(height: AppSpace.SPACE_35),
                      Text('我的店铺', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_44))
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(AppImages.ICON_17, width: ScreenUtil().setWidth(101),height:  ScreenUtil().setWidth(101)),
                      SizedBox(height: AppSpace.SPACE_35),
                      Text('关于我们', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_44))
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(AppImages.ICON_18, width: ScreenUtil().setWidth(101),height:  ScreenUtil().setWidth(101)),
                      SizedBox(height: AppSpace.SPACE_35),
                      Text('地址管理', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_44))
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(AppImages.ICON_19, width: ScreenUtil().setWidth(101),height:  ScreenUtil().setWidth(101)),
                      SizedBox(height: AppSpace.SPACE_35),
                      Text('联系我们', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_44))
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset(AppImages.ICON_20, width: ScreenUtil().setWidth(101),height:  ScreenUtil().setWidth(101)),
                      SizedBox(height: AppSpace.SPACE_35),
                      Text('设置中心', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_44))
                    ],
                  ),
                ],)
              ),
            )
          ],
        ),
      ),
    );
  }
}
