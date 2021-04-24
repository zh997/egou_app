import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_space.dart';
import 'package:egou_app/constant/app_strings.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/goods_item.dart';
import 'package:egou_app/widgets/search.dart';
import 'package:egou_app/widgets/tab_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';

final double _padding_lr = ScreenUtil().setWidth(52);

class BillPage extends StatefulWidget {
  @override
  _BillPageState createState() => _BillPageState();
}

class _BillPageState extends State<BillPage> with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin  {

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
      appBar: CustomAppBar(title: '社区商城'),
      body:  Column(
        children: [
          _HeaderSearch(),
          Expanded(child: TabBarView(
            controller: tabController,
            children: List.generate(labelList.length, (index) => CustomScrollView(
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
          ))
        ],
      )
    );
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
          Container(padding: EdgeInsets.only(left: _padding_lr,right: _padding_lr),
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
