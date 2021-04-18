import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/small_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

enum ButtonType {border, primary}

class MyStorePage extends StatelessWidget {
  final MyStoreLogic logic = Get.put(MyStoreLogic());
  final MyStoreState state = Get.find<MyStoreLogic>().state;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title: '我的收藏'),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 15),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('15件商品', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
                  Divider(),
                  SizedBox(height: 10),
                  _storeItem(),
                  _storeItem(),
                  _storeItem()
                ]
              )
            )

          ]
        )
      )
    );
  }


  Widget _storeItem() {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            width:  ScreenUtil().setWidth(350),
            height:  ScreenUtil().setWidth(350),
            margin: EdgeInsets.only( right: 10),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.COLOR_GRAY_F4F4F4, width: 3)
            ),
            child: Image.network(AppImages.GOODS_IMG_1, fit: BoxFit.cover),
          ),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('GUCCI', style: TextStyle(color: AppColors.COLOR_BLACK_222222, fontSize: AppFontsize.SIZE_48)),
              SizedBox(height: 3),
              Text('996人收藏', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_36), maxLines: 1),
              SizedBox(height: 10),
              Price(),
              SizedBox(height: 5),
              Row(
                children: [
                  _CircleButton(ButtonType.border, '加入购物车'),
                  SizedBox(width: 10),
                  _CircleButton(ButtonType.primary, '立即购买')
                ]
              )
            ],
          ))
        ],
      ),
    );
  }

  Widget _CircleButton(type, text) {
    return Container(
      alignment: Alignment.center,
      width: ScreenUtil().setWidth(286),
      height: ScreenUtil().setWidth(92),
      decoration: BoxDecoration(
        color: type == ButtonType.primary ? AppColors.COLOR_PRIMARY_D22315 : Colors.transparent,
        border: Border.all(color: AppColors.COLOR_PRIMARY_D22315, width: 1),
        borderRadius: BorderRadius.circular(92),
      ),
      child: Text(text, style: TextStyle(color: type == ButtonType.primary ? Colors.white : AppColors.COLOR_PRIMARY_D22315, fontSize: AppFontsize.SIZE_44)),
    );
  }
}
