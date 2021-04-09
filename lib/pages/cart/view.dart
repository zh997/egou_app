import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_strings.dart';
import 'package:egou_app/widgets/search.dart';
import 'package:egou_app/widgets/small_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

final double _padding_lr = ScreenUtil().setWidth(52);

class CartPage extends StatelessWidget {
  final CartLogic logic = Get.put(CartLogic());
  final CartState state = Get.find<CartLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Text(''),
        centerTitle: true,
        title: Text('购物车', style: TextStyle(color: AppColors.COLOR_BLACK_2, fontWeight: FontWeight.bold, fontSize: AppFontsize.SIZE_56)),
        actions: [
          GestureDetector(
            child: Container(
              padding: EdgeInsets.only(right: 15),
              alignment: Alignment.center,
              child: Text(AppStrings.STRING_6, style: TextStyle(color: AppColors.COLOR_BLACK_2, fontSize: AppFontsize.SIZE_48)),
            ) ,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.only(left: _padding_lr, right: _padding_lr, bottom: 10),
              margin: EdgeInsets.only(bottom: 10),
              color: Colors.white , child: Search()
          ),
          Expanded(child: ListView(
            children: [
              _CartItem(context),
              _CartItem(context),
            ],
          ))
        ],
      ),
    );
  }

  Widget _CartItem(context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.fromLTRB(_padding_lr, 10, _padding_lr, 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Image.asset(AppImages.ICON_5, width: ScreenUtil().setWidth(48), height: ScreenUtil().setWidth(48)),
          Container(
            width:  ScreenUtil().setWidth(300),
            height:  ScreenUtil().setWidth(300),
            margin: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.COLOR_GRAY_9, width: 3)
            ),
            child: Image.network(AppImages.GOODS_IMG_1, fit: BoxFit.cover),
          ),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('GUCCI', style: TextStyle(color: AppColors.COLOR_BLACK_4, fontSize: AppFontsize.SIZE_44)),
              SizedBox(height: 3),
              Text('GUCCI/古驰 女士零钱GUCCI/古驰 女士零钱GUCCI/古驰 女士零钱GUCCI/古驰 女士零钱GUCCI/古驰 女士零钱', style: TextStyle(color: AppColors.COLOR_BLACK_4, fontSize: AppFontsize.SIZE_41), maxLines: 1),
              SizedBox(height: 5),
              Container(color: AppColors.COLOR_PRIMARY_1, padding: EdgeInsets.fromLTRB(5, 2,5,2), child: Text('特例品', style: TextStyle(color: Colors.white, fontSize: AppFontsize.SIZE_32))),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Price(),
                  _counter(context)
                ],
              )
            ],
          ))
        ],
      ),
    );
  }

  Widget _counter(context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColors.COLOR_GRAY_10)
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              showAnimatedDialog(
                context: context,
                barrierDismissible: true,
                builder: (BuildContext context) {
                  return Center(
                    child: Container(
                      width: 200,
                      height: 200,
                      color: Colors.white,
                    ),
                  );
                },
              );
            },
            child: Icon(Icons.remove),
          ),
          Padding(padding: EdgeInsets.only(left: 10, right: 10), child: Text('1', style: TextStyle(color: AppColors.COLOR_BLACK_3, fontSize: AppFontsize.SIZE_56))),
          GestureDetector(
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
