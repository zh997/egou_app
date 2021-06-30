import 'package:egou_app/common/routes.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/models/shop_info.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/small_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class MyShopPage extends StatelessWidget {
  final MyShopLogic logic = Get.put(MyShopLogic());
  final MyShopState state = Get.find<MyShopLogic>().state;
  String shop_id = Get.parameters['shop_id'];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: logic.onShopCode(), builder: (BuildContext context, AsyncSnapshot snapshot){
      if (snapshot.connectionState == ConnectionState.done) {
        return Scaffold(
            appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title: '我的店铺'),
            body: SafeArea(
                child: Obx((){
                  final ShopCodeModel shopCode = state.shopCode.value;
                  return ListView(
                      children: [
                        _Header(),
                        SizedBox(height: 15),
                        _Order(),
                        SizedBox(height: 15),
                        _listItem(),
                        SizedBox(height: 15),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('收款二维码', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
                              SizedBox(height: 20,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.network(shopCode.url, width: ScreenUtil().setWidth(486), height: ScreenUtil().setWidth(486),)
                                ],
                              )

                            ],
                          ),
                        )
                      ]
                  );
                })
            )
        );
      }
      return SpinKit();
    });
  }

  Widget _Header() {
    return Container(
      color: AppColors.COLOR_PRIMARY_D22315,
      alignment: Alignment.center,
      height: ScreenUtil().setWidth(398),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('今日收入', style: TextStyle(color:Colors.white, fontSize: AppFontsize.SIZE_36)),
                  SizedBox(height: 15),
                  Price(color:Colors.white, size: AppFontsize.SIZE_48, price: '6666.66')
                ]
              ),
              Column(
                  children: [
                    Text('昨日收入', style: TextStyle(color:Colors.white, fontSize: AppFontsize.SIZE_36)),
                    SizedBox(height: 15),
                    Price(color:Colors.white, size: AppFontsize.SIZE_48,price: '6666.66')
                  ]
              ),
              Column(
                  children: [
                    Text('近30日收入', style: TextStyle(color:Colors.white, fontSize: AppFontsize.SIZE_36)),
                    SizedBox(height: 15),
                    Price(color:Colors.white, size: AppFontsize.SIZE_48,price: '6666.66')
                  ]
              )
            ]
          ),
          SizedBox(height: 25),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('总收入', style: TextStyle(color:Colors.white, fontSize: AppFontsize.SIZE_36)),
              Price(color:Colors.white, size: AppFontsize.SIZE_48,price: '88888.66')
            ]
          )
        ],
      )
    );
  }

  Widget _Order() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text('6', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_56, fontWeight: FontWeight.bold)),
              Text('今日新增订单', style: TextStyle(color: AppColors.COLOR_GRAY_B7B7B7, fontSize: AppFontsize.SIZE_48)),
            ]
          ),
          Column(
              children: [
                Text('2', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_56, fontWeight: FontWeight.bold)),
                Text('昨日订单', style: TextStyle(color: AppColors.COLOR_GRAY_B7B7B7, fontSize: AppFontsize.SIZE_48)),
              ]
          ),
          Column(
              children: [
                Text('8', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_56, fontWeight: FontWeight.bold)),
                Text('七日订单', style: TextStyle(color: AppColors.COLOR_GRAY_B7B7B7, fontSize: AppFontsize.SIZE_48)),
              ]
          )
        ]
      ),
    );
  }

  Widget _listItem() {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteConfig.shop_detail + '?shop_id=${shop_id}');
      },
      child: Container(
          padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
          color: Colors.white,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('商家信息', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
                Image.asset(AppImages.ARROW_RIGHT_ICON, width: 8, height: 18)
              ]
          )
      )
    );
  }
}
