import 'package:egou_app/constant/app_colors.dart';
import 'package:egou_app/constant/app_fontsize.dart';
import 'package:egou_app/constant/app_images.dart';
import 'package:egou_app/constant/app_radius.dart';
import 'package:egou_app/constant/app_space.dart';
import 'package:egou_app/constant/app_enums.dart';
import 'package:egou_app/models/order_pay_way.dart';
// import 'package:egou_app/models/user.dart';
// import 'package:egou_app/pages/main/logic.dart';
// import 'package:egou_app/pages/main/state.dart';
import 'package:egou_app/widgets/app_bar.dart';
import 'package:egou_app/widgets/app_buttons.dart';
import 'package:egou_app/widgets/small_widget.dart';
import 'package:egou_app/models/order_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'logic.dart';
import 'state.dart';



class PayModePage extends StatefulWidget {
  @override
  _PayModePageState createState() => _PayModePageState();
}

class _PayModePageState extends State<PayModePage> {
  String order_id = Get.parameters['order_id'];
  String from = Get.parameters['from'];
  final PayModeLogic logic = Get.put(PayModeLogic());
  final PayModeState state = Get.find<PayModeLogic>().state;
  // final MainState mainState = Get.find<MainLogic>().state;
  // final MainLogic mainLogic = Get.put(MainLogic());
  Future _future;

  final FocusNode _focusNode = FocusNode();
  final TextEditingController _pwdController = TextEditingController();
  bool isFocus = false;
  String pwd = '';
  int pay_way = PayMode.wechat;

  Future _onInitData() async {
    // await mainLogic.onGetUserInfo();
    await logic.onGetOrderDetail(int.parse(order_id));
    await logic.onGetPayWay(order_id);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus){
        setState(() {
          isFocus = true;
        });

      } else {
        setState(() {
          isFocus = false;
        });
      }
    });
    _future = _onInitData();
  }



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: _future, builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.connectionState == ConnectionState.done) {
        return Obx(() {
          // final UserInfoModel userinfo = mainState.userInfo.value;
          final OrderDetailModel orderDetailModel = state.orderDetail.value;
          final OrderPayWayModel orderPayWay = state.orderPayWay.value;
          return Scaffold(
            appBar: CustomAppBar(leading: Icon(Icons.arrow_back_ios_sharp, color: AppColors.COLOR_BLACK_333333),title: '支付方式'),
            body: ListView(
              children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(AppSpace.SPACE_52, 0, AppSpace.SPACE_52, 0),
                  margin: EdgeInsets.only(top: AppSpace.SPACE_40),
                  height: ScreenUtil().setWidth(186),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('订单金额', style: TextStyle(
                          fontSize: AppFontsize.SIZE_50,
                          color: AppColors.COLOR_BLACK_000000
                      )),
                      Price(price: orderDetailModel.orderAmount)
                    ],
                  ) ,
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.fromLTRB(AppSpace.SPACE_52, 0, AppSpace.SPACE_52, AppSpace.SPACE_52),
                  margin: EdgeInsets.only(top: AppSpace.SPACE_40),
                  child: Column(
                    children: [
                      Column(
                        children: List.generate(orderPayWay.pay.length, (index){
                          final Pay payItem = orderPayWay.pay[index];
                          return _payModeItem(PayMode.getIcon(payItem.payWay), payItem.name, payItem.payWay, num: payItem.money != "-1" ? payItem.money :null );
                        })
                       ),
                      // _payModeItem(AppImages.PAY_MODE_ICON_1, '余额支付', PayMode.balance, num: userinfo.userMoney),
                      // // shopType != 1 && shopType != 2 ? _payModeItem(AppImages.PAY_MODE_ICON_2, '金币支付', PayMode.wechat, num: '0.00') : SizedBox(),
                      // // shopType != 2 ?  _payModeItem(AppImages.PAY_MODE_ICON_3, '银币支付',PayMode.wechat, num: '0.00') : SizedBox(),
                      // _payModeItem(AppImages.PAY_MODE_ICON_4, '微信支付', PayMode.wechat ),
                      // _payModeItem(AppImages.PAY_MODE_ICON_5,'支付宝支付',  PayMode.alipay),
                      SizedBox(height: 20),
                      pay_way != PayMode.alipay && pay_way != PayMode.wechat ? Container(
                        alignment: Alignment.center,
                        // width: ScreenUtil().setWidth(895),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1, color: AppColors.COLOR_PRIMARY_D22315),
                            borderRadius: BorderRadius.circular(AppRadius.RADIUS_20)
                        ),
                        child:  Stack(
                          alignment: const FractionalOffset(0.5, 0.5),
                          children: [
                            !isFocus && !pwd.isNotEmpty ? Text('请填写6-20位交易密码',
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(60),
                                    color: AppColors.COLOR_PRIMARY_D22315,
                                    height: ScreenUtil().setHeight(4)
                                )
                            ): Text(''),
                            TextFormField(
                              focusNode: _focusNode,
                              controller: _pwdController,
                              onChanged: (String val) {setState(() {
                                pwd = val;
                              });},
                              textInputAction: TextInputAction.next,
                              maxLines: 1,
                              cursorColor: AppColors.COLOR_PRIMARY_D22315,
                              style: TextStyle(fontSize: ScreenUtil().setSp(80), color: AppColors.COLOR_PRIMARY_D22315),
                              obscureText: true,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                hasFloatingPlaceholder: false,
                                focusColor:  AppColors.COLOR_PRIMARY_D22315,
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.text,
                            )
                          ],
                        ),
                      ) : SizedBox()
                    ],
                  ) ,
                ),
                // Divider(height: 1,  color: AppColors.COLOR_GRAY_DDDDDD),
                SizedBox(height: 40),
                Container(
                  padding: EdgeInsets.fromLTRB(AppSpace.SPACE_52, 0, AppSpace.SPACE_52, AppSpace.SPACE_52),
                  child:  RadiusButton('结算', onTap: (){
                    final Map<String, dynamic> data = {};
                    data['pay_way'] = pay_way;
                    data['order_id'] = order_id;
                    data['from'] = from;
                    if ( data['pay_way'] != PayMode.wechat && data['pay_way'] != PayMode.alipay) {
                      data['pay_password'] = pwd;
                    }
                    // 订单支付
                    logic.onOrderPay(data);
                  }),
                )
              ],
            ),
          );
        });
      }
      return SpinKit();
    });
  }

  Widget _payModeItem(icon, text,int payWay, {num}) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
         setState(() {
           if (payWay != PayMode.balance) {
             FocusScope.of(context).unfocus();
           }
           pay_way = payWay;
         });
      },
      child: Container(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(
                  width: 1,
                  color: AppColors.COLOR_GRAY_EEEEEE
              ))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(icon, width: ScreenUtil().setWidth(74), height: ScreenUtil().setWidth(74)),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15),
                    child: Text(text, style:TextStyle(
                        fontSize: AppFontsize.SIZE_50, color: AppColors.COLOR_BLACK_000000
                    )),
                  ),
                  num != null ? Row(
                    children: [
                      Text('当前余额: ', style:TextStyle(
                          fontSize: AppFontsize.SIZE_42, color: AppColors.COLOR_GRAY_9E9E9E
                      )),
                      Text(num, style:TextStyle(
                          fontSize: AppFontsize.SIZE_42, color: AppColors.COLOR_PRIMARY_D22315
                      )),
                      Text('元', style:TextStyle(
                          fontSize: AppFontsize.SIZE_42, color: AppColors.COLOR_GRAY_9E9E9E
                      ))
                    ],
                  ): Text(''),
                ],
              ),
              pay_way == payWay ? Image.asset(AppImages.ICON_6, width: ScreenUtil().setWidth(52), height: ScreenUtil().setWidth(52)) :
              Image.asset(AppImages.ICON_5, width: ScreenUtil().setWidth(52), height: ScreenUtil().setWidth(52)),
            ],
          )
      ),
    );
  }
}
