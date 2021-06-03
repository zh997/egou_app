import 'package:egou_app/common/routes.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/app_buttons.dart';
import 'package:egou_app/widgets/app_order_item.dart';
import 'package:egou_app/widgets/small_widget.dart';
import 'package:egou_app/models/order_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:egou_app/constant/app_enums.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';


class StepListModel {
  final int status;
  final String text;

  StepListModel({Key key, this.status, this.text});

}

class OrderDetailPage extends StatefulWidget {
  @override
  _OrderDetailPageState createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  final OrderDetailLogic logic = Get.put(OrderDetailLogic());
  final OrderDetailState state = Get.find<OrderDetailLogic>().state;
  String id = Get.parameters['id'];
  Future _future;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = logic.onGetOrderDetail(int.parse(id));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: _future,builder: (BuildContext context,  AsyncSnapshot snapshot){
      if (snapshot.connectionState == ConnectionState.done) {
        return Obx(() {
          final OrderDetailModel orderDetailModel = state.orderDetail.value;
          return Scaffold(
            appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title: '订单详情'),
            body: Column(
              children: [
                Expanded(child: ListView(
                  children: [
                    Container(
                      color: AppColors.COLOR_PRIMARY_D22315,
                      alignment: Alignment.center,
                      height: ScreenUtil().setWidth(398),
                      child: OrderStatusWidget(orderDetailModel),
                    ),
                    // SizedBox(height: 15,),
                    // Container(
                    //   color: Colors.white,
                    //   child: Column(
                    //     children: [
                    //       Padding(
                    //         padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    //         child: Row(
                    //           children: [
                    //             Text('退款金额', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
                    //             SizedBox(width: 50,),
                    //             Price(color: AppColors.COLOR_BLACK_333333,)
                    //           ],
                    //         ),
                    //       ),
                    //       Divider(height: 1, color: AppColors.COLOR_GRAY_F5F5F5),
                    //       Padding(
                    //         padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    //         child: Row(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             Text('到账进度', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48)),
                    //             SizedBox(width: 50,),
                    //             Expanded(child:   StepColumn())
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(height: 15,),
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Column(
                        children: [
                          Column(
                            children: List.generate(orderDetailModel.orderGoods.length, (index) => Padding(
                                padding: EdgeInsets.only(bottom: 15),
                                child: OrderItem(
                                  img: orderDetailModel.orderGoods[index].image,
                                  name: orderDetailModel.orderGoods[index].goodsName, price: orderDetailModel.orderGoods[index].goodsPrice,
                                  specValueStr: orderDetailModel.orderGoods[index].specValue,),
                              )
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('实付款', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_46)),
                              Text('￥${orderDetailModel.totalAmount}', style: TextStyle(color: AppColors.COLOR_BLACK_222222, fontSize: AppFontsize.SIZE_46)),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('运费', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_46)),
                              Text('￥${orderDetailModel.shippingPrice}', style: TextStyle(color: AppColors.COLOR_BLACK_222222, fontSize: AppFontsize.SIZE_46)),
                            ],
                          ),
                          SizedBox(height: 15,),
                          Divider(height: 1, color: AppColors.COLOR_GRAY_EEEEEE),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('实付款', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48, fontWeight: FontWeight.bold)),
                              SizedBox(width: 50,),
                              Price(price: orderDetailModel.orderAmount, color: AppColors.COLOR_PRIMARY_D22315)
                            ],
                          )
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text('合计退款', style: TextStyle(color: AppColors.COLOR_BLACK_333333, fontSize: AppFontsize.SIZE_48, fontWeight: FontWeight.bold)),
                          //     Price(price: '999.00', color: AppColors.COLOR_BLACK_333333)
                          //   ],
                          // )
                        ],
                      ),
                    ),
                    // SizedBox(height: 15,),
                    // Container(
                    //   color: Colors.white,
                    //   padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                    //   child: Column(
                    //     children: [
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.start,
                    //         children: [
                    //           Text('合计退款', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_46)),
                    //           SizedBox(width: 50,),
                    //           Text('退货退款', style: TextStyle(color: AppColors.COLOR_BLACK_222222, fontSize: AppFontsize.SIZE_48,fontWeight: FontWeight.bold)),
                    //         ],
                    //       ),
                    //       SizedBox(height: 15,),
                    //       Row(
                    //         mainAxisAlignment: MainAxisAlignment.start,
                    //         children: [
                    //           Text('合计退款', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_46)),
                    //           SizedBox(width: 50,),
                    //           Text('退货退款', style: TextStyle(color: AppColors.COLOR_BLACK_222222, fontSize: AppFontsize.SIZE_48,fontWeight: FontWeight.bold)),
                    //         ],
                    //       )
                    //     ],
                    //   ),
                    // ),
                    SizedBox(height: 15,),
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('订单编号', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_46)),
                              SizedBox(width: 50,),
                              Expanded(child: Row(
                                mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(orderDetailModel.orderSn, style: TextStyle(color: AppColors.COLOR_BLACK_222222, fontSize: AppFontsize.SIZE_48,fontWeight: FontWeight.bold)),
                                  Text('复制', style: TextStyle(color: AppColors.COLOR_PRIMARY_D22315, fontSize: AppFontsize.SIZE_48)),
                                ],
                              ))
                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('申请时间', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_46)),
                              SizedBox(width: 50,),
                              Text(orderDetailModel.payTime, style: TextStyle(color: AppColors.COLOR_BLACK_222222, fontSize: AppFontsize.SIZE_48,fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                  ],
                )),
                Container(color: Colors.white, padding: EdgeInsets.fromLTRB(15, 10, 15, 10), child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    orderDetailModel.orderStatus == OrderStatusEnums.wait_pay ? Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: RadiusButton('取消订单', width: 300, height: 100, onTap: (){
                        AppAnimatedDialog.onShowAnimatedDialog(context, '确定取消该订单吗？', () async {
                          await logic.onOrderCancel(int.parse(id));
                          Get.back();
                          await Future.delayed(Duration(seconds: 1));
                          logic.onGetOrderDetail(int.parse(id));
                        });
                      }),
                    ) : SizedBox(),
                    orderDetailModel.orderStatus == OrderStatusEnums.wait_pay ?Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: RadiusButton('继续支付', width: 300, height: 100,),
                    ) : SizedBox(),
                    orderDetailModel.orderStatus == OrderStatusEnums.wait_receiving ? Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: RadiusButton('查看物流', width: 300, height: 100,),
                    )  : SizedBox(),
                    orderDetailModel.orderStatus == OrderStatusEnums.wait_receiving ? Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: RadiusButton('确认收货', width: 300, height: 100, onTap: (){
                        AppAnimatedDialog.onShowAnimatedDialog(context, '确定已收到货物吗？', () async {
                          await logic.onOrderConfirm(int.parse(id));
                          Get.back();
                          await Future.delayed(Duration(seconds: 1));
                          logic.onGetOrderDetail(int.parse(id));
                        });

                      },)
                    ) : SizedBox(),
                    orderDetailModel.orderStatus == OrderStatusEnums.finish ?  Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: RadiusButton('去评价', width: 300, height: 100,)
                    ): SizedBox(),
                    orderDetailModel.orderStatus == OrderStatusEnums.close ?Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: RadiusButton('删除订单', width: 300, height: 100, onTap: (){
                          AppAnimatedDialog.onShowAnimatedDialog(context, '确定删除该订单吗？', () async {
                            await logic.onOrderDel(int.parse(id));
                            Get.back();
                            await Future.delayed(Duration(seconds: 1));
                            Get.offNamed(RouteConfig.my_order);
                          });

                        },)
                    ) : SizedBox(),
                  ],
                ))
              ],
            ),
          );
        });
      }
      return SpinKit();
    });
  }

  Widget OrderStatusWidget(OrderDetailModel orderDetail) {
    OrderStatus orderStatus;
    OrderStatusItems.forEach((element) {
      if(element.status == orderDetail.orderStatus) {
        orderStatus = element;
      }
    });
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Image.asset(orderStatus.icon, width: ScreenUtil().setWidth(82), height: ScreenUtil().setWidth(82),),
         SizedBox(width: 5,),
         Text(orderStatus.text, style: TextStyle(color: Colors.white, fontSize: AppFontsize.SIZE_64),)
      ],
    );
  }


  Widget Step() {
    String statusText = '退款成功';
    int status = 1;
    List<StepListModel> list = [StepListModel(status: 1, text: '提交申请'), StepListModel(status:2, text: '商家审核'), StepListModel(status: 3, text: '商家同意退款')];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(statusText, style: TextStyle(color: Colors.white, fontSize: AppFontsize.SIZE_64)),
        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(list.length, (index) => Column(
            children: [
              Row(
                children: [
                  index != 0 ? Container(width: ScreenUtil().setWidth(130), height: 1, color: Colors.white,) : SizedBox(width: ScreenUtil().setWidth(130)),
                  status != list[index].status ? Container(
                    width: ScreenUtil().setWidth(31),
                    height: ScreenUtil().setWidth(31),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(ScreenUtil().setWidth(31))
                    ),
                  ) : Image.asset(AppImages.STEP_SUCCESS, width: ScreenUtil().setWidth(52), height: ScreenUtil().setWidth(52),),
                  index != list.length - 1 ? Container(width: ScreenUtil().setWidth(130), height: 1, color: Colors.white,) : SizedBox(width: ScreenUtil().setWidth(130))
                ],
              ),
              SizedBox(height: 10,),
              Text(list[index].text, style: TextStyle(color: Colors.white, fontSize: AppFontsize.SIZE_44))
            ],
          )),
        )
      ],
    );
  }


  Widget StepColumn() {
    String statusText = '退款成功';
    int status = 1;
    List<StepListModel> list = [StepListModel(status: 1, text: '提交申请'), StepListModel(status:2, text: '商家审核'), StepListModel(status: 3, text: '商家同意退款')];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(list.length, (index) {
        CrossAxisAlignment crossAlignment = CrossAxisAlignment.center;
        if (index == 0) {
          crossAlignment = CrossAxisAlignment.start;
        } else if(index == list.length - 1) {
          crossAlignment = CrossAxisAlignment.end;
        }
        return Row(
          crossAxisAlignment:  crossAlignment,
          children: [
            Column(
              children: [
                index != 0 ? Container(height: ScreenUtil().setWidth(35), width: 1, color: AppColors.COLOR_PRIMARY_D22315,) : SizedBox(height: 5,),
                Container(
                  width: ScreenUtil().setWidth(25),
                  height: ScreenUtil().setWidth(25),
                  decoration: BoxDecoration(
                      color: AppColors.COLOR_PRIMARY_D22315,
                      borderRadius: BorderRadius.circular(ScreenUtil().setWidth(25))
                  ),
                ),
                index != list.length - 1 ? Container(height: ScreenUtil().setWidth(35), width: 1, color: AppColors.COLOR_PRIMARY_D22315,) : SizedBox(height: 5,)
              ],
            ),
            SizedBox(width: 10,),
            Expanded(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(list[index].text, style: TextStyle(color: AppColors.COLOR_PRIMARY_D22315, fontSize: AppFontsize.SIZE_48)),
                Text(list[index].text, style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_46))
              ],
            ))
          ],
        );
      }),
    );
  }
}
