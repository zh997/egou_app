import 'package:egou_app/common/routes.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_enums.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_space.dart';
import 'package:egou_app/widgets/app_buttons.dart';
import 'package:egou_app/widgets/small_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class MyPage extends StatelessWidget {
  final MyLogic logic = Get.put(MyLogic());
  final MyState state = Get.find<MyLogic>().state;

  void _onRedirectOrder (){
    Get.toNamed(RouteConfig.my_order);
  }

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
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          Get.toNamed(RouteConfig.balance_page + '?type=' + balanceType.balance.toString());
                        },
                        child: Column(
                          children: [
                            Text('余额', style: TextStyle(
                                fontSize: AppFontsize.SIZE_36,
                                color: AppColors.COLOR_GRAY_B7B7B7
                            )),
                            SizedBox(height: 10,),
                            Price(color: AppColors.COLOR_BLACK_000000)
                          ],
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          Get.toNamed(RouteConfig.balance_page + '?type=' + balanceType.goldcoin.toString());
                        },
                        child: Column(
                          children: [
                            Text('金币', style: TextStyle(
                                fontSize: AppFontsize.SIZE_36,
                                color: AppColors.COLOR_GRAY_B7B7B7
                            )),
                            SizedBox(height: 10,),
                            Price(color: AppColors.COLOR_BLACK_000000)
                          ],
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          Get.toNamed(RouteConfig.balance_page + '?type=' + balanceType.silvercoin.toString());
                        },
                        child: Column(
                          children: [
                            Text('银币', style: TextStyle(
                                fontSize: AppFontsize.SIZE_36,
                                color: AppColors.COLOR_GRAY_B7B7B7
                            )),
                            SizedBox(height: 10,),
                            Price(color: AppColors.COLOR_BLACK_000000)
                          ],
                        ),
                      ),
                    ],
                  )),
                  // GestureDetector(
                  //   onTap:(){
                  //     Get.toNamed(RouteConfig.share_page);
                  //   },
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       // boxShadow: [BoxShadow(color: AppColors.COLOR_GRAY_B7B7B7, blurRadius:1, spreadRadius: 0)]
                  //     ),
                  //     child: Image.asset(AppImages.SHARE_BANNER, width: ScreenUtil().setWidth(1087),height: ScreenUtil().setWidth(298),),
                  //   ),
                  // ),
                  // Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 0), child: RadiusButton('我的订单', width: 987, onTap: () {
                  //   Get.toNamed(RouteConfig.my_order);
                  // })),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: AppSpace.SPACE_52),
              height: ScreenUtil().setWidth(850),
              alignment: Alignment.center,
              color: Colors.white,
              child: GridView(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15
                ),
                children: [
                  InkWell(
                    onTap: (){
                      Get.toNamed(RouteConfig.my_team);
                    },
                    child: Column(
                      children: [
                        Image.asset(AppImages.ICON_13, width: ScreenUtil().setWidth(101),height:  ScreenUtil().setWidth(101)),
                        SizedBox(height: AppSpace.SPACE_35),
                        Text('我的团队', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_44))
                      ],
                    )
                  ),
                  InkWell(
                      onTap: (){
                        Get.toNamed(RouteConfig.share_page);
                      },
                      child:Column(
                        children: [
                          Image.asset(AppImages.ICON_14, width: ScreenUtil().setWidth(101),height:  ScreenUtil().setWidth(101)),
                          SizedBox(height: AppSpace.SPACE_35),
                          Text('邀请好友', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_44))
                        ],
                      ),
                  ),

                  InkWell(
                    onTap: (){
                      Get.toNamed(RouteConfig.my_store);
                    },
                    child:Column(
                      children: [
                        Image.asset(AppImages.ICON_15, width: ScreenUtil().setWidth(101),height:  ScreenUtil().setWidth(101)),
                        SizedBox(height: AppSpace.SPACE_35),
                        Text('我的收藏', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_44))
                      ],
                    ),
                  ),
                  // InkWell(
                  //   onTap: (){
                  //     Get.toNamed(RouteConfig.my_shop);
                  //   },
                  //   child:Column(
                  //     children: [
                  //       Image.asset(AppImages.ICON_16, width: ScreenUtil().setWidth(101),height:  ScreenUtil().setWidth(101)),
                  //       SizedBox(height: AppSpace.SPACE_35),
                  //       Text('我的店铺', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_44))
                  //     ],
                  //   ),
                  // ),
                  InkWell(
                    onTap: (){
                      Get.toNamed(RouteConfig.about_us);
                    },
                    child:Column(
                      children: [
                        Image.asset(AppImages.ICON_17, width: ScreenUtil().setWidth(101),height:  ScreenUtil().setWidth(101)),
                        SizedBox(height: AppSpace.SPACE_35),
                        Text('关于我们', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_44))
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Get.toNamed(RouteConfig.address_page);
                    },
                    child:Column(
                      children: [
                        Image.asset(AppImages.ICON_18, width: ScreenUtil().setWidth(101),height:  ScreenUtil().setWidth(101)),
                        SizedBox(height: AppSpace.SPACE_35),
                        Text('地址管理', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_44))
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Get.toNamed(RouteConfig.concat_us);
                    },
                    child:Column(
                      children: [
                        Image.asset(AppImages.ICON_19, width: ScreenUtil().setWidth(101),height:  ScreenUtil().setWidth(101)),
                        SizedBox(height: AppSpace.SPACE_35),
                        Text('联系我们', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_44))
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Get.toNamed(RouteConfig.setting_center);
                    },
                    child:Column(
                      children: [
                        Image.asset(AppImages.ICON_20, width: ScreenUtil().setWidth(101),height:  ScreenUtil().setWidth(101)),
                        SizedBox(height: AppSpace.SPACE_35),
                        Text('设置中心', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_44))
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Get.toNamed(RouteConfig.my_order);
                    },
                    child:Column(
                      children: [
                        Image.asset(AppImages.ORDER_ICON, width: ScreenUtil().setWidth(101),height:  ScreenUtil().setWidth(101)),
                        SizedBox(height: AppSpace.SPACE_35),
                        Text('我的订单', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_44))
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Get.toNamed(RouteConfig.bank_card_list);
                    },
                    child:Column(
                      children: [
                        Image.asset(AppImages.QRCODE_ICON, width: ScreenUtil().setWidth(101),height:  ScreenUtil().setWidth(101)),
                        SizedBox(height: AppSpace.SPACE_35),
                        Text('绑定收款码', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_44))
                      ],
                    ),
                  ),
                ]),
            ),
            SizedBox(height: 20),
            // GestureDetector(
            //   behavior: HitTestBehavior.opaque,
            //   onTap: () {
            //     Get.toNamed(RouteConfig.bank_card_list);
            //   },
            //   child: Container(
            //     color: Colors.white,
            //     padding: EdgeInsets.all(20),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Text('绑定银行卡/微信号/付宝账号', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
            //         Image.asset(AppImages.ARROW_RIGHT_ICON, width: 8, height: 18)
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }


  Widget _orderEntryItem(icon, text) {
    return GestureDetector(
      onTap: _onRedirectOrder,
      child: Column(
        children: [
          Image.asset(icon, width: ScreenUtil().setWidth(81),height:  ScreenUtil().setWidth(81)),
          SizedBox(height: AppSpace.SPACE_35),
          Text(text, style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_44))
        ],
      ),
    );
  }
}
