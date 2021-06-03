import 'package:egou_app/common/routes.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_radius.dart';
import 'package:egou_app/constant/app_space.dart';
import 'package:egou_app/models/global.dart';
import 'package:egou_app/models/shop_entry_list.dart';
import 'package:egou_app/pages/shop/logic.dart';
import 'package:egou_app/pages/shop/state.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/search.dart';
import 'package:egou_app/widgets/small_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';


class MerchantListPage extends StatefulWidget {
  @override
  _MerchantListPageState createState() => _MerchantListPageState();
}

class _MerchantListPageState extends State<MerchantListPage> {
  final MerchantListLogic logic = Get.put(MerchantListLogic());
  final MerchantListState state = Get.find<MerchantListLogic>().state;
  final ShopState shopState = Get.find<ShopLogic>().state;
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocusNode = FocusNode();
  Future _future;
  String category_id = Get.parameters['category_id'];
  String name = Get.parameters['name'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = logic.onGetShopEntryLists({'category_id': int.parse(category_id)});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: _future,builder: (BuildContext context, AsyncSnapshot snapshot){
      if (snapshot.connectionState == ConnectionState.done){
        return Obx(() {
          final List shopEntryList = state.shopEntryList.value;
          return Scaffold(
            appBar: CustomAppBar(title: name + '商家',
                leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333)
            ),
            body: Column(
              children: [
                // Container(
                //     padding: EdgeInsets.only(left: AppSpace.SPACE_52, right: AppSpace.SPACE_52, bottom: 10),
                //     color: Colors.white , child: Search('搜索商家', controller: searchController, focusNode: searchFocusNode, onSubmitted: (String Value){
                //
                // },)
                // ),
                shopEntryList.length > 0 ? Expanded(child:  EasyRefresh.custom(
                    header: BallPulseHeader(color: AppColors.COLOR_PRIMARY_D22315),
                    footer: BallPulseFooter(color: AppColors.COLOR_PRIMARY_D22315),
                    onRefresh: () async => await logic.onGetShopEntryLists({'category_id': int.parse(category_id)}),
                    onLoad: () async => await logic.onLoadMore({'category_id': int.parse(category_id)}),
                    slivers: [
                      SliverPadding(padding: EdgeInsets.all(AppSpace.SPACE_52), sliver:  SliverList(delegate: SliverChildBuilderDelegate(
                            (BuildContext context,int index) {
                          return  _ShopItem(shopEntryList[index]);
                        },
                        childCount: shopEntryList.length,
                      ))),
                    ]
                )): Empty(text: '列表是空的', btnText: '去逛逛',onTap: () {
                  Get.offAllNamed(RouteConfig.main_page);},),
              ],
            ),
          );
        });
      }
      return SpinKit();
    });
  }

  Widget _ShopItem(ShopEntryListModel item){
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
                  child: Image.network(item.shopPhoto, fit: BoxFit.cover),
                ),
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.name, style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48, fontWeight: FontWeight.bold), maxLines: 1),
                    SizedBox(height: AppSpace.SPACE_24),
                    Text(item.businessContent, style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_36),maxLines: 2, overflow: TextOverflow.ellipsis,)
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
                      child: Text(item.address,
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

