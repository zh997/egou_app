import 'package:egou_app/common/routes.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_radius.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/app_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class AddressPage extends StatelessWidget {
  final AddressLogic logic = Get.put(AddressLogic());
  final AddressState state = Get.find<AddressLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title: '地址管理'),
      body: Column(
        children: [
          Expanded(
            child: ListView(
                children: [
                  SizedBox(height: 15),
                  _CurrentSelectedAddress(true),
                  SizedBox(height: 15),
                  _CurrentSelectedAddress(false),
                  SizedBox(height: 15),
                  _CurrentSelectedAddress(false),
                ]
            )
          ),
          Container(
            alignment: Alignment.center,
            height: ScreenUtil().setWidth(250),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(width: 1, color: AppColors.COLOR_GRAY_DDDDDD))
            ),
            child: RadiusButton('添加收货地址', width: 903, height: 156, onTap: (){Get.toNamed(RouteConfig.edit_address);}),
          )
        ]
      )
    );
  }


  Widget _CurrentSelectedAddress(isDefault) {
    return InkWell(
      onTap: () {
        Get.toNamed(RouteConfig.edit_address);
      },
      child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('姓名', style: TextStyle(fontSize: AppFontsize.SIZE_48, color: AppColors.COLOR_BLACK_000000,fontWeight: FontWeight.bold)),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Text('17623144342', style: TextStyle(fontSize: AppFontsize.SIZE_48, color: AppColors.COLOR_BLACK_000000,fontWeight: FontWeight.bold)),
                      ),
                      isDefault ? Container(
                        width: ScreenUtil().setWidth(137),
                        height: ScreenUtil().setWidth(79),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColors.COLOR_PRIMARY_FFF2F1,
                            borderRadius: BorderRadius.circular(AppRadius.RADIUS_11),
                            border: Border.all(width: 1, color: AppColors.COLOR_PRIMARY_FFF2F1)
                        ),
                        child: Text('默认', style: TextStyle(
                          color: AppColors.COLOR_PRIMARY_D22315,
                          fontSize: AppFontsize.SIZE_36,
                        ),),
                      ): SizedBox()
                    ],
                  ),
                  SizedBox(height: 10),
                  Text('深圳市龙华区龙华街道116号3楼', style: TextStyle(
                      color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_36
                  ), maxLines: 1, overflow: TextOverflow.ellipsis,)
                ],
              ),
              Image.asset(AppImages.ARROW_RIGHT_ICON, width: ScreenUtil().setWidth(23), height: ScreenUtil().setWidth(52))
            ],
          )
      )
    );
  }
}
