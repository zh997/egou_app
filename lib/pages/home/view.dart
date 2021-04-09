import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_strings.dart';
import 'package:egou_app/widgets/goods_item.dart';
import 'package:egou_app/widgets/search.dart';
import 'package:egou_app/widgets/tab_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'logic.dart';
import 'state.dart';

final double _padding_lr = ScreenUtil().setWidth(52);
double _status_bar_height (BuildContext context) => MediaQuery.of(context).padding.top;

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
        backgroundColor: AppColors.COLOR_GRAY_3,
        body: Column(
          children: [
            _HeaderSearch(),
            Expanded(child: TabBarView(
              controller: tabController,
              children: List.generate(labelList.length, (index) => ListView(
                padding: EdgeInsets.only(),
                children: [
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
                    Container(
                      padding: EdgeInsets.all(_padding_lr),
                      child: Wrap(
                        runSpacing: ScreenUtil().setWidth(40),
                        alignment: WrapAlignment.spaceBetween,
                        children: List.generate(10, (index) => GoodsItem()),
                      ),
                    )
                ],
              )),
            ))
          ],
        )
    );
  }

  Widget _HeaderSearch() {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: AppColors.COLOR_GRAY_2, blurRadius: 1.0, spreadRadius: 0.0)]
      ),
      child: Column(
        children: [
          Container(padding: EdgeInsets.only(left: _padding_lr,right: _padding_lr),
              height: ScreenUtil().setHeight(171),
              alignment: Alignment.center,
              child: Row(
                children: [
                  Expanded(child: Search()),
                  Container(
                      alignment: Alignment.centerRight,
                      width: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(AppImages.SCAN_ICON,  width: ScreenUtil().setWidth(56), height: ScreenUtil().setWidth(56)),
                          Text(AppStrings.SCAN, style: TextStyle(fontSize: ScreenUtil().setSp(42),color: AppColors.COLOR_BLACK_2))
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
                    return AppColors.COLOR_PRIMARY_1;
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
            margin: EdgeInsets.only(left: _padding_lr, right: _padding_lr),
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
          child: Column(
            children: [
              Image.asset(AppImages.ICON_1, width: ScreenUtil().setWidth(151), height: ScreenUtil().setWidth(151)),
              SizedBox(height: ScreenUtil().setWidth(29)),
              Text(AppStrings.STRING_1, style: TextStyle(fontSize: ScreenUtil().setSp(44), color: AppColors.COLOR_BLACK_3))
            ],
          ),
        ),
        GestureDetector(
          child: Column(
            children: [
              Image.asset(AppImages.ICON_2, width: ScreenUtil().setWidth(151), height: ScreenUtil().setWidth(151)),
              SizedBox(height: ScreenUtil().setWidth(29)),
              Text(AppStrings.STRING_2, style: TextStyle(fontSize: ScreenUtil().setSp(44), color: AppColors.COLOR_BLACK_3))
            ],
          ),
        ),
        GestureDetector(
          child: Column(
            children: [
              Image.asset(AppImages.ICON_3, width: ScreenUtil().setWidth(151), height: ScreenUtil().setWidth(151)),
              SizedBox(height: ScreenUtil().setWidth(29)),
              Text(AppStrings.STRING_3, style: TextStyle(fontSize: ScreenUtil().setSp(44), color: AppColors.COLOR_BLACK_3))
            ],
          ),
        ),
        GestureDetector(
          child: Column(
            children: [
              Image.asset(AppImages.ICON_4, width: ScreenUtil().setWidth(151), height: ScreenUtil().setWidth(151)),
              SizedBox(height: ScreenUtil().setWidth(29)),
              Text(AppStrings.STRING_4, style: TextStyle(fontSize: ScreenUtil().setSp(44), color: AppColors.COLOR_BLACK_3))
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
        Container(width: ScreenUtil().setWidth(234), color: AppColors.COLOR_GRAY_7, height: 1),
        Padding(
          padding: EdgeInsets.only(left: _padding_lr, right: _padding_lr),
            child: Text(AppStrings.STRING_5, style: TextStyle(color: AppColors.COLOR_BLACK_2, fontSize: ScreenUtil().setSp(48), fontWeight: FontWeight.bold))),
        Container(width: ScreenUtil().setWidth(234), color: AppColors.COLOR_GRAY_7, height: 1),
      ],
    );
  }



  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}


class CustomIndicator extends Decoration{

  @override
  BoxPainter createBoxPainter([onChanged]) {
    print(onChanged);
    // TODO: implement createBoxPainter
    return CustomPainer();
  }

}

class CustomPainer extends BoxPainter {
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final indicatorWidth = ScreenUtil().setWidth(40);
    final startOffset = (configuration.size.width - indicatorWidth) / 2 + offset.dx;
    final endOffset = startOffset + indicatorWidth;
    // TODO: implement paint
    final Paint painer = Paint();
    painer.strokeWidth = ScreenUtil().setHeight(10);
    painer.strokeCap = StrokeCap.square;
    painer.color = AppColors.COLOR_PRIMARY_1;
    canvas.drawLine(Offset(startOffset, ScreenUtil().setHeight(150)), Offset(endOffset, ScreenUtil().setHeight(150)), painer);
  }
}
