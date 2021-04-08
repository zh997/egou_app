import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:zb_app/common/routes.dart';
import 'package:zb_app/constant/app_colors.dart';
import 'package:zb_app/common/utils.dart';
import 'package:zb_app/constant/app_images.dart';
import 'package:zb_app/constant/app_strings.dart';
import 'package:zb_app/constant/app_text_styles.dart';
import 'package:zb_app/widgets/video_widget.dart';
import 'logic.dart';
import 'state.dart';

final double _padding_lr = ScreenUtil().setWidth(45);
final double _padding_tb = ScreenUtil().setHeight(45);
double _status_bar_height (BuildContext context) => MediaQuery.of(context).padding.top;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {

  final HomeLogic logic = Get.put(HomeLogic());
  final HomeState state = Get.find<HomeLogic>().state;
  final int APPBAR_SCROLL_OFFSET = 100;
  double appBarOpacity;
  int current;

  @override
  void initState() {
    // TODO: implement initState
    appBarOpacity = 0.0;
    current = 0;
    super.initState();
  }

  void _onScrollUpdateOpacity (double offset) {
    double opacity = offset / APPBAR_SCROLL_OFFSET;
    if (opacity <= 0) {
      opacity = 0;
    } else if (opacity >=1 ) {
      opacity = 1;
    }
    setState(() {
      appBarOpacity = opacity;
    });
  }

  void _onSwiperChange(int index) {
    setState(() {
      current = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final AppBarHeight = ScreenUtil().setHeight(120) + _status_bar_height(context);
      final AppBarBgColor = Utils.getColor(state.BannerList.value[current].color);
      return Scaffold(
        backgroundColor: Color(0xFFF5F5F5),
        body: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                width: MediaQuery.of(context).size.width,
                height: ScreenUtil().setHeight(1000),
                child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    decoration: BoxDecoration(gradient: LinearGradient(
                        colors: [AppBarBgColor, AppColors.COLOR_GRAY_1],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter))
                )
            ),
            NotificationListener(
                onNotification: (Notification notification) {
                  if (notification is ScrollUpdateNotification && notification.depth == 0) {
                    _onScrollUpdateOpacity(notification.metrics.pixels);
                  }
                  return true;
                },
                child: ListView(
                  padding: EdgeInsets.only(top: AppBarHeight),
                  children: [
                    Padding(padding: EdgeInsets.only(left: _padding_lr, right: _padding_lr, top: _padding_tb), child: SearchBarWidget()),
                    Obx(() => SwiperWidget(state.BannerList.value, _onSwiperChange, current)),
                    Padding(
                      padding:EdgeInsets.only(left: _padding_lr, right: _padding_lr),
                      child: Column(
                        children: [
                          TodayPriceWidget(),
                          FlexLayoutWidget(),
                          TitleWidget(AppStrings.VIDEO),
                          VideoApp(),
                          TitleWidget(AppStrings.BRAND_RECOMMEND),
                          BrandRecommendWidget(),
                          TitleWidget(
                              AppStrings.HOT_RECOMMEND,
                              titleIcon: Image.asset(AppImages.HOT_RECOMMEND_ICON, width: ScreenUtil().setWidth(40), fit: BoxFit.fitWidth)
                          ),
                          HotRecommendWidet()
                        ],
                      ),
                    ),
                  ],
                )
            ),
            Positioned(
                top: 0,
                left: 0,
                child: AppBarWidget(appBarOpacity, AppBarBgColor,  AppBarHeight)
            ),
          ],
        ),
      );
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}


// 轮播图
class SwiperWidget extends StatelessWidget{
  List<SwiperItemModel> BannerList;
  Function(int index) onSwiperChange;
  int current;
  SwiperWidget(this.BannerList, this.onSwiperChange, this.current);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: ScreenUtil().setWidth(1080),
      height: ScreenUtil().setWidth(380),
      margin: EdgeInsets.only(top: _padding_tb, bottom: _padding_tb),
      child: Swiper(
          key: UniqueKey(),
          index: current,
          duration: 1000,
          onIndexChanged: onSwiperChange,
          itemCount: BannerList.length,
          autoplay: true,
          pagination: SwiperPagination(
              builder: SwiperCustomPagination(builder: (BuildContext context, SwiperPluginConfig swiperPluginConfig) {
                Color _activeCircleBg (int index) {
                  if ( swiperPluginConfig.activeIndex == index) {
                    return Colors.white;
                  } else {
                    return Colors.transparent;
                  }
                }
                return Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: List.generate(BannerList.length, (index) => Container(
                     margin: EdgeInsets.only(left: 2.5, right: 2.5),
                     width: 8,
                     height: 8,
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.all(Radius.circular(8)),
                         border: Border.all(color: Colors.white),
                         color: _activeCircleBg(index)
                     ),
                   ))
                );
              })
          ),
          itemBuilder: (BuildContext context,int index) =>  Container(
            margin: EdgeInsets.only(left: _padding_lr, right: _padding_lr),
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(20)))),
            clipBehavior: Clip.hardEdge,
            child: Image.asset(BannerList[index].url, fit: BoxFit.fill),
          )
      ),
    );
  }
}

// 顶部导航栏
class AppBarWidget extends StatelessWidget {
  final double AppBarHeight;
  double opacity;
  Color AppBarBgColor;
  AppBarWidget(this.opacity, this.AppBarBgColor,  this.AppBarHeight);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Positioned(
            top: 0,
            left: 0,
            width: MediaQuery.of(context).size.width,
            height: AppBarHeight,
            child: Opacity(
              opacity: opacity,
              child:  AnimatedContainer(
                 duration: Duration(milliseconds: 300),
                 color: AppBarBgColor,
              ),
            )
        ),
        Positioned(
            top: _status_bar_height(context),
            left: _padding_lr,
            height: ScreenUtil().setWidth(130),
            child: Image.asset(AppImages.APP_LOGO, width: ScreenUtil().setWidth(370), fit: BoxFit.fitWidth)
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: AppBarHeight,
          padding: EdgeInsets.only(top: _status_bar_height(context), right: _padding_lr, left: _padding_lr),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Padding(padding: EdgeInsets.only(right: _padding_lr + 10), child: Opacity(opacity: opacity, child: SearchBarWidget()))),
              Image.asset(AppImages.MESSAGE_ICON, width: ScreenUtil().setWidth(53), fit: BoxFit.fitWidth)
            ],
          ),
        )
      ]
    );
  }

}

// 顶部搜索框
class SearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: ScreenUtil().setWidth(92),
      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(92)), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(child: Image.asset('static/images/in18.png', width: ScreenUtil().setWidth(40)), margin: EdgeInsets.only(right: ScreenUtil().setWidth(10))) ,
          Text(AppStrings.SEARCH_PLACEHOLDER, style: AppTextStyles.COLOR_GRAY_2_SIZE_34)
        ],
      ),
    );
  }

}

// 今日金价
class TodayPriceWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          width: ScreenUtil().setWidth(993),
          height: ScreenUtil().setWidth(93),
          child: Image.asset(AppImages.TODAY_PRICE_BG, fit: BoxFit.fill),
        ),
        Container(
          height: ScreenUtil().setWidth(93),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(top:1, right: 2),child: Text(AppStrings.TODAY_PRICE, style: AppTextStyles.COLOR_BLACK_1_SIZE_36)),
              Text('800元/1g', style: AppTextStyles.COLOR_BLACK_1_SIZE_48_BOLD)
            ],
          ) ,
        )
      ],
    );
  }

}


// 中间产品布局
class FlexLayoutWidget extends StatelessWidget {

  Widget _FlexItem(double width, double height, Function ColumnBlock) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RouteConfig.login_page);
      },
      child: Stack(
        children: [
          Container(
            width: ScreenUtil().setWidth(width),
            height: ScreenUtil().setWidth(height),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(20)))),
            child:  ColumnBlock(),
          ),
          Positioned(
              top: 5,
              left: 5,
              child: Container(
                  padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                  decoration: BoxDecoration(border: Border.all(color: AppColors.COLOR_RED_2, width: 1), borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Text('银饰', style: AppTextStyles.COLOR_RED_2_SIZE_24)
              )
          )
        ],
      ),
    );
  }

  Widget _SmallFlexItem() {
    return _FlexItem(485, 339.5, () => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(color: AppColors.COLOR_GRAY_1, width: ScreenUtil().setWidth(350), height: ScreenUtil().setWidth(150), child: Image.asset('static/images/02.jpg', fit: BoxFit.fill)),
        Container(margin: EdgeInsets.only(top: 5, bottom: 5), child: Text('库存 100', style: TextStyle(fontSize: ScreenUtil().setSp(24), color: AppColors.COLOR_BLACK_2))),
        Text('love 系列手镯 窄版', style: AppTextStyles.COLOR_BLACK_2_SIZE_34, overflow: TextOverflow.ellipsis, maxLines: 1),
        Text('168情侣耳钉情侣礼物', style: AppTextStyles.COLOR_BLACK_2_SIZE_28, overflow: TextOverflow.ellipsis, maxLines: 1),
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: _padding_tb),
      child: Wrap(
         alignment: WrapAlignment.spaceBetween,
        children: [
          _FlexItem(485, 700, () => Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('love 系列手镯 窄版', style: AppTextStyles.COLOR_BLACK_1_SIZE_36, overflow: TextOverflow.ellipsis, maxLines: 1),
              Text('168情侣耳钉情侣礼物', style: AppTextStyles.COLOR_BLACK_2_SIZE_28, overflow: TextOverflow.ellipsis, maxLines: 1),
              Container(margin: EdgeInsets.only(top: 15, bottom: 15), color: AppColors.COLOR_GRAY_1, width: ScreenUtil().setWidth(350), height: ScreenUtil().setHeight(350), child: Image.asset('static/images/02.jpg', fit: BoxFit.fill)),
              Text('库存 100', style: AppTextStyles.COLOR_GRAY_2_SIZE_24, overflow: TextOverflow.ellipsis, maxLines: 1),
            ],
          )),
          Container(
            width: ScreenUtil().setWidth(485),
            height: ScreenUtil().setWidth(700),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _SmallFlexItem(),
                _SmallFlexItem(),
              ],
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(990),
            height: ScreenUtil().setWidth(385),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _SmallFlexItem(),
                _SmallFlexItem(),
              ],
            ),
          )
        ],
      ),
    );
  }

}


// 标题
class TitleWidget extends StatelessWidget {
  final String title;
  final Image titleIcon;
  TitleWidget(this.title, {this.titleIcon});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: _padding_tb, bottom: 5),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              titleIcon.isNull ? Container(width: ScreenUtil().setWidth(8), height: ScreenUtil().setHeight(28),
                  margin: EdgeInsets.only(right: 5, top: 2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(ScreenUtil().setHeight(4)), bottom: Radius.circular(ScreenUtil().setHeight(4))),
                      color: AppColors.COLOR_PRIMARY_1
                  )
              ) : Container( margin: EdgeInsets.only(right: 5, top: 2),child: titleIcon),
              Text(title, style: AppTextStyles.COLOR_BLACK_3_SIZE_36_BOLD)
            ],
          ),
          Text(AppStrings.MORE_TEXT, style: AppTextStyles.COLOR_PRIMARY_1_SIZE_30_BOLD)
        ],
      ),
    );
  }
}

// 品牌推荐
class BrandRecommendWidget extends StatelessWidget {

  Widget line() {
    return Opacity(opacity: 0.29, child: Container(
      margin: EdgeInsets.only(left: 5, right: 5),
      width: ScreenUtil().setWidth(72),
      height: 0.5,
      color: Colors.black,
    ));
  }

  Widget verticalLine() {
    return Opacity(opacity: 0.29, child: Container(
      width: 0.5,
      height:  ScreenUtil().setHeight(80),
      color: Colors.black,
    ));
  }

  Widget largeBrItem() {
    return Container(
      width: ScreenUtil().setWidth(457),
      height: ScreenUtil().setWidth(490),
      decoration: BoxDecoration(
        color: AppColors.COLOR_GRAY_1,
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10))
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center ,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('星光美珠宝', style: AppTextStyles.COLOR_BLACK_3_SIZE_48),
          Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(25), bottom: ScreenUtil().setHeight(25)), child: Row(
            mainAxisAlignment: MainAxisAlignment.center ,
            children: [
              line(),
              Opacity(opacity: 0.29, child: Text('大品牌', style: AppTextStyles.COLOR_BLACK_3_SIZE_30)) ,
              line()
            ],
          )),
          Container(
            width: ScreenUtil().setWidth(250), height: ScreenUtil().setWidth(250),
            child: Image.asset('static/images/02.jpg', fit: BoxFit.fill ) ,
          )
        ],
      ),
    );
  }


  Widget smallBrItem(String logo) {
    return Container(
      width: ScreenUtil().setWidth(225),
      height: ScreenUtil().setWidth(160),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center ,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: ScreenUtil().setWidth(165),
            height: ScreenUtil().setWidth(90),
            child: Image.asset(logo, fit: BoxFit.fill),
          ),
          Text('奢品上新', style: AppTextStyles.COLOR_BLACK_2_SIZE_28, overflow: TextOverflow.ellipsis, maxLines: 1)
        ],
      ),
    );
  }

  Widget smallBrItemContainer() {
    return Container(
      width: ScreenUtil().setWidth(457),
      height: ScreenUtil().setWidth(490),
      child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          runAlignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            smallBrItem('static/images/in06.png'),
            verticalLine(),
            smallBrItem('static/images/in07.png'),
            smallBrItem('static/images/in08.png'),
            verticalLine(),
            smallBrItem('static/images/in09.png'),
            smallBrItem('static/images/in09.png'),
            verticalLine(),
            smallBrItem('static/images/in09.png')
          ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all( ScreenUtil().setWidth(22)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(20))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          largeBrItem(),
          smallBrItemContainer()
        ],
      ),
    );
  }

}

// 热门推荐
class HotRecommendWidet extends StatelessWidget{

  Widget hotRecommendItem () {
    return Container(
      padding: EdgeInsets.all(ScreenUtil().setWidth(29)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(20))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: ScreenUtil().setWidth(200),
            child: Image.asset('static/images/04.jpg', fit: BoxFit.fill),
          ),
          Expanded(child: Container(
              height: ScreenUtil().setWidth(200),
              padding: EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('欧美经典不锈钢手镯光面镀金18k金', overflow: TextOverflow.ellipsis, maxLines: 1, style: AppTextStyles.COLOR_BLACK_4_SIZE_40),
                  Text('ATC18', style: AppTextStyles.COLOR_GRAY_2_SIZE_36),
                  Text('￥888', style: AppTextStyles.COLOR_RED_2_SIZE_42)
                ],
              )) ,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: List.generate(10, (index) => Padding(padding: EdgeInsets.only(bottom: 10), child: hotRecommendItem(),)),
    );
  }

}
