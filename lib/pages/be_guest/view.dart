import 'package:egou_app/common/routes.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_radius.dart';
import 'package:egou_app/constant/app_space.dart';
import 'package:egou_app/models/order.dart';
import 'package:egou_app/pages/main/logic.dart';
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
  final MainLogic mainLogic = Get.put(MainLogic());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: logic.onGetGiftBagDetail(), builder: (BuildContext context, AsyncSnapshot snapshot){
      if (snapshot.connectionState == ConnectionState.done) {
        return Obx(() {
          final giftBagDetail = state.giftBagDetail.value;
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
                                  Container(
                                      width:  ScreenUtil().setWidth(765), height: ScreenUtil().setWidth(350),
                                      child:  Image.network(giftBagDetail.image, fit: BoxFit.cover,),
                                  )

                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  //   children: [
                                  //     Image.asset(AppImages.GIFT_1, width: ScreenUtil().setWidth(284), height: ScreenUtil().setWidth(270),),
                                  //     Image.asset(AppImages.GIFT_2,  width: ScreenUtil().setWidth(251), height: ScreenUtil().setWidth(326),),
                                  //     Image.asset(AppImages.GIFT_3,  width: ScreenUtil().setWidth(230), height: ScreenUtil().setWidth(130),),
                                  //   ],
                                  // ),
                                ],
                              ),
                            )
                        ),
                        Positioned(
                            top: ScreenUtil().setWidth(1753),
                            left: 0,
                            child: Container(
                                padding: EdgeInsets.fromLTRB(20, 5, 20, 0),
                                child: Text('${giftBagDetail.instructions}', style: TextStyle(color: Colors.white, fontSize: AppFontsize.SIZE_41))
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
                        child: RadiusButton('购买礼包', width: 903, height: 156, onTap: (){
                            final Map<String, dynamic> data = {};
                            data['image'] = giftBagDetail.image;
                            data['name'] =  giftBagDetail.name;
                            data['num'] = 1;
                            data['price'] = giftBagDetail.price;
                            data['id'] = giftBagDetail.id;
                            mainLogic.onSelectOrderGoods([OrderGoodsModelFromJson(data)]);
                            Get.toNamed(RouteConfig.gift_confirm_order);
                        })
                    )
                  ]
              )
          );
        });
      }
      return SizedBox();
    });
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
