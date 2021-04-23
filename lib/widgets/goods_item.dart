import 'package:egou_app/common/routes.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/widgets/small_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
class GoodsItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteConfig.goods_detail);
      },
      child: Container(
        padding: EdgeInsets.all(ScreenUtil().setWidth(29)),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: AppColors.COLOR_GRAY_E7E8E8, blurRadius: 10.0, spreadRadius: 0)],
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
            SizedBox(height: ScreenUtil().setWidth(20)),
            Text('商品介绍商品介绍商商品介绍商品介绍商商品介绍商品介绍商', style: TextStyle(fontSize: AppFontsize.SIZE_44, color: AppColors.COLOR_BLACK_333333), maxLines: 1, overflow: TextOverflow.ellipsis,),
            SizedBox(height: ScreenUtil().setWidth(20)),
            Price(),
            SizedBox(height: ScreenUtil().setWidth(20)),
            Text('已售: 968', style: TextStyle(fontSize: AppFontsize.SIZE_36, color: AppColors.COLOR_GRAY_999999)),
          ],
        ),
      ),
    );
  }
}
