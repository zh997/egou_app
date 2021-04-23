import 'package:egou_app/common/routes.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_space.dart';
import 'package:egou_app/constant/app_strings.dart';
import 'package:egou_app/widgets/goods_item.dart';
import 'package:egou_app/widgets/search.dart';
import 'package:egou_app/widgets/tab_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'logic.dart';
import 'state.dart';

final double _padding_lr = ScreenUtil().setWidth(52);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {

  final HomeLogic logic = Get.put(HomeLogic());
  final HomeState state = Get.find<HomeLogic>().state;

  final List<String> labelList = ['精选', '手机', '运动', '饰品', '母婴用品','家居', '彩妆', '电脑', '箱包', '学习用品'];

  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: labelList.length, vsync: this);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.COLOR_GRAY_F8F8F8,
        body: Column(
          children: [
            _HeaderSearch(),
            Expanded(child: TabBarView(
              controller: tabController,
              children: List.generate(labelList.length, (index) => CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(top: ScreenUtil().setWidth(44)),
                        child: Column(
                          children: [
                            _Swiper(),
                            _GridItems()
                          ],
                        ),
                      ),
                      SizedBox(height: ScreenUtil().setWidth(56)),
                      _title(),
                      SizedBox(height: 20)
                    ]),
                  ),
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
                              child: GoodsItem()
                          );
                        } else {
                          return Padding(
                              padding: EdgeInsets.only(left: AppSpace.SPACE_52),
                              child: GoodsItem()
                          );
                        }

                      },
                      childCount: 20,
                    ),
                  ),
                  SliverList(delegate: SliverChildListDelegate([
                    SizedBox(height: 20)
                  ]))
                ],
              )),
            )),
          ],
        )
    );
  }

  Widget _HeaderSearch() {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(width: 1, color: AppColors.COLOR_GRAY_F7F7F7))
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

  Widget _Swiper() {
    return Container(
      // width: ScreenUtil().setWidth(1125),
      height: ScreenUtil().setWidth(531),
      child: Swiper(
          key: UniqueKey(),
          index: 0,
          duration: 1000,
          onIndexChanged: logic.onSwiperChange,
          itemCount: state.BannerList.value.length,
          autoplay: true,
          pagination: SwiperPagination(
              builder: SwiperCustomPagination(builder: (BuildContext context, SwiperPluginConfig swiperPluginConfig) {
                Color _activeCircleBg (int index) {
                  if ( swiperPluginConfig.activeIndex == index) {
                    return AppColors.COLOR_PRIMARY_D22315;
                  } else {
                    return Colors.white;
                  }
                }
                return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(state.BannerList.value.length, (index) => Container(
                      margin: EdgeInsets.only(left: 2.5, right: 2.5),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: _activeCircleBg(index)
                      ),
                    ))
                );
              })
          ),
          itemBuilder: (BuildContext context,int index) =>  Container(
            margin: EdgeInsets.only(left: AppSpace.SPACE_52, right: AppSpace.SPACE_52),
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(20)))),
            clipBehavior: Clip.hardEdge,
            child: Image.asset(state.BannerList.value[index].url, fit: BoxFit.fill),
          )
      ),
    );
  }

  Widget _GridItems() {
    return Padding(padding: EdgeInsets.all(ScreenUtil().setWidth(44)), child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Get.toNamed(RouteConfig.be_guest);
          },
          child: Column(
            children: [
              Image.asset(AppImages.ICON_24, width: ScreenUtil().setWidth(151), height: ScreenUtil().setWidth(151)),
              SizedBox(height: ScreenUtil().setWidth(29)),
              Text(AppStrings.STRING_1, style: TextStyle(fontSize: ScreenUtil().setSp(44), color: AppColors.COLOR_BLACK_000000))
            ],
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Get.toNamed(RouteConfig.points_mall);
          },
          child: Column(
            children: [
              Image.asset(AppImages.ICON_2, width: ScreenUtil().setWidth(151), height: ScreenUtil().setWidth(151)),
              SizedBox(height: ScreenUtil().setWidth(29)),
              Text(AppStrings.STRING_2, style: TextStyle(fontSize: ScreenUtil().setSp(44), color: AppColors.COLOR_BLACK_000000))
            ],
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: (){
            Get.toNamed(RouteConfig.shop_settled);
          },
          child: Column(
            children: [
              Image.asset(AppImages.ICON_3, width: ScreenUtil().setWidth(151), height: ScreenUtil().setWidth(151)),
              SizedBox(height: ScreenUtil().setWidth(29)),
              Text(AppStrings.STRING_3, style: TextStyle(fontSize: ScreenUtil().setSp(44), color: AppColors.COLOR_BLACK_000000))
            ],
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: (){
            Get.toNamed(RouteConfig.share_page);
          },
          child: Column(
            children: [
              Image.asset(AppImages.ICON_4, width: ScreenUtil().setWidth(151), height: ScreenUtil().setWidth(151)),
              SizedBox(height: ScreenUtil().setWidth(29)),
              Text(AppStrings.STRING_4, style: TextStyle(fontSize: ScreenUtil().setSp(44), color: AppColors.COLOR_BLACK_000000))
            ],
          ),
        ),
      ],
    ));
  }

  Widget _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(width: ScreenUtil().setWidth(234), color: AppColors.COLOR_GRAY_D2D2D2, height: 1),
        Padding(
          padding: EdgeInsets.only(left: AppSpace.SPACE_52, right: AppSpace.SPACE_52),
            child: Text(AppStrings.STRING_5, style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: ScreenUtil().setSp(48), fontWeight: FontWeight.bold))),
        Container(width: ScreenUtil().setWidth(234), color: AppColors.COLOR_GRAY_D2D2D2, height: 1),
      ],
    );
  }



  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
