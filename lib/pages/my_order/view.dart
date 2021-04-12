import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_space.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/small_widget.dart';
import 'package:egou_app/widgets/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';

class MyOrderPage extends StatefulWidget {
  @override
  _MyOrderPageState createState() => _MyOrderPageState();
}

class _MyOrderPageState extends State<MyOrderPage> with AutomaticKeepAliveClientMixin, SingleTickerProviderStateMixin {

  final MyOrderLogic logic = Get.put(MyOrderLogic());
  final MyOrderState state = Get.find<MyOrderLogic>().state;

  final List<String> labelList = ['全部订单', '待付款', '待发货', '待收货', '待评价'];

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
      appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title: '我的订单'),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(
                width: 1, color: AppColors.COLOR_GRAY_CCCCCC
              ))
            ),
            child: TabBarWidget(labelList, tabController, itemPadding: 40),
          ),
          Expanded(child: TabBarView(
            controller: tabController,
            children: List.generate(labelList.length, (index) => ListView(
              padding: EdgeInsets.all(AppSpace.SPACE_52),
              children: [
                _OrderItem(),
                _OrderItem()
              ],
            )),
          ))
        ],
      ),
    );
  }

  Widget _OrderItem() {
    return Container(
      padding: EdgeInsets.only(left: AppSpace.SPACE_52, top:  AppSpace.SPACE_40, bottom:  AppSpace.SPACE_40, right: AppSpace.SPACE_52 ),
      decoration: BoxDecoration(
        color: Colors.white,
          boxShadow: [BoxShadow(color: AppColors.COLOR_GRAY_E7E8E8, blurRadius: 10.0, spreadRadius: 0)],
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(30))
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 15),
            padding: EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(
                width: 1, color: AppColors.COLOR_GRAY_DDDDDD
              ))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('2021-04-03  15:03:02', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_40)),
                Text('已完成', style: TextStyle(color: AppColors.COLOR_PRIMARY_D22315, fontSize: AppFontsize.SIZE_56))
              ],
            ),
          ),
          Row(
            children: [
              Container(
                width:  ScreenUtil().setWidth(300),
                height:  ScreenUtil().setWidth(300),
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.COLOR_GRAY_F4F4F4, width: 3)
                ),
                child: Image.network(AppImages.GOODS_IMG_1, fit: BoxFit.cover),
              ),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('GUCCI', style: TextStyle(color: AppColors.COLOR_BLACK_222222, fontSize: AppFontsize.SIZE_48)),
                  SizedBox(height: 3),
                  Text('GUCCI/古驰 女士零钱GUCCI/古驰 女士零钱GUCCI/古驰 女士零钱GUCCI/古驰 女士零钱GUCCI/古驰 女士零钱', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_41), maxLines: 1),
                  SizedBox(height: 5),
                  Text('运单号 59863326989465（中通）', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_41), maxLines: 1),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Price(),
                      Text('数量 x1', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_41), maxLines: 1),
                    ],
                  )
                ],
              ))
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            padding: EdgeInsets.only(top: 15),
            decoration: BoxDecoration(
                border: Border(top: BorderSide(
                    width: 1, color: AppColors.COLOR_GRAY_DDDDDD
                ))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('合计', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
                    Price(color: AppColors.COLOR_BLACK_333333)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _Button('查看物流', AppColors.COLOR_GRAY_666666),
                    _Button('确认收获', AppColors.COLOR_PRIMARY_D22315)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _Button(text, color) {
    return Container(
      width: ScreenUtil().setWidth(243),
      height: ScreenUtil().setWidth(92),
      margin: EdgeInsets.only(left: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(92)),
        border:Border.all(width: 1 , color: color)
      ),
      child: Text(text, style: TextStyle(color: color, fontSize: AppFontsize.SIZE_44))
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
