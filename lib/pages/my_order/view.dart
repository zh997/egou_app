import 'package:egou_app/common/routes.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_enums.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_space.dart';
import 'package:egou_app/models/home.dart';
import 'package:egou_app/models/order_list.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/small_widget.dart';
import 'package:egou_app/widgets/tab_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
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

  int tabIndex = 0;

  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: OrderTabValueItems.length, vsync: this);
    tabController.addListener(() {
      // final orderType = labelList[tabController.index]
      logic.onGetOrderLists('all');
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title: '我的订单'),
      body: FutureBuilder(future: logic.onGetOrderLists('all'), builder: (BuildContext context, AsyncSnapshot snapshot){
        if (snapshot.connectionState == ConnectionState.done) {
           return Obx(() {
             final List orderList = state.orderLists.value;
             return Column(
               children: [
                 Container(
                   decoration: BoxDecoration(
                       color: Colors.white, boxShadow: [BoxShadow(color: AppColors.COLOR_GRAY_848484, blurRadius: 1.0, spreadRadius: 0.0)]
                   ),
                   child: TabBarWidget(OrderTabValueItems, tabController, itemPadding: 40),
                 ),
                 Expanded(child: TabBarView(
                   controller: tabController,
                   children: List.generate(OrderTabValueItems.length, (index) => EasyRefresh.custom(
                     header: MaterialHeader(),
                     footer: MaterialFooter(enableInfiniteLoad: false),
                     onRefresh: () async => logic.onGetOrderLists('all'),
                     onLoad: () async => logic.onGetOrderLists('all'),
                     slivers: <Widget>[
                       SliverList(
                         delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                           return _OrderItem(orderList[index]);
                         }, childCount: orderList.length
                         ),
                       ),
                     ],
                   )),
                 ))
               ],
             );
           });
        }
        return SizedBox();
      }),
    );
  }

  Widget _OrderItem(OrderListItem item) {
    OrderStatus orderStatus;
    OrderStatusItems.forEach((element) {
      if(element.status == item.orderStatus) {
        orderStatus = element;
      }
    });
    return Container(
      padding: EdgeInsets.only(left: AppSpace.SPACE_52, top:  AppSpace.SPACE_40, bottom:  AppSpace.SPACE_40, right: AppSpace.SPACE_52 ),
      margin: EdgeInsets.only(bottom: 20),
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
                Text(item.createTime, style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_40)),
                Text(orderStatus.text, style: TextStyle(color: AppColors.COLOR_PRIMARY_D22315, fontSize: AppFontsize.SIZE_56))
              ],
            ),
          ),
          Column(
            children: List.generate(item.orderGoods.length, (index) => Row(
                children: [
                      Container(
                        width:  ScreenUtil().setWidth(300),
                        height:  ScreenUtil().setWidth(300),
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.COLOR_GRAY_F4F4F4, width: 3)
                        ),
                        child: Image.network(item.orderGoods[index].image, fit: BoxFit.cover),
                    ),
                    Expanded(child: Container(
                      height:  ScreenUtil().setWidth(300),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          Text(item.orderGoods[index].goodsName, style: TextStyle(color: AppColors.COLOR_BLACK_222222, fontSize: AppFontsize.SIZE_48)),
                          Text(item.orderGoods[index].specValue, style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_41), maxLines: 1),
                          // Text('运单号 59863326989465（中通）', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_41), maxLines: 1),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Price(price: item.orderGoods[index].goodsPrice ,),
                              Text('数量 x${item.orderGoods[index].goodsNum}', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_41), maxLines: 1),
                            ],
                          )
                      ],
                    ),
                    ))
              ],
            )),
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
                    Price(color: AppColors.COLOR_BLACK_333333, price: item.orderAmount,)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    item.orderStatus == 0 ? _Button('取消订单', AppColors.COLOR_GRAY_666666) : SizedBox(),
                    item.orderStatus == 0 ? _Button('继续支付', AppColors.COLOR_PRIMARY_D22315) : SizedBox(),
                    item.orderStatus == 2 ? _Button('查看物流', AppColors.COLOR_GRAY_666666) : SizedBox(),
                    item.orderStatus == 2 ? _Button('确认收货', AppColors.COLOR_PRIMARY_D22315) : SizedBox(),
                    item.orderStatus == 3 || item.orderStatus == 4 ? _Button('删除订单', AppColors.COLOR_PRIMARY_D22315) : SizedBox(),
                    item.orderStatus == 3 ? _Button('去评价', AppColors.COLOR_PRIMARY_D22315) : SizedBox()
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
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Get.toNamed(RouteConfig.publish_comments);
      },
      child: Container(
          width: ScreenUtil().setWidth(243),
          height: ScreenUtil().setWidth(92),
          margin: EdgeInsets.only(left: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(92)),
              border:Border.all(width: 1 , color: color)
          ),
          child: Text(text, style: TextStyle(color: color, fontSize: AppFontsize.SIZE_44))
      ) ,
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
