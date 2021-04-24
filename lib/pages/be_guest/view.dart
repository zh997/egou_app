import 'package:egou_app/common/routes.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_radius.dart';
import 'package:egou_app/constant/app_space.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/app_buttons.dart';
import 'package:egou_app/widgets/small_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class BeGuestPage extends StatelessWidget {
  final BeGuestLogic logic = Get.put(BeGuestLogic());
  final BeGuestState state = Get.find<BeGuestLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title: '成为创客'),
      body: ListView(
          children: [
            Stack(
              children: [
                Container(
                    color: Colors.blue,
                    child: Image.asset(AppImages.BE_GUEST_BG, fit: BoxFit.fill)
                ),
                Positioned(
                  top: ScreenUtil().setWidth(1056),
                  left: ScreenUtil().setWidth(125),
                  child: Container(
                      // padding: EdgeInsets.all(20),
                      width: ScreenUtil().setWidth(891),
                      height: ScreenUtil().setWidth(566),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(AppRadius.RADIUS_20)
                      ),
                      child: Column(
                        children: [
                          Transform.translate(offset: Offset(0, -ScreenUtil().setWidth(20)),child:
                          Container(
                            width: ScreenUtil().setWidth(465),
                            height: ScreenUtil().setWidth(93),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(AppImages.BE_GUEST_TITLE_BG),
                                )
                            ),
                            child: Text('礼包', style: TextStyle(color: Colors.white, fontSize: AppFontsize.SIZE_48)),
                          ),),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(AppImages.GIFT_1, width: ScreenUtil().setWidth(284), height: ScreenUtil().setWidth(270),),
                              Image.asset(AppImages.GIFT_2,  width: ScreenUtil().setWidth(251), height: ScreenUtil().setWidth(326),),
                              Image.asset(AppImages.GIFT_3,  width: ScreenUtil().setWidth(230), height: ScreenUtil().setWidth(130),),
                            ],
                          ),
                        ],
                      ),
                  )
                ),
                Positioned(
                    top: ScreenUtil().setWidth(1753),
                    left: ScreenUtil().setWidth(279),
                    child: Column(
                      children: [
                        Text('市值价格：736+790+3280=4806元', style: TextStyle(color: Colors.white, fontSize: AppFontsize.SIZE_41)),
                        Text('创客即付款1688元，成为创业者', style: TextStyle(color: Colors.white, fontSize: AppFontsize.SIZE_41)),
                      ],
                    )
                ),

              ],
            ),
            Container(
                height: ScreenUtil().setWidth(250),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(top: BorderSide(width: 1, color: AppColors.COLOR_GRAY_DDDDDD))
                ),
                child: RadiusButton('购买礼包', width: 903, height: 156, onTap: (){Get.toNamed(RouteConfig.pay_result);})
            )
          ]
      )
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title: '成为创客'),
  //     body: SafeArea(
  //       child: Column(
  //         children: [
  //           Expanded(child: ListView(
  //             children: [
  //               DetailSwiper(state.BannerList.value),
  //               Container(
  //                 color: Colors.white,
  //                 padding: EdgeInsets.all(AppSpace.SPACE_52),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text('礼包', style: TextStyle(
  //                         fontSize: AppFontsize.SIZE_48, color: AppColors.COLOR_BLACK_333333,
  //                         fontWeight: FontWeight.bold
  //                     )),
  //                     SizedBox(height:15),
  //                     Row(
  //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                       children: [
  //                         Price(),
  //                         Text('已售: 208', style: TextStyle(
  //                             fontSize: AppFontsize.SIZE_41,
  //                             color: AppColors.COLOR_BLACK_333333
  //                         ))
  //                       ],
  //                     )
  //                   ],
  //                 ),
  //               ),
  //               _goodsTab()
  //             ],
  //           )),
  //           Container(
  //               height: ScreenUtil().setWidth(250),
  //               alignment: Alignment.center,
  //               decoration: BoxDecoration(
  //                   color: Colors.white,
  //                   border: Border(top: BorderSide(width: 1, color: AppColors.COLOR_GRAY_DDDDDD))
  //               ),
  //               child: RadiusButton('购买礼包', onTap: (){Get.toNamed(RouteConfig.pay_result);})
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }


  Widget _goodsTab() {
    return Container(
      margin: EdgeInsets.only(top: AppSpace.SPACE_35),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(width: 1, color: AppColors.COLOR_GRAY_EAEAEA))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                  children: [
                    Text('礼包介绍', style: TextStyle(
                        fontSize: AppFontsize.SIZE_54,
                        color: AppColors.COLOR_BLACK_222222
                    )),
                    SizedBox(height: 10),
                    Container(
                      width: ScreenUtil().setWidth(102),
                      height: ScreenUtil().setWidth(10),
                      decoration: BoxDecoration(
                          color: AppColors.COLOR_PRIMARY_D22315,
                          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10))
                      ),
                    )
                  ]
              ) ,
            ),
          )
        ],
      ),
    );
  }
}
