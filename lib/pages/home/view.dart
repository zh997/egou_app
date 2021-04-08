import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_strings.dart';
import 'package:egou_app/widgets/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'logic.dart';
import 'state.dart';

final double _padding_lr = ScreenUtil().setWidth(45);
final double _padding_tb = ScreenUtil().setHeight(45);
double _status_bar_height (BuildContext context) => MediaQuery.of(context).padding.top;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {

  final HomeLogic logic = Get.put(HomeLogic());
  final HomeState state = Get.find<HomeLogic>().state;
  
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 10, vsync: this);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.COLOR_GRAY_3,
        body: Column(
          children: [
            _HeaderSearch(),
            Expanded(child: ListView(
              padding: EdgeInsets.only(),
              children: [
                Container(height: 1000, child: Text('sdasd'),)
              ],
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
          Container(padding: EdgeInsets.only(left: ScreenUtil().setWidth(52),right: ScreenUtil().setWidth(52)),
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
          Container(
            height: ScreenUtil().setWidth(140),
            alignment: Alignment.center,
            child: TabBar(
                controller: tabController,
                isScrollable: true,
                labelColor: AppColors.COLOR_BLACK_3,
                unselectedLabelColor: AppColors.COLOR_GRAY_1,
                labelStyle: TextStyle(fontSize: 16.0),
                labelPadding: EdgeInsets.only(),
                indicatorPadding: EdgeInsets.only(),
                indicator: CustomIndicator(),
                tabs: [
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(52),right: ScreenUtil().setWidth(52)),
                      alignment: Alignment.center,
                      child: Text('精选'),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(52),right: ScreenUtil().setWidth(52)),
                      alignment: Alignment.center,
                      child: Text('精选'),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(26),right: ScreenUtil().setWidth(26)),
                      alignment: Alignment.center,
                      child: Text('精选'),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(26),right: ScreenUtil().setWidth(26)),
                      alignment: Alignment.center,
                      child: Text('精选'),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(26),right: ScreenUtil().setWidth(26)),
                      alignment: Alignment.center,
                      child: Text('精选'),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(26),right: ScreenUtil().setWidth(26)),
                      alignment: Alignment.center,
                      child: Text('精选'),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(26),right: ScreenUtil().setWidth(26)),
                      alignment: Alignment.center,
                      child: Text('精选'),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(26),right: ScreenUtil().setWidth(26)),
                      alignment: Alignment.center,
                      child: Text('精选'),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(26),right: ScreenUtil().setWidth(26)),
                      alignment: Alignment.center,
                      child: Text('精选'),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                      padding: EdgeInsets.only(left: ScreenUtil().setWidth(26),right: ScreenUtil().setWidth(26)),
                      alignment: Alignment.center,
                      child: Text('精选'),
                    ),
                  ),
            ])
          )

        ],
      ),
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
    // TODO: implement paint
    Paint painer = Paint();
    painer.strokeWidth = ScreenUtil().setHeight(10);
    painer.strokeCap = StrokeCap.square;
    canvas.drawLine(Offset(10, ScreenUtil().setHeight(150)), Offset(30, ScreenUtil().setHeight(150)), painer);
  }
}
