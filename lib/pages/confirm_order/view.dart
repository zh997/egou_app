import 'package:egou_app/common/routes.dart';
import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_radius.dart';
import 'package:egou_app/constant/app_space.dart';
import 'package:egou_app/models/address.dart';
import 'package:egou_app/models/order.dart';
import 'package:egou_app/pages/main/logic.dart';
import 'package:egou_app/pages/main/state.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/app_buttons.dart';
import 'package:egou_app/widgets/small_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';
import 'package:string_num_calculate/string_num_calculate.dart';

import 'logic.dart';
import 'state.dart';

class ConfirmOrderPage extends StatefulWidget {
  @override
  _ConfirmOrderPageState createState() => _ConfirmOrderPageState();
}

class _ConfirmOrderPageState extends State<ConfirmOrderPage> {
  final ConfirmOrderLogic logic = Get.put(ConfirmOrderLogic());
  final ConfirmOrderState state = Get.find<ConfirmOrderLogic>().state;
  final MainLogic mainLogic = Get.put(MainLogic());
  final MainState mainState = Get.find<MainLogic>().state;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: mainLogic.onGetAddressList(),builder: (BuildContext context, AsyncSnapshot snapshot){
       if(snapshot.connectionState == ConnectionState.done) {
         return Scaffold(
           appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title: '确认订单'),
           body: Obx((){
             double totalPrice = 0.00;
             int goodsNum = 0;
             if ( mainState.orderGoods.value.length > 0) {
               mainState.orderGoods.value.forEach((element) {
                 totalPrice = Calculate.plus(totalPrice, Calculate.multiply(element.num, double.parse(element.price)));
                 goodsNum = Calculate.plus(goodsNum, element.num);
               });
             }
             return Column(
               children: [
                 Expanded(child:  ListView(
                   children: [
                     GestureDetector(
                       behavior: HitTestBehavior.opaque,
                       onTap: () {
                         if (mainState.selectAddress.value.id != null) {
                           Get.toNamed(RouteConfig.address_page + '?isSelect=${1}');
                         } else {
                           Get.toNamed(RouteConfig.edit_address);
                         }
                       },
                       child: Container(
                         color: Colors.white,
                         alignment: Alignment.center,
                         height: ScreenUtil().setWidth(272),
                         margin: EdgeInsets.only(top: AppSpace.SPACE_40),
                         padding: EdgeInsets.only(right: 20, left: 20),
                         child: mainState.selectAddress.value.id != null ? _CurrentSelectedAddress() : _EmptyAddress(),
                       ),
                     ),
                     Container(
                       color: Colors.white,
                       margin: EdgeInsets.only(top: AppSpace.SPACE_40),
                       padding: EdgeInsets.only(right: 20, left: 20),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Container(
                             alignment: Alignment.centerLeft,
                             height: ScreenUtil().setWidth(150),
                             decoration: BoxDecoration(
                                 border: Border(bottom: BorderSide(width: 1, color:  AppColors.COLOR_GRAY_DDDDDD))
                             ),
                             child: Text('${goodsNum}件商品', style: TextStyle(
                                 fontSize: AppFontsize.SIZE_48,
                                 color: AppColors.COLOR_BLACK_222222
                             )),
                           ),
                           SizedBox(height: 15),
                           Column(
                             children: List.generate(mainState.orderGoods.value.length, (index) => _CartItem(context,
                                 mainState.orderGoods.value[index])),
                           )
                         ],
                       ),
                     ),
                     Container(
                       color: Colors.white,
                       margin: EdgeInsets.only(top: AppSpace.SPACE_40),
                       padding: EdgeInsets.all(20),
                       child: Column(
                         children: [
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text('商品总额', style: TextStyle(fontSize: AppFontsize.SIZE_46, color: AppColors.COLOR_GRAY_999999)),
                               Text('¥${totalPrice}', style: TextStyle(fontSize: AppFontsize.SIZE_46, color: AppColors.COLOR_BLACK_222222))
                             ],
                           ),
                           SizedBox(height: 10),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Text('运费', style: TextStyle(fontSize: AppFontsize.SIZE_46, color: AppColors.COLOR_GRAY_999999)),
                               Text('¥0.00', style: TextStyle(fontSize: AppFontsize.SIZE_46, color: AppColors.COLOR_BLACK_222222))
                             ],
                           )
                         ],
                       ),
                     ),
                     SizedBox(height: 20)
                   ],
                 )),
                 Container(
                   height: ScreenUtil().setWidth(250),
                   decoration: BoxDecoration(
                       color: Colors.white,
                       border: Border(top: BorderSide(width: 1, color: AppColors.COLOR_GRAY_DDDDDD))
                   ),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Row(
                         children: [
                           Padding(
                             padding: EdgeInsets.only(right: 10),
                             child: Text('应付金额', style: TextStyle(
                                 fontSize: AppFontsize.SIZE_48,
                                 color: AppColors.COLOR_BLACK_333333
                             )),
                           ) ,
                           Price(color: AppColors.COLOR_BLACK_333333,size: AppFontsize.SIZE_67, price: '${totalPrice}')
                         ],
                       ),
                       RadiusButton('结算', width: 410, onTap: (){
                         if (mainState.selectAddress.value.id != null) {
                           Get.toNamed(RouteConfig.pay_mode);
                         } else {
                           EasyLoading.showToast('请先添加收货地址');
                         }
                       })
                     ],
                   ),
                 )
               ],
             );
           }),
         );
       }
       return SizedBox();
    });
  }

  Widget _EmptyAddress() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(AppImages.ADD_ADDRESS_ICON, width: ScreenUtil().setWidth(131), height: ScreenUtil().setWidth(131)),
        SizedBox(height: 5),
        Text('您还没有收货地址，点击这里添加', style: TextStyle(
            color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_36
        ))
      ],
    );
  }

  Widget _CurrentSelectedAddress() {
    final item = mainState.selectAddress.value;
    final String address = item.province + item.city + item.district + item.address;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(item.contact, style: TextStyle(fontSize: AppFontsize.SIZE_48, color: AppColors.COLOR_BLACK_000000,fontWeight: FontWeight.bold)),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Text(item.telephone, style: TextStyle(fontSize: AppFontsize.SIZE_48, color: AppColors.COLOR_BLACK_000000,fontWeight: FontWeight.bold)),
                ),
                item.isDefault == 1 ? Container(
                  width: ScreenUtil().setWidth(137),
                  height: ScreenUtil().setWidth(79),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColors.COLOR_PRIMARY_FFF2F1,
                      borderRadius: BorderRadius.circular(AppRadius.RADIUS_11),
                      border: Border.all(width: 1, color: AppColors.COLOR_PRIMARY_FFF2F1)
                  ),
                  child: Text('默认', style: TextStyle(
                    color: AppColors.COLOR_PRIMARY_D22315,
                    fontSize: AppFontsize.SIZE_36,
                  ),),
                ) : SizedBox()
              ],
            ),
            SizedBox(height: 10),
            Text(address, style: TextStyle(
                color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_36
            ), maxLines: 1, overflow: TextOverflow.ellipsis,)
          ],
        ),
        Image.asset(AppImages.ARROW_RIGHT_ICON, width: ScreenUtil().setWidth(23), height: ScreenUtil().setWidth(52))
      ],
    );
  }


  Widget _CartItem(context, OrderGoodsModel item) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
            width:  ScreenUtil().setWidth(300),
            height:  ScreenUtil().setWidth(300),
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.COLOR_GRAY_F4F4F4, width: 3)
            ),
            child: Image.network(item.image, fit: BoxFit.cover),
          ),
          Expanded(child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(item.name, style: TextStyle(color: AppColors.COLOR_BLACK_222222, fontSize: AppFontsize.SIZE_48), maxLines: 2, overflow: TextOverflow.ellipsis,),
              SizedBox(height: 5),
              Text(item.goodsSpec.name, style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_41), maxLines: 1),
              SizedBox(height: 5),
              Text('数量 x${item.num}', style: TextStyle(color: AppColors.COLOR_GRAY_999999, fontSize: AppFontsize.SIZE_41), maxLines: 1),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Price(price: item.price,)
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
