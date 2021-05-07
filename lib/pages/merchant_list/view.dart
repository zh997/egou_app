import 'package:egou_app/common/routes.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_radius.dart';
import 'package:egou_app/constant/app_space.dart';
import 'package:egou_app/models/global.dart';
import 'package:egou_app/pages/shop/logic.dart';
import 'package:egou_app/pages/shop/state.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class MerchantListPage extends StatelessWidget {
  final MerchantListLogic logic = Get.put(MerchantListLogic());
  final MerchantListState state = Get.find<MerchantListLogic>().state;
  final ShopState shopState = Get.find<ShopLogic>().state;
  String id = Get.parameters['id'];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: CustomAppBar(title: shopState.gridList.value[int.parse(id)].text + '商家',
            leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333)
        ),
        body: Column(
          children: [
            Container(
                padding: EdgeInsets.only(left: AppSpace.SPACE_52, right: AppSpace.SPACE_52, bottom: 10),
                color: Colors.white , child: Search('搜索商家')
            ),
            Expanded(child: CustomScrollView(
              slivers: [
                SliverPadding(padding: EdgeInsets.all(AppSpace.SPACE_52), sliver:  SliverList(delegate: SliverChildBuilderDelegate(
                      (BuildContext context,int index) {
                    return  _ShopItem();
                  },
                  childCount: 10,
                ))),
              ],
            )),
            // Expanded(child: ListView(
            //   padding: EdgeInsets.all(AppSpace.SPACE_52),
            //   children: [
            //     Text('分类', style: TextStyle(color: Colors.black, fontSize: AppFontsize.SIZE_56, fontWeight: FontWeight.bold)),
            //     _ShopItem(),
            //     _ShopItem()
            //   ],
            // ))
          ],
        ),
      );
    });
  }

  Widget _ShopItem(){
    return GestureDetector(
      onTap: (){
        Get.toNamed(RouteConfig.shop_detail);
      },
      child: Container(
        padding: EdgeInsets.all(AppSpace.SPACE_50),
        margin: EdgeInsets.only(bottom: AppSpace.SPACE_50),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppRadius.RADIUS_30),
          // boxShadow: [BoxShadow(color: AppColors.COLOR_GRAY_E7E8E8, blurRadius: 10.0, spreadRadius: 0)],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: ScreenUtil().setWidth(248),
                  height: ScreenUtil().setWidth(248),
                  margin: EdgeInsets.only(right: AppSpace.SPACE_50),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppRadius.RADIUS_30),
                      border: Border.all(width: 1, color: AppColors.COLOR_GRAY_EFEFEF)
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Image.asset(AppImages.APP_LOGO, fit: BoxFit.cover),
                ),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('商家真牛网络', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48, fontWeight: FontWeight.bold), maxLines: 1),
                    SizedBox(height: AppSpace.SPACE_24),
                    Text('商品介绍商品介绍商品介商品介绍商品介绍商品介', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_36),maxLines: 2,)
                  ],
                ))
              ],
            ),
            SizedBox(height: AppSpace.SPACE_35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child:
                Row(
                  children: [
                    Image.asset(AppImages.ICON_7, width: ScreenUtil().setWidth(48), height: ScreenUtil().setHeight(49)),
                    Container(
                      width: ScreenUtil().setWidth(520),
                      child: Text('深圳市龙华区龙华街道116号3楼深圳市龙华区龙华街道116号3楼深圳市龙华区龙华街道116号3楼',
                        style: TextStyle(color:AppColors.COLOR_GRAY_999999,
                            fontSize: AppFontsize.SIZE_36),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                )
                ),
                Container(
                  alignment: Alignment.center,
                  width: ScreenUtil().setWidth(284),
                  height: ScreenUtil().setWidth(100),
                  decoration: BoxDecoration(
                      color: AppColors.COLOR_PRIMARY_D22315,
                      borderRadius: BorderRadius.circular(AppRadius.RADIUS_8)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.ICON_8, width: ScreenUtil().setWidth(38), height: ScreenUtil().setHeight(38)),
                      Text('导航到店', style: TextStyle(color: Colors.white, fontSize: AppFontsize.SIZE_44))
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}