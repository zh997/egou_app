import 'package:egou_app/common/routes.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_space.dart';
import 'package:egou_app/constant/app_strings.dart';
import 'package:egou_app/pages/main/logic.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/goods_item.dart';
import 'package:egou_app/widgets/search.dart';
import 'package:egou_app/widgets/small_widget.dart';
import 'package:egou_app/widgets/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class PointsMallPage extends StatefulWidget {
  @override
  _PointsMallPageState createState() => _PointsMallPageState();
}

class _PointsMallPageState extends State<PointsMallPage> with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {

  final PointsMallLogic logic = Get.put(PointsMallLogic());
  final MainLogic mainLogic = Get.put(MainLogic());
  final PointsMallState state = Get.find<PointsMallLogic>().state;
  Future _future;

  final List<String> labelList = ['精选', '手机', '运动', '饰品', '母婴用品','家居', '彩妆', '电脑', '箱包', '学习用品'];
  String type = Get.parameters['type'];

  TabController tabController;

  String _title() {
    if (int.parse(type) == 1) {
      return '场景商城';
    }
    if (int.parse(type) == 2) {
      return '社区商城';
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: labelList.length, vsync: this);
    mainLogic.onSetShopType(int.parse(type));
    _future = logic.onGoodsList(int.parse(type));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: _future, builder: (BuildContext context, AsyncSnapshot snapshot) {
      if(snapshot.connectionState == ConnectionState.done){
        return Obx(() {
          final List goodsList = state.goodsList.value;
          return  Scaffold(
            appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title: _title()),
            body: Column(
              children: [
                goodsList.length  > 0 ? Expanded(child: EasyRefresh.custom(
                  header: MaterialHeader(),
                  footer: MaterialFooter(enableInfiniteLoad: false),
                  onRefresh: () async => await logic.onGoodsList(int.parse(type)),
                  onLoad: () async => await logic.onLoadMore(int.parse(type)),
                  slivers: [
                    SliverList(delegate: SliverChildListDelegate([
                      SizedBox(height: 20)
                    ])),
                    SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio:   ScreenUtil().setWidth(492) / ScreenUtil().setWidth(660),
                      ),
                      delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          if(index % 2 > 0) {
                            return Padding(
                                padding: EdgeInsets.only(right: AppSpace.SPACE_52),
                                child: GoodsItem(item: goodsList[index])
                            );
                          } else {
                            return Padding(
                                padding: EdgeInsets.only(left: AppSpace.SPACE_52),
                                child: GoodsItem(item: goodsList[index])
                            );
                          }
                        },
                        childCount: goodsList.length,
                      ),
                    ),
                    SliverList(delegate: SliverChildListDelegate([
                      SizedBox(height: 20)
                    ]))
                  ],
                )) :  Empty(text: '列表是空的', btnText: '去逛逛',onTap: () {
                  Get.offAllNamed(RouteConfig.main_page);},)
              ],
            ),
            // body:  Column(
            //   children: [
            //     _HeaderSearch(),
            //     Expanded(child: TabBarView(
            //       controller: tabController,
            //       children: List.generate(labelList.length, (index) => CustomScrollView(
            //         slivers: [
            //           SliverList(delegate: SliverChildListDelegate([
            //             SizedBox(height: 20)
            //           ])),
            //           SliverGrid(
            //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //               crossAxisCount: 2,
            //               mainAxisSpacing: 20,
            //               crossAxisSpacing: 20,
            //               childAspectRatio:   ScreenUtil().setWidth(492) / ScreenUtil().setWidth(660),
            //             ),
            //             delegate: SliverChildBuilderDelegate(
            //                   (BuildContext context, int index) {
            //                 if(index % 2 > 0) {
            //                   return Padding(
            //                       padding: EdgeInsets.only(right: AppSpace.SPACE_52),
            //                       child: GoodsItem()
            //                   );
            //                 } else {
            //                   return Padding(
            //                       padding: EdgeInsets.only(left: AppSpace.SPACE_52),
            //                       child: GoodsItem()
            //                   );
            //                 }
            //               },
            //               childCount: 20,
            //             ),
            //           ),
            //           SliverList(delegate: SliverChildListDelegate([
            //             SizedBox(height: 20)
            //           ]))
            //         ],
            //       )),
            //     ))
            //   ],
            // )
          );
        });
      }
      return SizedBox();
    });
  }

  Widget _HeaderSearch() {
    return Container(
      // padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: AppColors.COLOR_GRAY_848484, blurRadius: 1.0, spreadRadius: 0.0)]
      ),
      child: Column(
        children: [
          Container(padding: EdgeInsets.only(left: AppSpace.SPACE_52,right: AppSpace.SPACE_52),
              height: ScreenUtil().setHeight(171),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Expanded(child: Search('搜索商品')),
                  Container(
                      alignment: Alignment.centerRight,
                      width: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(AppImages.SCAN_ICON,  width: ScreenUtil().setWidth(56), height: ScreenUtil().setWidth(56)),
                          Text(AppStrings.SCAN, style: TextStyle(fontSize: ScreenUtil().setSp(42),color: AppColors.COLOR_BLACK_333333))
                        ],
                      )
                  )
                ],
              )),
          TabBarWidget(labelList, tabController)
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
