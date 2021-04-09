import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/widgets/small_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class GoodsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(492),
      height: ScreenUtil().setWidth(726) ,
      padding: EdgeInsets.all(ScreenUtil().setWidth(29)),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: AppColors.COLOR_GRAY_1, blurRadius: 10.0, spreadRadius: 0)],
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(30))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: ScreenUtil().setWidth(434),
            height: ScreenUtil().setWidth(434),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(20)),
            ),
            clipBehavior: Clip.hardEdge,
            child: Image.network(AppImages.GOODS_IMG_1, fit: BoxFit.cover),
          ),
          SizedBox(height: 12),
          Text('商品介绍商品介绍商商品介绍商品介绍商商品介绍商品介绍商', style: TextStyle(fontSize: AppFontsize.SIZE_44, color: AppColors.COLOR_BLACK_2), maxLines: 1),
          SizedBox(height: 5),
          Price(),
          SizedBox(height: 12),
          Text('已售: 968', style: TextStyle(fontSize: AppFontsize.SIZE_36, color: AppColors.COLOR_GRAY_8)),
        ],
      ),
    );
  }
}
