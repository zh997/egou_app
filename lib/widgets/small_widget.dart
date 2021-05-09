import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_radius.dart';
import 'package:egou_app/models/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:egou_app/models/goods_detail.dart';
import 'package:get/get.dart';

import 'app_buttons.dart';

class Price extends StatelessWidget {
  final Color color;
  final String price;
  final double size;
  final double unitSize;
  final double bottom;
  final MainAxisAlignment mainAxisAlignment;
  Price({this.color, Key key, this.price, this.size, this.bottom = 1.8, this.unitSize, this.mainAxisAlignment}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: [
        Padding(padding: EdgeInsets.only(bottom: bottom),
            child: Text('￥',  style: TextStyle(fontSize:
            unitSize ?? AppFontsize.SIZE_32, color:
            color ?? AppColors.COLOR_PRIMARY_D22315,fontWeight: FontWeight.bold))),
        Text('${price ?? '0.00'}',  style: TextStyle(
            fontSize: size ?? AppFontsize.SIZE_56,
            color: color ?? AppColors.COLOR_PRIMARY_D22315,
            fontWeight: FontWeight.bold
        ))
      ],
    );
  }
}

class Counter extends StatelessWidget{
  final Function leftTap;
  final Function rightTap;
  final int num;
  Counter({Key key, this.leftTap, this.rightTap, this.num}): super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.fromLTRB(5, 3, 5, 3),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: AppColors.COLOR_GRAY_EAEAEA)
      ),
      child: Row(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: leftTap,
            child: Icon(Icons.remove, size: 20,),
          ),
          Padding(padding: EdgeInsets.only(left: 15, right: 15), child: Text(num.toString(), style: TextStyle(color: AppColors.COLOR_BLACK_000000, fontSize: AppFontsize.SIZE_46))),
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: rightTap,
            child: Icon(Icons.add, size: 20,),
          )
        ],
      ),
    );
  }
}


class DetailSwiper extends StatelessWidget {
  final List<GoodsImage> list;
  DetailSwiper(this.list);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: ScreenUtil().setWidth(1134),
      child: Swiper(
          key: UniqueKey(),
          index: 0,
          duration: 1000,
          itemCount: list.length,
          autoplay: true,
          pagination: SwiperPagination(
              builder: SwiperCustomPagination(builder: (BuildContext context, SwiperPluginConfig swiperPluginConfig) {
                return Container(
                  margin: EdgeInsets.fromLTRB(ScreenUtil().setWidth(950), 0, 0, 60),
                  child: Text('${swiperPluginConfig.activeIndex + 1} | ${list.length}', style: TextStyle(
                      color: AppColors.COLOR_GRAY_848484, fontSize: AppFontsize.SIZE_36
                  )),
                );
              })
          ),
          itemBuilder: (BuildContext context,int index) =>  Image.network(list[index].uri, fit: BoxFit.cover)
      ),
    );
  }
}


class AppAnimatedDialog {
  static void onShowAnimatedDialog(BuildContext context, String tipText,Function onConfirm) {
    showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            width: ScreenUtil().setWidth(956),
            height: ScreenUtil().setWidth(387),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppRadius.RADIUS_20)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Container(
                  alignment: Alignment.center,
                  child: Text(tipText),
                )),
                Divider(height: 1, color: AppColors.COLOR_GRAY_D2D2D2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: (){
                        Get.back(result: 'success');
                      },
                      child: Container(
                        height: ScreenUtil().setWidth(150),
                        alignment: Alignment.center,
                        child: Text('取消', style: TextStyle(fontSize: AppFontsize.SIZE_48, color: AppColors.COLOR_GRAY_666666)),
                      ),
                    )),
                    Container(width: 1,height:  ScreenUtil().setWidth(150), color: AppColors.COLOR_GRAY_D2D2D2),
                    Expanded(child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: onConfirm,
                      child: Container(
                        alignment: Alignment.center,
                        height: ScreenUtil().setWidth(150),
                        child: Text('确定', style: TextStyle(fontSize: AppFontsize.SIZE_48, color: AppColors.COLOR_PRIMARY_D22315)),
                      ),
                    ))
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class Empty extends StatelessWidget {
  final String text;
  final String btnText;
  final Function onTap;

  const Empty({Key key, this.text, this.onTap, this.btnText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Expanded(child: Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
          SizedBox(height: 20),
          RadiusButton(btnText, width: 400, height: 130, onTap: onTap)
        ],
      ),
    ));
  }}
